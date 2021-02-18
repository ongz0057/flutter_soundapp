import 'dart:io';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:path_provider/path_provider.dart';
import 'questionnaire.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart' as Path;

String _uploadedAudioURL;
final _firestore = FirebaseFirestore.instance;
User loggedInUser;

class FeatureButtonsView extends StatefulWidget {
  final Function onUploadComplete;
  const FeatureButtonsView({
    Key key,
    @required this.onUploadComplete,
  }) : super(key: key);
  @override
  _FeatureButtonsViewState createState() => _FeatureButtonsViewState();
}

class _FeatureButtonsViewState extends State<FeatureButtonsView> {
  final _auth = FirebaseAuth.instance;
  bool _isPlaying;
  bool _isUploading;
  bool _isRecorded;
  bool _isRecording;

  AudioPlayer _audioPlayer;
  String _filePath;

  FlutterAudioRecorder _audioRecorder;

  @override
  void initState() {
    super.initState();
    _isPlaying = false;
    _isUploading = false;
    _isRecorded = false;
    _isRecording = false;
    _audioPlayer = AudioPlayer();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _isRecorded
          ? _isUploading
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: LinearProgressIndicator()),
                    Text('Uplaoding to Firebase'),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.replay),
                      onPressed: _onRecordAgainButtonPressed,
                    ),
                    IconButton(
                      icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                      onPressed: _onPlayButtonPressed,
                    ),
                    IconButton(
                      icon: Icon(Icons.upload_file),
                      onPressed: _onFileUploadButtonPressed,
                    ),
                  ],
                )
          : IconButton(
              icon: _isRecording
                  ? Icon(Icons.pause)
                  : Icon(Icons.fiber_manual_record),
              onPressed: _onRecordButtonPressed,
            ),
    );
  }

  Future<void> _onFileUploadButtonPressed() async {
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;

    // Reference firebaseStorageRef =
    // FirebaseStorage.instance.ref().child('Image/$fileName');
    // firebaseStorageRef.getDownloadURL().then((imageURL) async {
    //   CollectionReference imageRef =
    //   FirebaseFirestore.instance.collection('userdata');
    //   _uploadedImageURL = imageURL;
    //   if (_uploadedImageURL != null) {
    //     await imageRef.doc(loggedInUser.uid).update({
    //       'Image': _uploadedImageURL,
    //     });
    //   }
    // })

    setState(() {
      _isUploading = true;
    });
    try {
      String fileName = Path.basename(
          _filePath.substring(_filePath.lastIndexOf('/'), _filePath.length));
      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child('Audio/$fileName');
      await firebaseStorageRef.putFile(File(_filePath));

      firebaseStorageRef.getDownloadURL().then((audioURL) async {
        CollectionReference audioRef =
            FirebaseFirestore.instance.collection('userdata');
        _uploadedAudioURL = audioURL;
        if (_uploadedAudioURL != null) {
          await audioRef.doc(loggedInUser.uid).update({
            'Audio': _uploadedAudioURL,
          });
        }
      });
      // .ref('upload-voice-firebase')
      // .child(
      //     _filePath.substring(_filePath.lastIndexOf('/'), _filePath.length))
      // .putFile(File(_filePath));
      widget.onUploadComplete();
    } finally {
      setState(() {
        _isUploading = false;
      });
    }
  }

  void _onRecordAgainButtonPressed() {
    setState(() {
      _isRecorded = false;
    });
  }

  Future<void> _onRecordButtonPressed() async {
    if (_isRecording) {
      _audioRecorder.stop();
      _isRecording = false;
      _isRecorded = true;
    } else {
      _isRecorded = false;
      _isRecording = true;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Questionnaire(),
        ),
      );

      await _startRecording();
      Timer(Duration(seconds: 3), () async {
        await _audioRecorder.stop();
        _isRecording = false;
        _isRecorded = true;
        setState(() {});
        _onFileUploadButtonPressed();
      });
    }
    // setState(() {});
  }

  void _onPlayButtonPressed() {
    if (!_isPlaying) {
      _isPlaying = true;

      _audioPlayer.play(_filePath, isLocal: true);
      _audioPlayer.onPlayerCompletion.listen((duration) {
        setState(() {
          _isPlaying = false;
        });
      });
    } else {
      _audioPlayer.pause();
      _isPlaying = false;
    }
    setState(() {});
  }

  Future<void> _startRecording() async {
    final bool hasRecordingPermission =
        await FlutterAudioRecorder.hasPermissions;
    if (hasRecordingPermission) {
      Directory directory = await getApplicationDocumentsDirectory();
      String filepath = directory.path +
          '/' +
          DateTime.now().millisecondsSinceEpoch.toString() +
          '.aac';
      _audioRecorder =
          FlutterAudioRecorder(filepath, audioFormat: AudioFormat.AAC);
      await _audioRecorder.initialized;
      _audioRecorder.start();
      _filePath = filepath;
      setState(() {});
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Center(
          child: Text('Please enable recording permission'),
        ),
      ));
    }
  }
}

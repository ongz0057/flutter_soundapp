import 'dart:io';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:flutter_soundapp/ReusableCard.dart';
import 'package:path_provider/path_provider.dart';
import 'questionnaire.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart' as Path;
import 'constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'iconContent.dart';
import 'package:provider/provider.dart';

String _uploadedAudioURL;
final _firestore = FirebaseFirestore.instance;
User loggedInUser;
String maxDB;
String meanDB;

class UpdateRecording extends ChangeNotifier {
  bool recordingStatus = true;
  // widget.isRecording get => _recordingStatus;
  toggle() {
    recordingStatus = !recordingStatus;
    notifyListeners();
  }
}

class FeatureButtonsView extends StatefulWidget {
  final Function onUploadComplete;
  final String docID;
  const FeatureButtonsView({
    Key key,
    @required this.onUploadComplete,
    this.docID,
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
                    Text('Uploading to Firebase'),
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
          : Expanded(
              child: ReusableCard(
                onPress: () {
                  _onRecordButtonPressed();
                },
                colour: kInactiveCardColour,
                cardChild: IconContent(
                  icon: FontAwesomeIcons.microphone,
                  label: 'Tap to record a 3-minute audio of your surroundings',
                ),
              ),
            ),
      //   IconButton(
      //           icon: _isRecording
      //               ? Icon(Icons.pause)
      //               : Icon(Icons.fiber_manual_record),
      //           onPressed: _onRecordButtonPressed,
      //         ),
    );
  }

  Future<void> _onFileUploadButtonPressed() async {
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;

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
        CollectionReference audioRef = FirebaseFirestore.instance
            .collection('userdata')
            .doc(loggedInUser.uid)
            .collection('subcollection');
        _uploadedAudioURL = audioURL;
        if (_uploadedAudioURL != null) {
          await audioRef.doc(widget.docID).update({
            'Audio': _uploadedAudioURL,
            'SPL': _audioRecorder.recording.metering.averagePower.toString(),
            // 'SPL': meanDB,
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
          builder: (context) => Questionnaire(
            docID: widget.docID,
            isRecording: _isRecording,
          ),
        ),
      );

      await _startRecording();

      Timer(Duration(seconds: 181), () async {
        await _audioRecorder.stop();
        Provider.of<UpdateRecording>(context, listen: false).toggle();
        _isRecording = false;
        _isRecorded = true;
        setState(() {});
        _onFileUploadButtonPressed();
      });
    }
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

      print('starting stream');
      // await start();
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

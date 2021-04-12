import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_soundapp/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'bottomBtn.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'home_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String _uploadedImageURL;
final _firestore = FirebaseFirestore.instance;
User loggedInUser;

class TakeImage extends StatefulWidget {
  final String docID;
  TakeImage({Key key, @required this.docID}) : super(key: key);

  @override
  _TakeImageState createState() => _TakeImageState();
}

class _TakeImageState extends State<TakeImage> {
  File _image;
  final picker = ImagePicker();
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();

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

  Future getImage() async {
    final image = await picker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(image.path);
    });
  }

  Future uploadPic(BuildContext context) async {
    String fileName = basename(_image.path);
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('Image/$fileName');
    UploadTask uploadTask = firebaseStorageRef.putFile(_image);
    TaskSnapshot taskSnapshot = await uploadTask;

    firebaseStorageRef.getDownloadURL().then((imageURL) async {
      CollectionReference imageRef = FirebaseFirestore.instance
          .collection('userdata')
          .doc(loggedInUser.uid)
          .collection('subcollection');
      _uploadedImageURL = imageURL;
      if (_uploadedImageURL != null) {
        await imageRef.doc(widget.docID).update({
          'Image': _uploadedImageURL,
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
                child: _image == null
                    ? Text("Capture an image of your surroundings",
                        style: kLabelTextStyle)
                    : Image.file(_image)),
          ),
          FloatingActionButton(
            onPressed: getImage,
            tooltip: 'Increment',
            child: Icon(Icons.camera_alt),
          ),
          Visibility(
            visible: _image != null,
            child: BottomButton(
              buttonTitle: 'Next',
              onTap: () {
                uploadPic(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeView(docID: widget.docID),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

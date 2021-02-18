import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'audioButton.dart';
import 'audioList.dart';
import 'bottomBtn.dart';
import 'question.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class RecorderHomeView extends StatefulWidget {
  final String _title;

  const RecorderHomeView({Key key, @required String title})
      : assert(title != null),
        _title = title,
        super(key: key);

  @override
  _RecorderHomeViewState createState() => _RecorderHomeViewState();
}

class _RecorderHomeViewState extends State<RecorderHomeView> {
  Directory appDirectory;
  Stream<FileSystemEntity> fileStream;
  List<String> records;

  @override
  void initState() {
    super.initState();
    records = [];
    getApplicationDocumentsDirectory().then((value) {
      appDirectory = value;
      appDirectory.list().listen((onData) {
        records.add(onData.path);
      }).onDone(() {
        records = records.reversed.toList();
        setState(() {});
      });
    });
  }

  @override
  void dispose() {
    fileStream = null;
    appDirectory = null;
    records = null;
    super.dispose();
  }

  // Future uploadSound(BuildContext context) async {
  //   String fileName = basename(records.last);
  //   Reference firebaseStorageRef =
  //       FirebaseStorage.instance.ref().child(fileName);
  //   UploadTask uploadTask = firebaseStorageRef.putFile(records.last);
  //   TaskSnapshot taskSnapshot = await uploadTask;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Expanded(
          //   flex: 2,
          //   child: RecordListView(
          //     records: records,
          //   ),
          // ),
          Expanded(
            // flex: 1,
            child: RecorderView(
              onSaved: _onRecordComplete,
            ),
          ),
          Visibility(
            visible: records != null,
            child: BottomButton(
              buttonTitle: 'Next',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuestionForm(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  _onRecordComplete() {
    records.clear();
    appDirectory.list().listen((onData) {
      records.add(onData.path);
    }).onDone(() {
      records.sort();
      records = records.reversed.toList();
      setState(() {});
    });
  }
}

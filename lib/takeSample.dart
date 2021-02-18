import 'package:flutter/material.dart';
import 'takeAudio.dart';
import 'takeImage.dart';
import 'question.dart';

class TakeSample extends StatefulWidget {
  @override
  _TakeSample createState() => new _TakeSample();
}

class _TakeSample extends State<TakeSample> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment
                .center, //align buttons in column to center (vertical)
            crossAxisAlignment: CrossAxisAlignment
                .center, // align buttons in column to center (horizontal)
            children: <Widget>[
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                padding: EdgeInsets.all(16.0),
                splashColor: Colors.blueAccent,
                child: Text('Take Image'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TakeImage()));
                },
              ),
              SizedBox(
                height: 20.0,
                width: double.infinity,
              ),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                padding: EdgeInsets.all(16.0),
                splashColor: Colors.blueAccent,
                child: Text('Take Audio'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RecorderHomeView(title: 'Flutter Voice'),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 20.0,
                width: double.infinity,
              ),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                padding: EdgeInsets.all(16.0),
                splashColor: Colors.blueAccent,
                child: Text('Next'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuestionForm(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

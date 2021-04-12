import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_soundapp/feature_buttons_view.dart';
import 'package:flutter_soundapp/takeImage.dart';
import 'package:provider/provider.dart';
import 'question.dart';
import 'home_view.dart';
import 'welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    SoundApp(),
  );
}

class SoundApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UpdateRecording>(
      create: (_) => UpdateRecording(),
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21),
        ),
        // Start the app with the "/" named route. In this case, the app starts
// on the FirstScreen widget.
        initialRoute: '/',
        routes: {
// When navigating to the "/" route, build the FirstScreen widget.
          '/': (context) => WelcomeScreen(),
// When navigating to the "/second" route, build the SecondScreen widget.
          '/second': (context) => TakeImage(),
          '/third': (context) => HomeView(),
          '/fourth': (context) => QuestionForm()
        },
      ),
    );
  }
}

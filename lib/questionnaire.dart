import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'iconContent.dart';
import 'ReusableCard.dart';
import 'roundIconBtn.dart';
import 'bottomBtn.dart';
import 'takeImage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'QuestionCard.dart';
import 'questionContent.dart';
import 'Demographic.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firestore = FirebaseFirestore.instance;
User loggedInUser;

class Questionnaire extends StatefulWidget {
  @override
  _QuestionnaireState createState() => _QuestionnaireState();
}

enum option1 {
  NotAtAll,
  ALittle,
  Moderately,
  ALot,
  DominatesCompletely,
}

enum option2 {
  StronglyAgree,
  Agree,
  NeitherAgreeNorDisagree,
  Disagree,
  StronglyDisagree,
}

enum option3 {
  VeryGood,
  Good,
  NeitherGoodNorBad,
  Bad,
  VeryBad,
}

enum option4 {
  NotAtAll,
  Slightly,
  Moderately,
  Very,
  Perfectly,
}

class _QuestionnaireState extends State<Questionnaire> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  option1 selectedOption1a;
  String option1aSelected;
  option1 selectedOption1b;
  String option1bSelected;
  option1 selectedOption1c;
  String option1cSelected;
  option1 selectedOption1d;
  String option1dSelected;

  option2 selectedOption2a;
  String option2aSelected;
  option2 selectedOption2b;
  String option2bSelected;
  option2 selectedOption2c;
  String option2cSelected;
  option2 selectedOption2d;
  String option2dSelected;
  option2 selectedOption2e;
  String option2eSelected;
  option2 selectedOption2f;
  String option2fSelected;
  option2 selectedOption2g;
  String option2gSelected;
  option2 selectedOption2h;
  String option2hSelected;

  option3 selectedOption3;
  String option3Selected;

  option4 selectedOption4;
  String option4Selected;

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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Questionnaire'),
      ),
      body: ListView(
        children: <Widget>[
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
              Widget>[
            Text(
                'To what extend do you presently hear the following four types of sounds?\n\n'),
            Text('Traffic noise(e.g., cars, buses, trains, air planes)'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption1a = option1.NotAtAll;
                      option1aSelected = 'Not at all';
                    });
                  },
                  colour: selectedOption1a == option1.NotAtAll
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Not at all',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption1a = option1.ALittle;
                      option1aSelected = 'A little';
                    });
                  },
                  colour: selectedOption1a == option1.ALittle
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'A little',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption1a = option1.Moderately;
                      option1aSelected = 'Moderately';
                    });
                  },
                  colour: selectedOption1a == option1.Moderately
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Moderately',
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption1a = option1.ALot;
                      option1aSelected = 'A lot';
                    });
                  },
                  colour: selectedOption1a == option1.ALot
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'A lot',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption1a = option1.DominatesCompletely;
                      option1aSelected = 'Dominates completely';
                    });
                  },
                  colour: selectedOption1a == option1.DominatesCompletely
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Dominates completely',
                  ),
                ),
              ],
            ),
            Text(
                'Other noise (e.g., sirens, construction, industry, loading of goods)'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption1b = option1.NotAtAll;
                      option1bSelected = 'Not at all';
                    });
                  },
                  colour: selectedOption1b == option1.NotAtAll
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Not at all',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption1b = option1.ALittle;
                      option1bSelected = 'A little';
                    });
                  },
                  colour: selectedOption1b == option1.ALittle
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'A little',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption1b = option1.Moderately;
                      option1bSelected = 'Moderately';
                    });
                  },
                  colour: selectedOption1b == option1.Moderately
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Moderately',
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption1b = option1.ALot;
                      option1bSelected = 'A lot';
                    });
                  },
                  colour: selectedOption1b == option1.ALot
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'A lot',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption1b = option1.DominatesCompletely;
                      option1bSelected = 'Dominates completely';
                    });
                  },
                  colour: selectedOption1b == option1.DominatesCompletely
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Dominates completely',
                  ),
                ),
              ],
            ),
            Text(
                'Sounds from human beings (e.g., conversation, laughter, children at play, footsteps)'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption1c = option1.NotAtAll;
                      option1cSelected = 'Not at all';
                    });
                  },
                  colour: selectedOption1c == option1.NotAtAll
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Not at all',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption1c = option1.ALittle;
                      option1cSelected = 'A little';
                    });
                  },
                  colour: selectedOption1c == option1.ALittle
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'A little',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption1c = option1.Moderately;
                      option1cSelected = 'Moderately';
                    });
                  },
                  colour: selectedOption1c == option1.Moderately
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Moderately',
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption1c = option1.ALot;
                      option1cSelected = 'A lot';
                    });
                  },
                  colour: selectedOption1c == option1.ALot
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'A lot',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption1c = option1.DominatesCompletely;
                      option1cSelected = 'Dominates completely';
                    });
                  },
                  colour: selectedOption1c == option1.DominatesCompletely
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Dominates completely',
                  ),
                ),
              ],
            ),
            Text(
                'Natural sounds (e.g., singing birds, flowing water, wind in vegetation)'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption1d = option1.NotAtAll;
                      option1dSelected = 'Not at all';
                    });
                  },
                  colour: selectedOption1d == option1.NotAtAll
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Not at all',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption1d = option1.ALittle;
                      option1dSelected = 'A little';
                    });
                  },
                  colour: selectedOption1d == option1.ALittle
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'A little',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption1d = option1.Moderately;
                      option1dSelected = 'Moderately';
                    });
                  },
                  colour: selectedOption1d == option1.Moderately
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Moderately',
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption1d = option1.ALot;
                      option1dSelected = 'A lot';
                    });
                  },
                  colour: selectedOption1d == option1.ALot
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'A lot',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption1d = option1.DominatesCompletely;
                      option1dSelected = 'Dominates completely';
                    });
                  },
                  colour: selectedOption1d == option1.DominatesCompletely
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Dominates completely',
                  ),
                ),
              ],
            ),
            Text(
                'For each of the 8 scales below, to what extend do you agree or disagree that the present surrounding sound environment is?\n\n'),
            Text('-Pleasant'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2a = option2.StronglyAgree;
                      option2aSelected = 'Strongly agree';
                    });
                  },
                  colour: selectedOption2a == option2.StronglyAgree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Strongly agree',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2a = option2.Agree;
                      option2aSelected = 'Agree';
                    });
                  },
                  colour: selectedOption2a == option2.Agree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Agree',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2a = option2.NeitherAgreeNorDisagree;
                      option2aSelected = 'Neither agree nor disagree';
                    });
                  },
                  colour: selectedOption2a == option2.NeitherAgreeNorDisagree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Neither agree nor disagree',
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2a = option2.Disagree;
                      option2aSelected = 'Disagree';
                    });
                  },
                  colour: selectedOption2a == option2.Disagree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Disagree',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2a = option2.StronglyDisagree;
                      option2aSelected = 'Strongly disagree';
                    });
                  },
                  colour: selectedOption2a == option2.StronglyDisagree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Strongly disagree',
                  ),
                ),
              ],
            ),
            Text('-Chaotic'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2b = option2.StronglyAgree;
                      option2bSelected = 'Strongly agree';
                    });
                  },
                  colour: selectedOption2b == option2.StronglyAgree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Strongly agree',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2b = option2.Agree;
                      option2bSelected = 'Agree';
                    });
                  },
                  colour: selectedOption2b == option2.Agree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Agree',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2b = option2.NeitherAgreeNorDisagree;
                      option2bSelected = 'Neither agree nor disagree';
                    });
                  },
                  colour: selectedOption2b == option2.NeitherAgreeNorDisagree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Neither agree nor disagree',
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2b = option2.Disagree;
                      option2bSelected = 'Disagree';
                    });
                  },
                  colour: selectedOption2b == option2.Disagree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Disagree',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2b = option2.StronglyDisagree;
                      option2bSelected = 'Strongly disagree';
                    });
                  },
                  colour: selectedOption2b == option2.StronglyDisagree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Strongly disagree',
                  ),
                ),
              ],
            ),
            Text('-Vibrant'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2c = option2.StronglyAgree;
                      option2cSelected = 'Strongly agree';
                    });
                  },
                  colour: selectedOption2c == option2.StronglyAgree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Strongly agree',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2c = option2.Agree;
                      option2cSelected = 'Agree';
                    });
                  },
                  colour: selectedOption2c == option2.Agree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Agree',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2c = option2.NeitherAgreeNorDisagree;
                      option2cSelected = 'Neither agree nor disagree';
                    });
                  },
                  colour: selectedOption2c == option2.NeitherAgreeNorDisagree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Neither agree nor disagree',
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2c = option2.Disagree;
                      option2cSelected = 'Disagree';
                    });
                  },
                  colour: selectedOption2c == option2.Disagree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Disagree',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2c = option2.StronglyDisagree;
                      option2cSelected = 'Strongly disagree';
                    });
                  },
                  colour: selectedOption2c == option2.StronglyDisagree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Strongly disagree',
                  ),
                ),
              ],
            ),
            Text('-Uneventful'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2d = option2.StronglyAgree;
                      option2dSelected = 'Strongly agree';
                    });
                  },
                  colour: selectedOption2d == option2.StronglyAgree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Strongly agree',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2d = option2.Agree;
                      option2dSelected = 'Agree';
                    });
                  },
                  colour: selectedOption2d == option2.Agree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Agree',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2d = option2.NeitherAgreeNorDisagree;
                      option2dSelected = 'Neither agree nor disagree';
                    });
                  },
                  colour: selectedOption2d == option2.NeitherAgreeNorDisagree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Neither agree nor disagree',
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2d = option2.Disagree;
                      option2dSelected = 'Disagree';
                    });
                  },
                  colour: selectedOption2d == option2.Disagree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Disagree',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2d = option2.StronglyDisagree;
                      option2dSelected = 'Strongly disagree';
                    });
                  },
                  colour: selectedOption2d == option2.StronglyDisagree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Strongly disagree',
                  ),
                ),
              ],
            ),
            Text('-Calm'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2e = option2.StronglyAgree;
                      option2eSelected = 'Strongly agree';
                    });
                  },
                  colour: selectedOption2e == option2.StronglyAgree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Strongly agree',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2e = option2.Agree;
                      option2eSelected = 'Agree';
                    });
                  },
                  colour: selectedOption2e == option2.Agree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Agree',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2e = option2.NeitherAgreeNorDisagree;
                      option2eSelected = 'Neither agree nor disagree';
                    });
                  },
                  colour: selectedOption2e == option2.NeitherAgreeNorDisagree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Neither agree nor disagree',
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2e = option2.Disagree;
                      option2eSelected = 'Disagree';
                    });
                  },
                  colour: selectedOption2e == option2.Disagree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Disagree',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2e = option2.StronglyDisagree;
                      option2eSelected = 'Strongly disagree';
                    });
                  },
                  colour: selectedOption2e == option2.StronglyDisagree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Strongly disagree',
                  ),
                ),
              ],
            ),
            Text('-Annoying'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2f = option2.StronglyAgree;
                      option2fSelected = 'Strongly agree';
                    });
                  },
                  colour: selectedOption2f == option2.StronglyAgree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Strongly agree',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2f = option2.Agree;
                      option2fSelected = 'Agree';
                    });
                  },
                  colour: selectedOption2f == option2.Agree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Agree',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2f = option2.NeitherAgreeNorDisagree;
                      option2fSelected = 'Neither agree nor disagree';
                    });
                  },
                  colour: selectedOption2f == option2.NeitherAgreeNorDisagree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Neither agree nor disagree',
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2f = option2.Disagree;
                      option2fSelected = 'Disagree';
                    });
                  },
                  colour: selectedOption2f == option2.Disagree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Disagree',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2f = option2.StronglyDisagree;
                      option2fSelected = 'Strongly disagree';
                    });
                  },
                  colour: selectedOption2f == option2.StronglyDisagree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Strongly disagree',
                  ),
                ),
              ],
            ),
            Text('-Eventful'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2g = option2.StronglyAgree;
                      option2gSelected = 'Strongly agree';
                    });
                  },
                  colour: selectedOption2g == option2.StronglyAgree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Strongly agree',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2g = option2.Agree;
                      option2gSelected = 'Agree';
                    });
                  },
                  colour: selectedOption2g == option2.Agree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Agree',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2g = option2.NeitherAgreeNorDisagree;
                      option2gSelected = 'Neither agree nor disagree';
                    });
                  },
                  colour: selectedOption2g == option2.NeitherAgreeNorDisagree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Neither agree nor disagree',
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2g = option2.Disagree;
                      option2gSelected = 'Disagree';
                    });
                  },
                  colour: selectedOption2g == option2.Disagree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Disagree',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2g = option2.StronglyDisagree;
                      option2gSelected = 'Strongly disagree';
                    });
                  },
                  colour: selectedOption2g == option2.StronglyDisagree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Strongly disagree',
                  ),
                ),
              ],
            ),
            Text('-Monotonous'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2h = option2.StronglyAgree;
                      option2hSelected = 'Strongly agree';
                    });
                  },
                  colour: selectedOption2h == option2.StronglyAgree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Strongly agree',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2h = option2.Agree;
                      option2hSelected = 'Agree';
                    });
                  },
                  colour: selectedOption2h == option2.Agree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Agree',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2h = option2.NeitherAgreeNorDisagree;
                      option2hSelected = 'Neither agree nor disagree';
                    });
                  },
                  colour: selectedOption2h == option2.NeitherAgreeNorDisagree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Neither agree nor disagree',
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2h = option2.Disagree;
                      option2hSelected = 'Disagree';
                    });
                  },
                  colour: selectedOption2h == option2.Disagree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Disagree',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption2h = option2.StronglyDisagree;
                      option2hSelected = 'Strongly disagree';
                    });
                  },
                  colour: selectedOption2h == option2.StronglyDisagree
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Strongly disagree',
                  ),
                ),
              ],
            ),
            Text(
                'Overall, how would you describe the present surrounding sound environment?'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption3 = option3.VeryGood;
                      option3Selected = 'Very good';
                    });
                  },
                  colour: selectedOption3 == option3.VeryGood
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Very good',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption3 = option3.Good;
                      option3Selected = 'Good';
                    });
                  },
                  colour: selectedOption3 == option3.Good
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Good',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption3 = option3.NeitherGoodNorBad;
                      option3Selected = 'Neither good nor bad';
                    });
                  },
                  colour: selectedOption3 == option3.NeitherGoodNorBad
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Neither good nor bad',
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption3 = option3.Bad;
                      option3Selected = 'Bad';
                    });
                  },
                  colour: selectedOption3 == option3.Bad
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Bad',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption3 = option3.VeryBad;
                      option3Selected = 'Very bad';
                    });
                  },
                  colour: selectedOption3 == option3.VeryBad
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Very bad',
                  ),
                ),
              ],
            ),
            Text(
                'Overall, to what extent is the present surrounding environment appropriate to the present place?'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption4 = option4.NotAtAll;
                      option4Selected = 'Not at all';
                    });
                  },
                  colour: selectedOption4 == option4.NotAtAll
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Not at all',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption4 = option4.Slightly;
                      option4Selected = 'Slightly';
                    });
                  },
                  colour: selectedOption4 == option4.Slightly
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Slightly',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption4 = option4.Moderately;
                      option4Selected = 'Moderately';
                    });
                  },
                  colour: selectedOption4 == option4.Moderately
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Moderately',
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption4 = option4.Very;
                      option4Selected = 'Very';
                    });
                  },
                  colour: selectedOption4 == option4.Very
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Very',
                  ),
                ),
                QuestionCard(
                  onPress: () {
                    setState(() {
                      selectedOption4 = option4.Perfectly;
                      option4Selected = 'Perfectly';
                    });
                  },
                  colour: selectedOption4 == option4.Perfectly
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: QuestionContent(
                    label: 'Perfectly',
                  ),
                ),
              ],
            ),
            BottomButton(
              buttonTitle: 'Submit',
              onTap: () {
                _firestore.collection('userdata').doc(loggedInUser.uid).update({
                  '1a': option1aSelected,
                  '1b': option1bSelected,
                  '1c': option1cSelected,
                  '1d': option1dSelected,
                  '2a': option2aSelected,
                  '2b': option2bSelected,
                  '2c': option2cSelected,
                  '2d': option2dSelected,
                  '2e': option2eSelected,
                  '2f': option2fSelected,
                  '2g': option2gSelected,
                  '2h': option2hSelected,
                  '3': option3Selected,
                  '4': option4Selected,
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DemoPage(),
                  ),
                );
              },
            ),
          ]),
        ],
      ),
    );
  }
}

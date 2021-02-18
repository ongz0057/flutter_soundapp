import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'bottomBtn.dart';
import 'Demographic.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Define a custom Form widget.
class QuestionForm extends StatefulWidget {
  @override
  QuestionFormState createState() {
    return QuestionFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class QuestionFormState extends State<QuestionForm> {
  final _firestore = FirebaseFirestore.instance;
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        title: Text('Questionnaire'),
      ),
      body: SafeArea(
        child: Form(
          child: Expanded(
            child: ListView(
              children: <Widget>[
                FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Text(
                          'To what extend do you presently hear the following four types of sounds?\n'),
                      FormBuilderRadioGroup(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                          labelText:
                              'Traffic noise(e.g., cars, buses, trains, air planes)',
                        ),
                        separator: null,
                        name: 'Question 1.1',
                        initialValue: 'Not at all',
                        options: [
                          'Not at all',
                          'A little',
                          'Moderately',
                          'A lot',
                          'Dominates completely'
                        ]
                            .map((lang) => FormBuilderFieldOption(value: lang))
                            .toList(growable: false),
                      ),
                      FormBuilderRadioGroup(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                          labelText:
                              'Other noise (e.g., sirens, construction, industry, loading of goods)',
                        ),
                        separator: null,
                        name: 'Question 1.2',
                        options: [
                          'Not at all',
                          'A little',
                          'Moderately',
                          'A lot',
                          'Dominates completely'
                        ]
                            .map((lang) => FormBuilderFieldOption(value: lang))
                            .toList(growable: false),
                      ),
                      FormBuilderRadioGroup(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                          labelText:
                              'Sounds from human beings (e.g., conversation, laughter, children at play, footsteps)',
                        ),
                        separator: null,
                        name: 'Question 1.3',
                        options: [
                          'Not at all',
                          'A little',
                          'Moderately',
                          'A lot',
                          'Dominates completely'
                        ]
                            .map((lang) => FormBuilderFieldOption(value: lang))
                            .toList(growable: false),
                      ),
                      FormBuilderRadioGroup(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                          labelText:
                              'Natural sounds (e.g., singing birds, flowing water, wind in vegetation)',
                        ),
                        name: 'Question 1.4',
                        options: [
                          'Not at all',
                          'A little',
                          'Moderately',
                          'A lot',
                          'Dominates completely'
                        ]
                            .map((lang) => FormBuilderFieldOption(value: lang))
                            .toList(growable: false),
                      ),
                      Text(
                          'For each of the 8 scales below, to what extend do you agree or disagree that the present surrounding sound environment is?\n'),
                      FormBuilderRadioGroup(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                          labelText: 'Pleasant',
                        ),
                        name: 'Question 2.1',
                        options: [
                          'Strongly agree',
                          'Agree',
                          'Neither agree nor disagree',
                          'Disagree',
                          'Strongly disagree'
                        ]
                            .map((lang) => FormBuilderFieldOption(value: lang))
                            .toList(growable: false),
                      ),
                      FormBuilderRadioGroup(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                          labelText: 'Chaotic',
                        ),
                        name: 'Question 2.2',
                        options: [
                          'Strongly agree',
                          'Agree',
                          'Neither agree nor disagree',
                          'Disagree',
                          'Strongly disagree'
                        ]
                            .map((lang) => FormBuilderFieldOption(value: lang))
                            .toList(growable: false),
                      ),
                      FormBuilderRadioGroup(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                          labelText: 'Vibrant',
                        ),
                        name: 'Question 2.3',
                        options: [
                          'Strongly agree',
                          'Agree',
                          'Neither agree nor disagree',
                          'Disagree',
                          'Strongly disagree'
                        ]
                            .map((lang) => FormBuilderFieldOption(value: lang))
                            .toList(growable: false),
                      ),
                      FormBuilderRadioGroup(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                          labelText: 'Uneventful',
                        ),
                        name: 'Question 2.4',
                        options: [
                          'Strongly agree',
                          'Agree',
                          'Neither agree nor disagree',
                          'Disagree',
                          'Strongly disagree'
                        ]
                            .map((lang) => FormBuilderFieldOption(value: lang))
                            .toList(growable: false),
                      ),
                      FormBuilderRadioGroup(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                          labelText: 'Calm',
                        ),
                        name: 'Question 2.5',
                        options: [
                          'Strongly agree',
                          'Agree',
                          'Neither agree nor disagree',
                          'Disagree',
                          'Strongly disagree'
                        ]
                            .map((lang) => FormBuilderFieldOption(value: lang))
                            .toList(growable: false),
                      ),
                      FormBuilderRadioGroup(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                          labelText: 'Annoying',
                        ),
                        name: 'Question 2.6',
                        options: [
                          'Strongly agree',
                          'Agree',
                          'Neither agree nor disagree',
                          'Disagree',
                          'Strongly disagree'
                        ]
                            .map((lang) => FormBuilderFieldOption(value: lang))
                            .toList(growable: false),
                      ),
                      FormBuilderRadioGroup(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                          labelText: 'Eventful',
                        ),
                        name: 'Question 2.7',
                        options: [
                          'Strongly agree',
                          'Agree',
                          'Neither agree nor disagree',
                          'Disagree',
                          'Strongly disagree'
                        ]
                            .map((lang) => FormBuilderFieldOption(value: lang))
                            .toList(growable: false),
                      ),
                      FormBuilderRadioGroup(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                          labelText: 'Monotonous',
                        ),
                        name: 'Question 2.8',
                        options: [
                          'Strongly agree',
                          'Agree',
                          'Neither agree nor disagree',
                          'Disagree',
                          'Strongly disagree'
                        ]
                            .map((lang) => FormBuilderFieldOption(value: lang))
                            .toList(growable: false),
                      ),
                      Text(
                          'Overall, how would you describe the present surrounding sound environment?\n'),
                      FormBuilderRadioGroup(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                        ),
                        name: 'Question 3',
                        options: [
                          'Very good',
                          'Good',
                          'Neither good, nor bad',
                          'Bad',
                          'Very bad'
                        ]
                            .map((lang) => FormBuilderFieldOption(value: lang))
                            .toList(growable: false),
                      ),
                      Text(
                          'Overall, to what extent is the present surrounding environment appropriate to the present place?\n'),
                      FormBuilderRadioGroup(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                        ),
                        name: 'Question 4',
                        options: [
                          'Not at all',
                          'Slightly',
                          'Moderately',
                          'Very',
                          'Perfectly'
                        ]
                            .map((lang) => FormBuilderFieldOption(value: lang))
                            .toList(growable: false),
                      ),
                      BottomButton(
                        buttonTitle: 'Submit',
                        onTap: () {
                          // _firestore.collection('userdata').add({
                          //   '1.1': genderSelected,
                          //   '1.2': height,
                          //   '1.3': weight,
                          //   '1.4': age,
                          //   '2.1': age,
                          //   '2.2': age,
                          //   '2.3': age,
                          //   '2.4': age,
                          //   '2.5': age,
                          //   '2.6': age,
                          //   '2.7': age,
                          //   '2.8': age,
                          //   '3': age,
                          //   '4': age,
                          // });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DemoPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )
                // Add TextFormFields and ElevatedButton here.
              ],
            ),
          ),
        ),
      ),
    );
  }
}

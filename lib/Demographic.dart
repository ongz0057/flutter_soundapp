import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'ReusableCard.dart';
import 'roundIconBtn.dart';
import 'bottomBtn.dart';
import 'takeImage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:device_info/device_info.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final _firestore = FirebaseFirestore.instance;
User loggedInUser;

class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  final _auth = FirebaseAuth.instance;
  int height = 180;
  int age = 30;
  int maxAge = 100;
  int minAge = 10;
  Position position;
  String phoneModel;
  String docID = 'abc';
  String stringWeather;
  var temp;
  var description;
  var windSpeed;

  List<String> residency = ['SG', 'PR'];
  int residencyNo = 0;
  List<String> race = ['Chinese', 'Malay', 'Indian', 'Others'];
  int raceNo = 0;
  List<String> gender = ['Male', 'Female'];
  int genderNo = 0;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    getLocation();
    getDeviceInfo();
    // this.getWeather();
    // setState(() {
    //   selectedGender = Gender.male;
    // });
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

  void getLocation() async {
    position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );
    this.getWeather();
  }
  // forceAndroidLocationManager: true,
  //set true for emulator, dont set for device

  void getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    phoneModel = androidInfo.brand + androidInfo.model;
  }

  Future getWeather() async {
    http.Response response = await http.get(
        "http://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=95fbb4ad16f2d1d3d2011dbb85434407");
    var results = jsonDecode(response.body);
    setState(() {
      this.temp = results['main']['temp'];
      this.description = results['weather'][0]['description'];
      this.windSpeed = results['windSpeed']['speed'];
    });
    // stringWeather =
    //     temp.toString() + description.toString() + windSpeed.toString();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Demographic'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'GENDER',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          gender[genderNo],
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: FontAwesomeIcons.chevronLeft,
                                onPressed: () {
                                  if (genderNo != 0) {
                                    setState(() {
                                      genderNo--;
                                    });
                                  }
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.chevronRight,
                              onPressed: () {
                                if (genderNo < gender.length - 1) {
                                  setState(() {
                                    genderNo++;
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'RACE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          race[raceNo],
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: FontAwesomeIcons.chevronLeft,
                                onPressed: () {
                                  if (raceNo != 0) {
                                    setState(() {
                                      raceNo--;
                                    });
                                  }
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.chevronRight,
                              onPressed: () {
                                if (raceNo < race.length - 1) {
                                  setState(() {
                                    raceNo++;
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
            Expanded(
              child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'RESIDENCY',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            residency[residencyNo],
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                  icon: FontAwesomeIcons.chevronLeft,
                                  onPressed: () {
                                    if (residencyNo != 0) {
                                      setState(() {
                                        residencyNo--;
                                      });
                                    }
                                  }),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.chevronRight,
                                onPressed: () {
                                  if (residencyNo < residency.length - 1) {
                                    setState(() {
                                      residencyNo++;
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  if (age > minAge) {
                                    setState(
                                      () {
                                        age--;
                                      },
                                    );
                                  }
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    if (age < maxAge) {
                                      setState(() {
                                        age++;
                                      });
                                    }
                                  })
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              buttonTitle: 'Next',
              onTap: () async {
                await _firestore
                    .collection('userdata')
                    .doc(loggedInUser.uid)
                    .collection('subcollection')
                    .add({
                  'Gender': gender[genderNo],
                  'Height': height,
                  'Residency': residency[residencyNo],
                  'Race': race[raceNo],
                  'Age': age,
                  'Location': GeoPoint(position.latitude, position.longitude),
                  'phoneModel': phoneModel,
                  'Weather': temp.toString() +
                      description.toString() +
                      windSpeed.toString(),
                }).then((value) {
                  print(value.id);
                  print(temp.toString());
                  setState(() {
                    docID = value.id;
                  });
                });
                print(docID);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TakeImage(docID: docID),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

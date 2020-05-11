import 'package:bmi_calculator/calculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/reusable_card.dart';
import '../Components/icon_content.dart';
import '../Components/constants.dart';
import '../Components/round_icon_button.dart';
import 'results_page.dart';
import '../Components/bottom_button.dart';
import 'package:bmi_calculator/calculator.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kCardColor;
  Color femaleCardColor = kCardColor;
  Gender selectedGender;
  int height = 180;
  int weight = 65;
  int age = 30;

  Color genderColor(Gender selectedGender) {
    if (selectedGender == null){
      return Color(0xFF757575);
    }else if(selectedGender == Gender.female) {
      return kClickedFemaleCardColorActive;
    }else{
      return kClickedMaleCardColorActive;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kClickedMaleCardColorActive
                        : kCardColor,
                    cardChild: GenderCard(
                      genderIcon: FontAwesomeIcons.mars,
                      genderText: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kClickedFemaleCardColorActive
                        : kCardColor,
                    cardChild: GenderCard(
                      genderIcon: FontAwesomeIcons.venus,
                      genderText: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
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
                          style: kTextStyleForNumbers,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                        RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                        RoundSliderOverlayShape(overlayRadius: 25.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        inactiveColor: genderColor(selectedGender),
                        activeColor: genderColor(selectedGender),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                          print(newValue);
                        },
                      ),
                    )
                  ],
                ),
                colour: kCardColor),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(weight.toString(), style: kTextStyleForNumbers),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              colour: genderColor(selectedGender),
                              onPressed: () {
                                setState(() {
                                  if (weight > 0) {
                                    weight--;
                                  }
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              colour: genderColor(selectedGender),
                              onPressed: () {
                                setState(() {
                                  if (weight < 400) {
                                    weight++;
                                  }
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                    colour: kCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE', style: kLabelTextStyle),
                        Text(
                          age.toString(),
                          style: kTextStyleForNumbers,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              colour: genderColor(selectedGender),
                              onPressed: () {
                                setState(() {
                                  if (age > 0) {
                                    age--;
                                  }
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              colour: genderColor(selectedGender),
                              onPressed: () {
                                setState(() {
                                  if (age < 300) {
                                    age++;
                                  }
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
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
            buttonTitle: 'CALCULATE',
            onTap: (){
              Calculator calc = Calculator(height: height,weight: weight);
              print(calc.calcBMI());
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultsPage(
                bmiResults: calc.calcBMI(),
                resultsText: calc.getResults(),
                interpretation: calc.getInterpretation(),
                genderColor: genderColor(selectedGender),
              )));
            },
          )
        ],
      ),
    );
  }
}


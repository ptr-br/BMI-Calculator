import 'package:bmi_calculator/Screens/input_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Components/constants.dart';
import '../Components/reusable_card.dart';
import '../Components/bottom_button.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.bmiResults,@required this.resultsText, @required this.interpretation,@required this.genderColor});

  final String bmiResults;
  final String resultsText;
  final String interpretation;
  final Color genderColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Your Results'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[

          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: genderColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultsText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(bmiResults.toUpperCase(), style: kBMITextStyle),
                  Text(
                    interpretation,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              buttonTitle: 'RE-CALCULATE',
              onTap: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}

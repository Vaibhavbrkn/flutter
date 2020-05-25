import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';
import 'ReusableCard.dart';
import 'constants.dart';
import 'bottom_button.dart';
import 'brain.dart';

class Result extends StatelessWidget {

  Result({this.bmiResult , this.Detail , this.resultText});
  final String bmiResult;
  final String resultText;
  final String Detail;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child:Text(
                  'Your Result',
                  style:TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child:ReusableCard(
              colour:ActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: ResultTextStyle,
                  ),
                  Text(
                    bmiResult.toString(),
                    style:TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 100.0,
                    )
                  ),
                  Text(
                    Detail.toString(),
                    textAlign: TextAlign.center,
                    style:TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: (){
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ReusableCard.dart';
import 'IconContent.dart';
import 'constants.dart';
import 'results.dart';
import 'bottom_button.dart';
import 'brain.dart';
const InactiveCardColour = Color(0xFF111328);
const ActiveCardColour = Color(0xFF1D1E33);

enum Gender{
  male,
  female
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender = null;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child:Row(
              children: <Widget>[
                Expanded(
                    child:ReusableCard(
                      onPress: (){
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour:selectedGender == Gender.male?ActiveCardColour:InactiveCardColour,
                      cardChild: IconContent(icon: FontAwesomeIcons.mars,label:'MALE',),
                    ),
                ),
                Expanded(
                  child:ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour:selectedGender == Gender.female?ActiveCardColour:InactiveCardColour,
                    cardChild: IconContent(icon: FontAwesomeIcons.venus, label:'FEMALE',),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child:ReusableCard(
              colour:Color(0xFF1D1E33),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Height',
                    style :labelTextStyle,
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
                        style:labelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data:SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      inactiveTrackColor:Color(0xFF8D8E98) ,
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max:220.0,
                      onChanged: (double newValue){
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
              child:Row(
                children: <Widget>[
                  Expanded(
                    child:ReusableCard(
                      colour:Color(0xFF1D1E33),
                      cardChild:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style:labelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style:kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:<Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                    weight = weight-1;
                                  });
                                },
                              ),
                              SizedBox(
                                width:10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {
                                    weight = weight + 1;
                                  });
                                },
                              ),
                          ],
                          )
                        ],
                      )
                    ),
                  ),
                  Expanded(
                    child:ReusableCard(
                      colour:Color(
                          0xFF1D1E33
                      ),
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style:labelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style:kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:<Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                    age = age-1;
                                  });
                                },
                              ),
                              SizedBox(
                                width:10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {
                                    age = age + 1;
                                  });
                                },
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
              Brain calc = Brain(height:height , weight: weight);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Result(
            bmiResult: calc.calculateBMI(),
            Detail:calc.Detail(),
            resultText: calc.getResult(),
          )));
          },
          )
        ],
      ),
    );
  }
}



class RoundIconButton extends StatelessWidget {

  RoundIconButton({this.icon , this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child:Icon(icon) ,
      elevation: 6.0,
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape:CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}

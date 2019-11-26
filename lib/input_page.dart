import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthy/resuts_screen.dart';
import 'package:healthy/reusable_card.dart';
import 'constants.dart';
import 'icon_content.dart';
import 'calculator_brain.dart';



enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 70;
  int age = 25;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true,
          elevation: 80,
          title: Text(
            'KEEP HEALTHY',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender=Gender.male;
                      });
                    },
                      colour: selectedGender == Gender.male
                          ? kactiveCardColor
                          : kinactiveCardColor,
                      cardChild: iconContent(
                        iconType: (FontAwesomeIcons.male),
                        lable: ('MALE'),
                      )),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender=Gender.female;
                      });
                    },
                      colour: selectedGender == Gender.female
                          ? kactiveCardColor
                          : kinactiveCardColor,
                      cardChild: iconContent(
                        iconType: (FontAwesomeIcons.female),
                        lable: ('FEMALE'),
                      )),
                ),
              ],
            )),
            Expanded(
              child: ReusableCard(
                colour: kactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Text('HEIGHT',style: klableTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.toString(),
                          style: knumberTextStyle,),
                        Text('cm', style: klableTextStyle,)
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 12),
                          overlayShape:RoundSliderOverlayShape(
                            overlayRadius: 24,
                        ),
                      ),
                      child: Slider(value: height.toDouble(),
                        activeColor: Colors.pink,
                        inactiveColor: Colors.pink.shade100,
                        min: 120,
                        max: 220,
                        onChanged: (double newValue){
                        setState(() {
                          height = newValue.toInt();
                        });

                        },
                      ),
                    )
                    ],
                ),
              ),
            ),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT',style: klableTextStyle,),
                        Text(weight.toString(),style: knumberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(icon: Icons.add,
                            onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },
                            ),
                            SizedBox(
                              height: 0,
                              width: 10,
                            ),
                            RoundIconButton(icon: Icons.remove,
                            onPressed: (){
                              setState(() {
                                weight--;
                              });
                            },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE',style: klableTextStyle,),
                        Text(age.toString(),style: knumberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(icon: Icons.add,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(
                              height: 0,
                              width: 10,
                            ),
                            RoundIconButton(icon: Icons.remove,
                              onPressed: (){
                                setState(() {
                                  age--;
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
            )),
            ResultButton(buttonTitle: 'CALCULATE',onTap: (){

              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context){
                return ResultsScreen(
                  bmiResults: calc.CalculateBMI(),
                  resultText: calc.getResult() ,
                  discription: calc.getDiscription(),
                );
              }));
            },)
          ],
        ));
  }
}

class ResultButton extends StatelessWidget {

  ResultButton({@required this.onTap , @required this.buttonTitle});
  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment:Alignment.center,
        child: Text(buttonTitle,style: klargebuttonStyle,),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kbottomContainerColor,
        ),
        margin: EdgeInsets.only(bottom: 20, left: 15, right: 15, top: 8),
        height: kbottomContainerHeight,
        width: double.infinity,
      ),
    );
  }
}




class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, this.onPressed });

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon,size: 34,),
      shape: CircleBorder(),
      fillColor: Color(0x338080ff),
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,),
      elevation: 10,
      onPressed: onPressed,
    );
  }
}
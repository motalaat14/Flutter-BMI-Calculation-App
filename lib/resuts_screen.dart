import 'package:flutter/material.dart';
import 'package:healthy/reusable_card.dart';

import 'constants.dart';
import 'input_page.dart';

class ResultsScreen extends StatelessWidget {

  ResultsScreen({@required this.bmiResults, @required this.resultText, @required this.discription });

  final String bmiResults;
  final String resultText;
  final String discription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('KEEP HEALTHY',style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),),centerTitle:true,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 25,),
          Text('YOUR RESULTS',style: TextStyle(fontSize: 40,fontWeight: FontWeight.w800),),
          Expanded(child: ReusableCard(
            colour: kactiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(resultText, style: TextStyle(color: Colors.green,fontSize: 24, fontWeight: FontWeight.bold),),
                Text(bmiResults,style: TextStyle(fontSize: 90,fontWeight: FontWeight.w800),),
                Text(discription, style: klableTextStyle,textAlign: TextAlign.center, )
              ],
            ),
          )
          ),
          ResultButton(buttonTitle: 'RE-CALCULATE',onTap: (){
            Navigator.pop(context);
          },)
        ],
      ),
    );
  }
}

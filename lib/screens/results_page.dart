import 'package:flutter/material.dart';
import 'input_page.dart';
import '../components/reusable_card.dart';
import '../components/constants.dart';
import 'package:bmi_calculator/calculator_brain.dart';

class ResultPage extends StatelessWidget {

  ResultPage({@required this.bmiResult,@required this.resultText, @required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text('YOUR RESULT',style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              ),),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText.toUpperCase(),style: kresultTextStyle,),
                  Text(bmiResult,style: kBMITextStyle,),
                  Text(interpretation,style: kBodyTextStyle,
                  textAlign: TextAlign.center,),
                ],
              ),
            )
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);

            },
            child: Container(
              color: kBottoomcardcolor,
              child: Center(
                child: Text('RE-CALCULATE',
                    style: kLargeButton),
              ),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
            ),
          )
        ],
      ),
    );
  }
}

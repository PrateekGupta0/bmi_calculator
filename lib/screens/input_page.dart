import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../components/constants.dart';
import 'results_page.dart';
import 'package:bmi_calculator/calculator_brain.dart';


// TBR
enum Gender {
  //Enums are very useful when we have various properties.
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height=180;
  int weight=60;
  int age=10;
  // Color maleCardColor =inactiveCardColor;
  // Color femaleCardColor =inactiveCardColor;
  // void updateColor(Gender selectedGender){
  //   if(selectedGender == Gender.male){
  //     if(maleCardColor == inactiveCardColor){
  //       maleCardColor =activeCardColor;
  //       femaleCardColor =inactiveCardColor;
  //     }
  //     else{
  //       maleCardColor = inactiveCardColor;
  //     }
  //   }
  //   else{
  //     if(femaleCardColor == inactiveCardColor){
  //       femaleCardColor =activeCardColor;
  //       maleCardColor =inactiveCardColor;
  //     }
  //     else{
  //       femaleCardColor = inactiveCardColor;
  //     }
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
        // backgroundColor: Color(0XFF0A0E21),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  // flat  button change the styling of th widget so we don't use it instead we use gesture button.
                  child: ReusableCard(
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      txt: 'Male',
                      icon: FontAwesomeIcons.mars,
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
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
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      txt: 'Female',
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text('HEIGHT',style: kLabelTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(),style: kNumberStyle,),
                      Text('cm',style: kLabelTextStyle,),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(value: height.toDouble(), min: 120.0,max: 220.0,
                    // activeColor: Colors.white,
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newValue){
                      // print(newValue);
                      setState(() {
                        height=newValue.round();
                      });
                    },),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text('WEIGHT', style: kLabelTextStyle,),
                        Text(weight.toString(),style: kNumberStyle,),
                        Row(
                          children: [

                            Expanded(
                              child: RoundIconButton(icon: FontAwesomeIcons.minus,onPress: (){
                                setState(() {
                                  weight--;
                                });
                              },),
                            ),

                            Expanded(child: RoundIconButton(icon: FontAwesomeIcons.plus,onPress: (){
                              setState(() {
                                weight++;
                              });
                            },)),


                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text('AGE', style: kLabelTextStyle,),
                        Text(age.toString(),style: kNumberStyle,),
                        Row(
                          children: [

                            Expanded(
                              child: RoundIconButton(icon: FontAwesomeIcons.minus,onPress: (){
                                setState(() {
                                  age--;
                                });
                              },),
                            ),

                            Expanded(child: RoundIconButton(icon: FontAwesomeIcons.plus,onPress: (){
                              setState(() {
                                age++;
                              });
                            },)),


                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              CalculatorBrain cal = CalculatorBrain(weight: weight,height: height);
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return ResultPage(bmiResult: cal.calculateBMI(),resultText: cal.getResult(),interpretation: cal.getInterpretation(),);
              }));
            },
            child: Container(
              color: kBottoomcardcolor,
              child: Center(
                child: Text('CALCULATE',
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

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon,this.onPress});
  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      child: Icon(icon),
     shape:CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: Color(0xFF4C4F5E),

    );
  }
}


// final can attain values that can chang after compilation but in case of constant they can be calculate only at compile time not at current time.
//Ternary operator similar to the comparator operator in cPP.
// Condition ? DoTHis if true : Do this i false.

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'result.dart';
import 'calculation.dart';

void main() => runApp(BMICalculator());

const activecolor = Colors.grey;
const inactivecolor = Colors.brown;

enum Gender { male, female }

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedgender;
  int height = 150;
  int weight = 45;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedgender = Gender.male;
                      });
                    },
                    child: Containers(
                      colour: selectedgender == Gender.male
                          ? activecolor
                          : inactivecolor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.mars,
                            size: 60,
                          ),
                          Text('MALE')
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedgender = Gender.female;
                      });
                    },
                    child: Containers(
                      colour: selectedgender == Gender.female
                          ? activecolor
                          : inactivecolor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.venus,
                            size: 60,
                          ),
                          Text('FEMALE')
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Containers(
            colour: inactivecolor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "HEIGHT",
                  style: TextStyle(fontSize: 15),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: TextStyle(fontSize: 30),
                    ),
                    Text('cm')
                  ],
                ),
                Slider(
                    value: height.toDouble(),
                    min: 100,
                    max: 200,
                    activeColor: Colors.blue,
                    onChanged: (newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    })
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: Containers(
                  colour: inactivecolor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT'),
                      Text(
                        weight.toString(),
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Button(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Button(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: Containers(
                  colour: inactivecolor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('AGE'),
                      Text(
                        age.toString(),
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Button(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Button(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
          buttombutton(
              onTap: () {
                CalculationBrain calc =
                    CalculationBrain(weight: weight, height: height);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Result(
                      resultText: calc.resultText(),
                      interpretationText: calc.interpretationText(),
                      calculators: calc.calculator(),
                    ),
                  ),
                );
              },
              text: 'CALCULATE')
        ],
      ),
    );
  }
}

class buttombutton extends StatelessWidget {
  buttombutton({this.onTap, this.text});

  final VoidCallback? onTap;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        width: double.infinity,
        color: Colors.grey,
        child: Center(
          child: Text(text.toString(),
              style: TextStyle(fontSize: 50, color: Colors.blue)),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  Button({this.onPressed, this.icon});

  final VoidCallback? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(height: 50, width: 50),
      child: Icon(icon),
      shape: CircleBorder(),
      fillColor: Colors.grey,
    );
  }
}

class Containers extends StatelessWidget {
  Containers({required this.colour, this.child});

  final Color colour;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(10),
    );
  }
}

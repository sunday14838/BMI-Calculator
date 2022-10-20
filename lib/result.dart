import 'package:bmi/main.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Result(
      {required this.calculators,
      required this.interpretationText,
      required this.resultText});

  final String resultText;
  final String interpretationText;
  final double calculators;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 10.0),
          const Center(
            child: Text(
              'Your Result',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
            ),
          ),
          Expanded(
              flex: 5,
              child: Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.brown),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      resultText.toString().toUpperCase(),
                      style: const TextStyle(color: Colors.green,  fontSize: 30),
                    ),
                    Text(calculators.toString(),
                        style: const TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold)),
                    Text(
                      interpretationText.toString(),textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20,),
                    ),
                  ],
                ),
              )),
          buttombutton(
            onTap: () {
              Navigator.pop(context);
            },
            text: 'Re-Calculate',
          ),
        ],
      ),
    );
  }
}

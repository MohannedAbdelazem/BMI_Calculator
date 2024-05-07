import 'package:flutter/material.dart';

class BmiCalculator extends StatelessWidget {
  int age;
  int height;
  int weight;
  bool isMale;
  late double bmi;
  BmiCalculator({
    super.key,
    required this.age,
    required this.height,
    required this.isMale,
    required this.weight,
  });
  late String stateOfBMI;
  late String Description;
  late double _deviceWidth, _deviceHeight;
  @override
  Widget build(BuildContext context) {
    bmi = weight / ((height / 100) * (height / 100.0));
    if (bmi < 18.5) {
      stateOfBMI = 'UnderWeight';
      Description =
          "A BMI under 18.5 means you're in the underweight zone. This suggests lower body fat stores than normal. It can be due to various reasons, but it might lead to health concerns. Talk to a doctor if you're worried for a proper evaluation.";
    } else if (bmi < 25) {
      stateOfBMI = 'Normal';
      Description =
          "A BMI between 18.5 and 25 falls within the healthy weight range. This indicates a good balance between weight and height, suggesting a normal amount of body fat stores. This is generally associated with a lower risk of health problems linked to weight.";
    } else if (bmi < 30) {
      stateOfBMI = 'Overweight';
      Description =
          "A BMI of 25 to 30 falls into the overweight category. This means your weight is slightly higher than what's considered ideal for your height. It suggests potentially increased body fat stores.";
    } else {
      stateOfBMI = 'Obese';
      Description =
          "BMI over 30 means obesity. This raises your risk for serious health problems like heart disease, diabetes, stroke, and some cancers. Talk to a doctor to create a plan for a healthier weight.";
    }
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Back'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Result',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              Text(
                'Your BMI is',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      bmi.toStringAsFixed(2),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      'kg/m2',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
              Text(
                stateOfBMI,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              Container(
                height: 80,
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(isMale ? Icons.man : Icons.woman),
                        Text(isMale ? 'Male' : 'Female'),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(age.toString()),
                        Text('Age'),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(height.toString()),
                        Text('Height'),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(weight.toString()),
                        Text('Weight'),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 250,
                width: _deviceWidth * 0.9,
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    Description,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(_deviceWidth * 0.9, _deviceHeight * 0.08),
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Try Again ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.replay_rounded,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

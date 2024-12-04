import 'package:flutter/material.dart';
import 'package:bmi_calculator/utils/gender.dart';
import 'package:wheel_slider/wheel_slider.dart';
import 'package:bmi_calculator/pages/bmi_calculator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool genderSelected = false;
  int _currentWeight = 50;
  int age = 20;
  late double _deviceHeight, _deviceWidth;
  bool gMale = false, gFemale = false;
  int _currentheight = 150;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 30,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Gender',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          genderSelected = true;
                          gMale = true;
                          gFemale = false;
                        });
                      },
                      child: Gender(
                        isMale: true,
                        g: gMale,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          genderSelected = true;
                          gMale = false;
                          gFemale = true;
                        });
                      },
                      child: Gender(
                        isMale: false,
                        g: gFemale,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text('Height',
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        Text(
                          '$_currentheight',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 30,
                          ),
                        ),
                        WheelSlider(
                          totalCount: 100,
                          initValue: 0,
                          pointerColor: Colors.blue,
                          onValueChanged: (val) {
                            setState(() => _currentheight = val + 150);
                          },
                          hapticFeedbackType: HapticFeedbackType.vibrate,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Age'),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Weight(Kg)'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: _deviceHeight * 0.1,
                      width: _deviceWidth * 0.4,
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.grey),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (age != 1) {
                                  age--;
                                }
                              });
                            },
                            icon: Icon(Icons.remove_circle_outline,
                                color: Colors.blue),
                            iconSize: 30,
                          ),
                          Text('$age',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w700)),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (age != 120) {
                                  age++;
                                }
                              });
                            },
                            icon: Icon(Icons.add_circle_outline_sharp,
                                color: Colors.blue),
                            iconSize: 30,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: _deviceHeight * 0.1,
                      width: _deviceWidth * 0.4,
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.grey),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.arrow_drop_down, color: Colors.blue),
                          WheelSlider.customWidget(
                            itemSize: 40,
                            totalCount: 200,
                            initValue: 50,
                            onValueChanged: (val) {
                              setState(() {
                                _currentWeight = val + 20;
                              });
                            },
                            showPointer: false,
                            children: List.generate(
                              200,
                              (index) {
                                return (index + 20 == _currentWeight)
                                    ? Text(
                                        '${index + 20}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18),
                                      )
                                    : Text('${index + 20}');
                              }, // check if git is working
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(_deviceWidth * 0.9, _deviceHeight * 0.08),
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    if (genderSelected) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BmiCalculator(
                            weight: _currentWeight,
                            height: _currentheight,
                            age: age,
                            isMale: gMale,
                          ),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Calculate BMI',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

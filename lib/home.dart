import 'package:flutter/material.dart';

class bmi extends StatefulWidget {
  const bmi({super.key});

  @override
  State<bmi> createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  final getW = TextEditingController();
  final getH = TextEditingController();
  late double weight;
  late double height;
  late double bmi_result = 0.0;
  String c_result = '';

  String classifyBMI(double bmi_result) {
    if (bmi_result < 16) {
      return 'Severely Underweight';
    } else if (bmi_result >= 16 && bmi_result <= 18.4) {
      return 'Underweight';
    } else if (bmi_result >= 18.5 && bmi_result <= 24.9) {
      return 'Normal';
    } else if (bmi_result >= 25 && bmi_result <= 29.9) {
      return 'Overweight';
    } else if (bmi_result >= 30 && bmi_result <= 34.9) {
      return 'Moderately Obese';
    } else if (bmi_result >= 35 && bmi_result <= 39.9) {
      return 'Severely Obese';
    } else if (bmi_result > 40) {
      return 'Morbidly Obese';
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    Color TextColor;

    if (c_result == 'Severely Underweight') {
      TextColor = Colors.red;
    } else if (c_result == 'Underweight') {
      TextColor = Colors.yellow;
    } else if (c_result == 'Normal') {
      TextColor = Colors.green;
    } else if (c_result == 'Overweight') {
      TextColor = Colors.yellow;
    } else if (c_result == 'Moderately Obese') {
      TextColor = Colors.orange.shade500;
    } else if (c_result == 'Severely Obese') {
      TextColor = Colors.orange.shade800;
    } else if (c_result == 'Morbidly Obese') {
      TextColor = Colors.red.shade800;
    } else {
      TextColor = Colors.black;
    }

    return Scaffold(
      backgroundColor: Colors.grey[500],
      body: Center(
        child: Container(
          height: 500,
          width: 500,
          color: Colors.blue,
          child: Column(children: [
            Text(
              'BMI Calculator',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    //weight
                    TextFormField(
                      controller: getW,
                      decoration: InputDecoration(
                        labelText: 'Weight (kg)',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            getW.clear();
                          },
                          icon: Icon(Icons.clear),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    //height
                    TextFormField(
                      controller: getH,
                      decoration: InputDecoration(
                        labelText: 'Height (m)',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            getH.clear();
                          },
                          icon: Icon(Icons.clear),
                        ),
                      ),
                    ),

                    //button
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          weight = double.parse(getW.text);
                          height = double.parse(getH.text);

                          bmi_result = weight / (height * height);
                          c_result = classifyBMI(bmi_result);
                        });
                      },
                      child: Text('Compute'),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Your BMI is $bmi_result',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),

                    Container(
                      child: Text(
                        c_result,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: TextColor,
                          fontSize: 40,
                        ),
                      ),
                    )
                  ],
                )),
          ]),
        ),
      ),
    );
  }
}

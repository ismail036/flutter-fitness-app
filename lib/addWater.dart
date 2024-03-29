import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:pero_fitness/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'db_helper.dart';


class AddWater extends StatelessWidget {
  const AddWater({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Welcome.lang == "en" ? Text(
              "Add Water",
            ) : Text(
              "Добавить воду",
            ),
            centerTitle: true,
          ),
          body: AddWaterBody(),
        ),
      ),
    );
  }
}

class AddWaterBody extends StatefulWidget {
  const AddWaterBody({super.key});

  @override
  State<AddWaterBody> createState() => _AddWaterBodyState();
}

class _AddWaterBodyState extends State<AddWaterBody> {
  int value = 0;
  int _currentValue = 0;
  int water = 0;
  bool set = false;

  @override
  void initState() {
    super.initState();
    getData();
  }


  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      value = prefs.getInt('water') ?? 0;
      _currentValue = prefs.getInt('water') ?? 0;
    });
  }


  Future<void> setData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt("water", value);
    }

  Future<void> setTimeList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  Future<void> upWter() async {
    var db = UserDatabaseProvider();
    await db.open();
    db.updateWater(_currentValue,(DateTime.now()).toString());
  }








  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView( // Wrap with ListView for scrolling if content exceeds screen height
              padding: EdgeInsets.all(16.0),
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xfff7f8f8), // Adjust the radius as needed
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.water_drop_rounded,
                              color: Color(0xffb6b4c2),
                            ),
                            SizedBox(width: 10),
                            Welcome.lang == "en" ? Text("Water") : Text("Вода"),
                          ],
                        ),
                      ),
                      Text(value.toString()),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Welcome.lang == "en" ? Text("Water volume") : Text("Объем воды"),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NumberPicker(
                          value: _currentValue,
                          minValue: 0,
                          maxValue: 2000,
                          onChanged: (value) => setState(() => _currentValue = value),
                        ),
                        Welcome.lang == "en" ?  Text('Water') : Text('литров'), // Water metnini ekledik
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(16.0),
            width: MediaQuery.of(context).size.width,
            height: 70,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                    Color(0xFF1E55A5), // Adjust colors as needed
                    Color(0xFF14288B),
                ],
                stops: [0, 1],
                transform: GradientRotation(274.42 * 3.141592 / 180),
                ),
                borderRadius: BorderRadius.circular(35),
            ),
            child: TextButton(
                onPressed: (){
                  setState(() {
                    value += _currentValue;
                    Welcome.water = value;
                    setData();
                    upWter();
                    Welcome.getWaterData();
                    setTimeList();
                  });
                  print(value);

                },
               child: Welcome.lang == "en" ?  Text(
                   "Add",
                 style: TextStyle(
                   color: Colors.white
                 ),
               ) : Text(
                 "Добавить",
                 style: TextStyle(
                     color: Colors.white
                 ),
               ),
            ),
          ),
        ],
      )
    );
  }
}

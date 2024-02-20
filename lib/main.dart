import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pero_fitness/person.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'db_helper.dart';
import 'home.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/intl.dart';
import 'dart:convert' as convert;
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';




void main() async {
  runApp(MyApp());
}



Future<void> loadJsonAsset() async {
  final String jsonString = await rootBundle.loadString('assets/data.json');
  final data = jsonDecode(jsonString);
  print(data);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PERO Fitness',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  Welcome(),
    );
  }
}


class Welcome extends StatelessWidget {
  Welcome({super.key});

  static var water = 0;
  static var lang = "en";
  static var pp = "";

  static var data = [];
  static Future<void> getWaterData() async {
    var db = UserDatabaseProvider();
    await db.open();
    data = await db.getWaterList();
    print(data);
  }

  @override
  Widget build(BuildContext context) {


    void getData() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      water = prefs.getInt('water') ?? 0;
    }



    getData();

    return Container(

      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF152877),
            Color(0xFF2D539E),
          ],
          stops: [0, 1],
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 8, // %80'lik alanı kapla
            child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'PERO',
                          style: TextStyle(
                            color: Color(0xFFDC201E),
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        Text(
                          'fitness',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        lang == "en"
                            ? Text(
                          'Everybody Can Train',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                          ),
                        )
                            : Text(
                          'Тренироваться может каждый',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            lang = "ru";
                            pp = "ru";
                            print(lang);
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => Welcome()), // New route (Home())
                                  (route) => false, // Predicate: Always return false to remove all routes
                            );
                          },
                          child: SvgPicture.asset(
                            'assets/images/Group.svg', // Replace 'assets/image.svg' with your SVG file path
                            width: 60, // Adjust width as needed
                            height: 60, // Adjust height as needed
                          ),
                        ),
                        SizedBox(width: 10,),
                        GestureDetector(
                          onTap: () {
                            lang = "en";
                            pp = "";
                            print(lang);
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => Welcome()), // New route (Home())
                                  (route) => false, // Predicate: Always return false to remove all routes
                            );
                          },
                          child: SvgPicture.asset(
                            'assets/images/Group-2.svg', // Replace 'assets/image.svg' with your SVG file path
                            width: 60, // Adjust width as needed
                            height: 60, // Adjust height as needed
                          ),
                        ),
                      ],
                    ),
                  ]
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextButton(
                    onPressed: () async {
                      getWaterData();
                      await Future.delayed(Duration(microseconds: 2000));
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Home()), // Yönlendirme burada yapılıyor
                      );
                    },
                    child: Center(
                      child: lang == "en" ? Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ) : Text(
                        'Начать',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      )

                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      maximumSize: MaterialStateProperty.all<Size>(
                        Size(MediaQuery.of(context).size.width * 0.8,60),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );

  }
}

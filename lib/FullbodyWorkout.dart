import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ExerciseDetail.dart';
import 'GetReady.dart';
import 'WorkoutSchedule.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'db_helper.dart';
import 'main.dart';

var workoutType = "";
var workoutText = "";
var imgPath = "";
var desc = "";

class FullbodyWorkout extends StatelessWidget {
  FullbodyWorkout({super.key, required String type}){
    workoutType = type;
  }



  @override
  Widget build(BuildContext context) {


    if(workoutType == "fullbody"){
      workoutText = "Fullbody Workout";
      imgPath = "assets/images/Vector.png";
      desc = "7 Exercises | 30mins | 320 Calories Burn";
    }else if(workoutType == "fullbodyru"){
      workoutText = "Тренировка всего телаt";
      imgPath = "assets/images/Vector.png";
      desc = "7 упражнений | 30 минут | Сжигание 320 калорий";
    }else if(workoutType == "abru"){
      workoutText = "Тренировка ног";
      imgPath = "assets/images/Ellipse 117.png";
      desc = "9 упражнений | 40 минут | Сжигается 562 калории";
    } else if(workoutType == "ab"){
      workoutText = "AB Workuot";
      imgPath = "assets/images/Ellipse 117.png";
      desc = "9 Exercises | 40mins | 562 Calories Burn";
    }else if(workoutType == "lowebodyru"){
      workoutText = "Тренировка пресса";
      imgPath = "assets/images/Ellipse 116.png";
      desc = "5 упражнений | 20 минут | Сжигание 265 калорий";
    }else{
      workoutText = "Lowebody Workuot";
      imgPath = "assets/images/Ellipse 116.png";
      desc = "5 Exercises | 20mins | 265 Calories Burn";
    }

    return  Container(
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
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent, // Set Scaffold background to transparent
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            workoutText,
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: WorkoutBody(),
      ),
    );
  }
}



class WorkoutBody extends StatefulWidget {
  const WorkoutBody({super.key});

  @override
  State<WorkoutBody> createState() => _WorkoutBodyState();
}

class _WorkoutBodyState extends State<WorkoutBody> {

  var workout = [];
  var today = [];

  var data = [];

  Future<void> getData() async {
    var db = UserDatabaseProvider();
    await db.open();
    data = await db.getList();
    setState(() {

    });
  }


  List<Widget> exercisesList = [];


  @override
  Widget build(BuildContext context) {// Initialize Hive

    getData();

    return Container(
         child: Stack(
           children: [
             Container(
               padding: EdgeInsets.all(30),
                 child: Image.asset(imgPath)
             ),
             SingleChildScrollView(
               child: Container(
                 margin: EdgeInsets.fromLTRB(0, 300, 0, 0),
                 padding: EdgeInsets.symmetric(vertical: 20,horizontal: 35),
                 width: MediaQuery.of(context).size.width,
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.only(
                     topLeft: Radius.circular(40),
                     topRight: Radius.circular(40),
                   ), // Adjust the radius as needed
                 ),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Center(
                       child: Container(
                         width: 60,
                         height: 7,
                         decoration: BoxDecoration(
                           color: Color(0xffe8e8e8),
                           borderRadius: BorderRadius.circular(3),
                          ),
                       ),
                     ),
                     SizedBox(height: 30,),
                     Text(workoutText),
                     SizedBox(height: 10,),
                     Text(desc),
                     SizedBox(height: 10,),
                     GestureDetector(
                       onTap: (){
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => WorkoutSchedule()), // Yönlendirme burada yapılıyor
                         );
                       },
                       child: Container(
                       
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(20),
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
                         ),
                       
                         padding: EdgeInsets.all(15),
                         child: Row(
                           children: [
                             Expanded(
                                 child: Row(
                               children: [
                                 Icon(
                                   Icons.calendar_month_outlined,
                                   color: Colors.white,
                                   size: 25,
                                 ),
                                 SizedBox(width: 10,),

                                 Welcome.lang == "en" ? Text("Schedule Workout",
                                   style: TextStyle(
                                       color: Colors.white,
                                       fontSize: 13
                                   )) : Text("Запланируйте тренировку",
                                   style: TextStyle(
                                       color: Colors.white,
                                       fontSize: 13
                                   ),
                                 ),
                               ],
                             ),
                             ),
                       
                             Text("5/7, 09:00 AM",
                               style: TextStyle(
                                   color: Colors.white,
                                   fontSize: 12
                               ),
                             ),
                             Icon(
                               Icons.navigate_next_rounded,
                               color: Colors.white,
                               size: 30,
                               weight: 1,
                             )
                       
                           ],
                         ),
                       
                       ),
                     ),
                     SizedBox(height: 20,),
                     Welcome.lang == "en" ? Text("Exercises") : Text("Упражнения"),
                     SizedBox(height: 15,),
                     for (int i = 0; i < data.length; i++)
                       if(data[i]["type"] == workoutType)
                         GestureDetector(
                           onTap: (){
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => ExerciseDetail(name:data[i]["name"])), // Yönlendirme burada yapılıyor
                             );
                           },
                           child: Container(
                             height: 60,
                             margin: EdgeInsets.symmetric(vertical: 5),
                             child: Row(
                               children: [
                                 Expanded(child: Row(
                                   children: [
                                     Image.asset(data[i]["img_path"]),
                                     SizedBox(width: 10,),
                                     Flexible(
                                       child: Column(
                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           Text(data[i]["name"]),
                                           Text(data[i]["repetitions"].toString()+"x"),
                                         ],
                                       ),
                                     ),
                                   ],
                                 ),
                                 ),
                                 Icon(Icons.navigate_next)
                               ],
                             ),
                           ),
                         ),


                     SizedBox(height: 15,),
                     Container(
                       width: MediaQuery.of(context).size.width,
                       padding: EdgeInsets.all(5),
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
                         borderRadius: BorderRadius.circular(45),
                       ),
                       child: TextButton(
                         onPressed: (){

                           Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => GetReady(type:workoutType)), // Yönlendirme burada yapılıyor
                           );
                         },
                         child: Welcome.lang == "en" ? Text("Start Workout",
                           style: TextStyle(color: Colors.white),
                         ) : Text("Начать тренировку",
                           style: TextStyle(color: Colors.white),
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
             )
           ],
         ),
    );
  }
}






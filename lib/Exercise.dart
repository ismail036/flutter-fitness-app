import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pero_fitness/takeRest.dart';

import 'FullbodyWorkout.dart';
import 'db_helper.dart';


var workoutType = "";
var exerciseStep = 0;

var data = [];
var exerciseData;
var _currentValue = 0;
var exerciseName = "";

class Exercise extends StatelessWidget {
  Exercise ({super.key, required String type, required int step, required String fE}){
    workoutType = type;
    exerciseStep = step;
    exerciseName = fE;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(exerciseName),
          centerTitle: true,
        ),
        body: ExerciseBody(),
      ),
    );
  }
}


class ExerciseBody extends StatefulWidget {
  const ExerciseBody({super.key});

  @override
  State<ExerciseBody> createState() => _ExerciseBodyState();
}

class _ExerciseBodyState extends State<ExerciseBody> {


  Future<void> getData() async {
    var db = UserDatabaseProvider();
    await db.open();
    data = await db.getListType(workoutType);
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    getData();
    var desc = data[exerciseStep]["description"].replaceAll(" , " , ",").replaceAll(' "', " '");
    desc = desc.replaceAll('" ', "' ");
    desc = desc.replaceAll('\n', "");
    List<dynamic> jsonList = json.decode(desc);
    return Container(
      margin: EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(data[exerciseStep]["main_img_path"]),
            SizedBox(height: 25,),


            Align(
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width:  160,
                    height: 160,
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
                      borderRadius: BorderRadius.circular(80),
                    ),
                  ),
                  Container(
                    width:  130,
                    height: 130,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60),
                    ),
                  ),
                  Text((data[exerciseStep]['repetitions']).toString() + "x",
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w900
                    ),
                  )
                ],
              ),
            ),


            SizedBox(height: 25,),
            Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("How To Do It"),
                        Text((jsonList.length).toString() + " Steps ")
                      ],
                    )
                  ],
                )
            ),
            SizedBox(height: 10,),
            SizedBox(height: 10,),

            for (int i = 0; i < jsonList.length; i++)
              Container(
                margin: EdgeInsets.symmetric(vertical:6),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("0" + (i+1).toString(),style: TextStyle(fontSize: 15, color: Colors.indigoAccent),),
                    SizedBox(width: 15,),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(jsonList[i][0],
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(jsonList[i][1],
                            style: TextStyle(color: Colors.grey),)
                        ],
                      ),
                    )
                  ],
                ),
              ),

            SizedBox(height: 15,),

            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10),
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
                  if(exerciseStep+1 >= data.length){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FullbodyWorkout(type: workoutType)), // Yönlendirme burada yapılıyor
                    );
                  }else{
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => TakeRest(nextStep:exerciseStep+1 , type:workoutType)), // Yönlendirme burada yapılıyor
                    );
                  }

                },
                child: Text("Next",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

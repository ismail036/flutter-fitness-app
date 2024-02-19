import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import 'db_helper.dart';


var excerciseName = "";

class ExerciseDetail extends StatelessWidget {
  ExerciseDetail({super.key, required name}){
    excerciseName = name;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            excerciseName,
          ),
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


  var data = [];
  var exerciseData;
  var _currentValue = 0;
  bool isDataLoaded = false;

  Future<void> getData() async {
    var db = UserDatabaseProvider();
    await db.open();
    data = await db.getList();
    data.forEach((element) {
      if (element["name"] == excerciseName && isDataLoaded == false ){
        isDataLoaded = true;
        setState(() {
          exerciseData = (element);
        });
      }
    });
  }

  Future<void> updateData(int rep , int id) async {
    var db = UserDatabaseProvider();
    await db.open();
    db.updateData(rep, id);
  }





  @override
  Widget build(BuildContext context) {
    getData();
    var desc = exerciseData["description"].replaceAll(" , " , ",").replaceAll(' "', " '");
    desc = desc.replaceAll('" ', "' ");
    desc = desc.replaceAll('\n', "");
    List<dynamic> jsonList = json.decode(desc);
    _currentValue = exerciseData['repetitions'];
    return Container(
      margin: EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(exerciseData['main_img_path']),
            SizedBox(height: 25,),
            Text(exerciseData["name"],
              style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),
            ),
            SizedBox(height: 3,),
            Text(exerciseData["calories"],style: TextStyle(color:Colors.grey),),

            SizedBox(height: 25,),
            Align(
              alignment: Alignment.bottomLeft,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("How To Do It"),
                        Text((jsonList.length).toString())
                      ],
                    )
                  ],
                )
            ),
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

            Align(
              alignment: Alignment.centerLeft,
              child: Text("Custom Repetitions"),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StatefulBuilder(
                  builder: (context4, setState2) {
                    return  Column(
                      children: <Widget>[
                        NumberPicker(
                          value: _currentValue,
                          minValue: 0,
                          maxValue: 100,
                          onChanged: (value){
                             setState2(() => _currentValue = value);
                         }

                        ),
                      ],
                    );
                  },
                ),
                Text("times")
              ],
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
                  updateData(_currentValue, exerciseData["id"]);
                },
                child: Text("Save",
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

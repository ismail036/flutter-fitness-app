import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pero_fitness/home.dart';
import 'package:shared_preferences/shared_preferences.dart';


var finishTime;
var difference;
var workoutType;
class Finish extends StatelessWidget {
  Finish({super.key, required time, required String wT}){
    finishTime = time;
    workoutType = wT;
  }

  @override
  Widget build(BuildContext context) {
    difference = (DateTime.now().difference(finishTime));
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Finish",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
        ),
        body: FinishBody(),
      ),
    );
  }
}

class FinishBody extends StatefulWidget {
  const FinishBody({super.key});

  @override
  State<FinishBody> createState() => _FinishBodyState();
}



class _FinishBodyState extends State<FinishBody> {

  var workuot = 0;
  var calories = 0;

  var todayCalories = 0;

  Future<void> getWorkOutCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    workuot = (await prefs.getInt("workout"))! + 1;
    todayCalories = (await prefs.getInt("calories"))!;
    setState(()  {
    });
  }

  Future<void> setWorkOutCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("workout", workuot);
    prefs.setInt("calories", todayCalories + calories);
  }

  @override
  Widget build(BuildContext context) {
    getWorkOutCount();

    if(workoutType == "fullbody"){
      calories = 320;
    }else if(workoutType == "ab"){
      calories = 562;
    }else{
      calories = 265;
    }

    return Container(
      margin: EdgeInsets.all(26),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/Vector.svg', // Replace 'assets/image.svg' with your SVG file path
                    width: 130, // Adjust width as needed
                    height:130,
                  ),
                  SizedBox(height: 70,),
                  Text("Congratulations!",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.indigo
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("You have completed the workout!"),
                  SizedBox(height: 40,),
                  Container(
                    height: 0.8,
                    color: Colors.black,
                  ),
                  SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(workuot.toString(),
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                          Text("Workout",
                            style: TextStyle(
                                fontSize: 18
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 35,),
                      Container(
                        height: 30,
                        width: 1,
                        color: Colors.black,
                      ),
                      SizedBox(width: 35,),
                      Column(
                        children: [
                          Text(calories.toString(),
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                          Text("cal",
                            style: TextStyle(
                                fontSize: 18
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 35,),
                      Container(
                        height: 30,
                        width: 0.8,
                        color: Colors.black,
                      ),
                      SizedBox(width: 35,),
                      Column(
                        children: [
                          Text(difference.inMinutes.toString() + ":" + difference.inSeconds.remainder(60).toString(),
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                          Text("Minutes",
                            style: TextStyle(
                                fontSize: 18
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(12),
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
                setWorkOutCount();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                      (Route<dynamic> route) => false, // This will remove all routes below the pushed route
                );
              },
              child: Text("Home",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700
                ),
              ),
            ),
          ),

          SizedBox(height: 10,)
        ],
      ),
    );
  }
}


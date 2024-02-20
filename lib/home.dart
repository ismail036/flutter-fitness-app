import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pero_fitness/main.dart';
import 'package:vertical_percent_indicator/vertical_percent_indicator.dart';
import 'package:intl/intl.dart';
import 'FullbodyWorkout.dart';
import 'Notification.dart';
import 'activity.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:shared_preferences/shared_preferences.dart';


class Home extends StatelessWidget {
  Home({super.key});




  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFF7F7F7),
          appBar: AppBar(
            title: Welcome.lang == "en" ?  Text('Home') : Text('Главная'),
            actions: [
              IconButton(
                icon: SvgPicture.asset(
                  'assets/images/Group.svg', // SVG dosyanızın yolu
                  width: 24, // Genişlik
                  height: 24, // Yükseklik
                ),
                onPressed: () {
                  Welcome.lang = "ru";
                  Welcome.pp = "ru";
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Home()), // New route (Home())
                        (route) => false, // Predicate: Always return false to remove all routes
                  );
                },
              ),
              IconButton(
                icon: SvgPicture.asset(
                  'assets/images/Group-2.svg', // SVG dosyanızın yolu
                  width: 24, // Genişlik
                  height: 24, // Yükseklik
                ),
                onPressed: () {
                  Welcome.lang = "en";
                  Welcome.pp = "";
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Home()), // New route (Home())
                        (route) => false, // Predicate: Always return false to remove all routes
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.notifications), // Bildirim ikonu
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotificationPage()), // Yönlendirme burada yapılıyor
                  );
                },
              ),
            ],
          ),
          body: Activity(),
          // Buraya gövde içeriğinizi ekleyin
        ),
      ),
    );

  }
}


class Activity extends StatefulWidget {
  const Activity({super.key});


  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {

  var steps = 0;
  var calories = 0;

  var data = {};

  var today = [];

  Widget getHours(int hours){
    print(Welcome.data);
    var totalWater = 0;
    DateTime now = DateTime.now();
    DateTime hoursAgo1 = now.subtract(Duration(hours: hours));
    DateTime hoursAgo2 = now.subtract(Duration(hours: hours + 2));
    String formattedTime = DateFormat('h a').format(hoursAgo1);
    String formattedTime2 = DateFormat('h a').format(hoursAgo2);





    Welcome.data.forEach((element) {
      DateTime timeFromElement = DateTime.parse(element["time"]);
      if (timeFromElement.isBefore(hoursAgo1) && timeFromElement.isAfter(hoursAgo2)){
        int count = (element["count"]);
        totalWater +=  count;
        print("k");
      };

    });
    if(hours == 0){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(formattedTime2 + " - now",
        style: TextStyle(
            color: Color(0xFFA5A3B0),
            fontSize: 12
        )
    ),
        Text((totalWater*1000).toString() + "ml",
          style: TextStyle(

          ),
        ),
      ],
    );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(formattedTime2 + " - " +  formattedTime.toString(),
          style: TextStyle(
              color: Color(0xFFA5A3B0),
              fontSize: 12
          ),
        ),
        Text((totalWater*1000).toString()+"ml"),
      ],
    );
  }

  Future<void> loadJsonAsset() async {
    final String jsonString = await rootBundle.loadString('assets/data.json');
    data = jsonDecode(jsonString);
    today = data["today"];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool containsWaterKey = prefs.containsKey("water");
    if(containsWaterKey == false){
      prefs.setInt("water", 0);
    }

    bool containsWorkoutKey = prefs.containsKey("workout");
    if(containsWorkoutKey == false){
      prefs.setInt("workout", 0);
    }

    containsWorkoutKey = prefs.containsKey("calories");
    if(containsWorkoutKey == false){
      prefs.setInt("calories", 0);
    }
  }

  static int _currentWaterValue = 0;


  void getData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    calories = prefs.getInt('calories') ?? 0;
    setState(() {

    });
  }



  @override
  Widget build(BuildContext context) {
    print("sayfa yüklendi");
    loadJsonAsset();
    var percent = (Welcome.water/8);
    void handleColumnTap() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ActivityScreen()), // Yönlendirme burada yapılıyor
      );
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // Row'un minimum genişlikte olmasını sağlar
          children: [
            Welcome.lang == "en" ? Text(
              "Activity Status",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ) : Text(
              "Отслеживание активности",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),),
            SizedBox(height: 20,),
            Row(
              children: [
                GestureDetector(
                  onTap: handleColumnTap,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 15,),
                        Row(
                          children: [
                            SizedBox(width: 15,),
                            VerticalBarIndicator(
                              percent: (Welcome.water/8),
                              height: 320,
                              width: 25,
                              color: [
                                Colors.indigo,
                                Colors.teal,
                              ],
                            ),
                            SizedBox(width: 15,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Welcome.lang == "en" ?  Text("Water Intake") : Text("Прием воды"),
                                SizedBox(height: 8,),
                                Welcome.lang == "en" ? Text(Welcome.water.toString() +  " Liters") : Text(Welcome.water.toString() +  " литра"),
                                SizedBox(height: 8,),
                                Welcome.lang == "en" ? Text("Real time updates") : Text("Статистика"),
                                SizedBox(height: 4,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(height: 5,),
                                        Container(
                                          width: 8,
                                          height: 8,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF8da2cd),
                                            borderRadius: BorderRadius.circular(4), // Adjust the radius as needed
                                          ),
                                        ),
                                        SizedBox(height: 5,),
                                        Container(
                                          width: 1,
                                          height: 3,
                                          color: Color(0xFF8da2cd),
                                        ),
                                        SizedBox(height: 2,),
                                        Container(
                                          width: 1,
                                          height: 6,
                                          color: Color(0xFF8da2cd),
                                        ),
                                        SizedBox(height: 2,),
                                        Container(
                                          width: 1,
                                          height: 6,
                                          color: Color(0xFF8da2cd),
                                        ),
                                        SizedBox(height: 2,),
                                        Container(
                                          width: 1,
                                          height: 6,
                                          color: Color(0xFF8da2cd),
                                        ),
                                        SizedBox(height: 2,),
                                        Container(
                                          width: 1,
                                          height: 3,
                                          color: Color(0xFF8da2cd),
                                        ),
                                        SizedBox(height: 5,),
                  
                                        Container(
                                          width: 8,
                                          height: 8,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF8da2cd),
                                            borderRadius: BorderRadius.circular(4), // Adjust the radius as needed
                                          ),
                                        ),
                                        SizedBox(height: 5,),
                                        Container(
                                          width: 1,
                                          height: 3,
                                          color: Color(0xFF8da2cd),
                                        ),
                                        SizedBox(height: 2,),
                                        Container(
                                          width: 1,
                                          height: 6,
                                          color: Color(0xFF8da2cd),
                                        ),
                                        SizedBox(height: 2,),
                                        Container(
                                          width: 1,
                                          height: 6,
                                          color: Color(0xFF8da2cd),
                                        ),
                                        SizedBox(height: 2,),
                                        Container(
                                          width: 1,
                                          height: 6,
                                          color: Color(0xFF8da2cd),
                                        ),
                                        SizedBox(height: 2,),
                                        Container(
                                          width: 1,
                                          height: 3,
                                          color: Color(0xFF8da2cd),
                                        ),
                                        SizedBox(height: 5,),
                  
                  
                  
                                        Container(
                                          width: 8,
                                          height: 8,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF8da2cd),
                                            borderRadius: BorderRadius.circular(4), // Adjust the radius as needed
                                          ),
                                        ),
                                        SizedBox(height: 5,),
                                        Container(
                                          width: 1,
                                          height: 3,
                                          color: Color(0xFF8da2cd),
                                        ),
                                        SizedBox(height: 2,),
                                        Container(
                                          width: 1,
                                          height: 6,
                                          color: Color(0xFF8da2cd),
                                        ),
                                        SizedBox(height: 2,),
                                        Container(
                                          width: 1,
                                          height: 6,
                                          color: Color(0xFF8da2cd),
                                        ),
                                        SizedBox(height: 2,),
                                        Container(
                                          width: 1,
                                          height: 6,
                                          color: Color(0xFF8da2cd),
                                        ),
                                        SizedBox(height: 2,),
                                        Container(
                                          width: 1,
                                          height: 3,
                                          color: Color(0xFF8da2cd),
                                        ),
                                        SizedBox(height: 5,),
                                        Container(
                                          width: 8,
                                          height: 8,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF8da2cd),
                                            borderRadius: BorderRadius.circular(4), // Adjust the radius as needed
                                          ),
                                        ),
                                        SizedBox(height: 5,),
                                        Container(
                                          width: 1,
                                          height: 3,
                                          color: Color(0xFF8da2cd),
                                        ),
                                        SizedBox(height: 2,),
                                        Container(
                                          width: 1,
                                          height: 6,
                                          color: Color(0xFF8da2cd),
                                        ),
                                        SizedBox(height: 2,),
                                        Container(
                                          width: 1,
                                          height: 6,
                                          color: Color(0xFF8da2cd),
                                        ),
                                        SizedBox(height: 2,),
                                        Container(
                                          width: 1,
                                          height: 6,
                                          color: Color(0xFF8da2cd),
                                        ),
                                        SizedBox(height: 2,),
                                        Container(
                                          width: 1,
                                          height: 3,
                                          color: Color(0xFF8da2cd),
                                        ),
                                        SizedBox(height: 5,),
                                        Container(
                                          width: 8,
                                          height: 8,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF184099),
                                            borderRadius: BorderRadius.circular(4), // Adjust the radius as needed
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 10,),
                                    Container(
                                      height: 250,
                                      width: 100,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          getHours(8),
                                          SizedBox(height: 10,),
                                          getHours(6),
                                          SizedBox(height: 10,),
                                          getHours(4),
                                          SizedBox(height: 10,),
                                          getHours(2),
                                          SizedBox(height: 10,),
                                          getHours(0),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 15,),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                Column(
                  children: [
                    GestureDetector(
                      onTap: handleColumnTap,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.423,
                        padding: EdgeInsets.all(16.0),
                        height: 160,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Welcome.lang == "en" ? Text("Foot steps"): Text("Шагов"),
                            Text(steps.toString()),
                            SvgPicture.asset(
                              'assets/images/Sleep-Graph.svg', // Replace 'assets/image.svg' with your SVG file path
                              height: 88, // Adjust height as needed
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    GestureDetector(
                      onTap: handleColumnTap,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.40,
                        padding: EdgeInsets.all(16.0),
                        height: 195,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Welcome.lang == "en" ? Text("Calories") :  Text("Калории"),
                            Text(calories.toString()),
                            CircularPercentIndicator(
                              radius: 45.0,
                              lineWidth: 9.0,
                              percent: calories / 1000,
                              center: Container(
                                width: 65,
                                height: 65,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    stops: [0.0, 1.0],
                                    colors: [
                                      Color(0xFF1E55A5),
                                      Color(0xFF14288B),
                                    ],
                                    transform: GradientRotation(274.42 * 3.14 / 180), // Convert degrees to radians
                                  ),
                                ),
                                child: Center(
                                  child: Welcome.lang == "en" ?  Text(
                                    (1000 - calories).toString() + "kCal\n    left",
                                    style: TextStyle(
                                      backgroundColor: Colors.transparent, // Transparent background to see the gradient
                                      color: Colors.white,
                                      fontSize: 12// Text color
                                    ),
                                  ) : Text(
                                    (1000 - calories).toString() + "kCal\nОсталось",
                                    style: TextStyle(
                                        backgroundColor: Colors.transparent, // Transparent background to see the gradient
                                        color: Colors.white,
                                        fontSize: 12// Text color
                                    ),
                                  ),
                                ),
                              ),
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Color(0xFF1E55A5),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
        
              ],
            ),
            SizedBox(height: 20,),
            Welcome.lang == "en" ? Text("What Do You Want To Train") : Text("Что ты хочешь накачать ?"),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(16.0),
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                color: Color(0xFFd2d9eb),
                borderRadius: BorderRadius.circular(15), // Adjust the radius as needed
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Welcome.lang == "en" ? Text("Fullbody Workout") : Text("Тренировка всего тела"),
                      SizedBox(height: 10,),
                      Welcome.lang == "en" ? Text("11 Exercies | 32mins") : Text("7 упражнений | 30 минут"),
                      SizedBox(height: 10,),
                      TextButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FullbodyWorkout(type:"fullbody" + Welcome.pp)), // Yönlendirme burada yapılıyor
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(14.0),
                            width: 120,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25), // Adjust the radius as needed
                            ),
                            child: Welcome.lang == "en" ?  Text("View More",
                              style: TextStyle(
                                  backgroundColor: Colors.white,
                              )) :  Text("Перейти",
                                style: TextStyle(
                                  backgroundColor: Colors.white,
                                ),
                            ),
                          ),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/Ellipse.png', // Ensure the path is correct
                    width: 120, // Adjust width as needed
                    height: 120, // Adjust height as needed
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.all(16.0),
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                color: Color(0xFFd2d9eb),
                borderRadius: BorderRadius.circular(15), // Adjust the radius as needed
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Welcome.lang == "en" ?  Text("Lowebody Workout") : Text("Тренировка ног") ,
                      SizedBox(height: 10,),
                      Welcome.lang == "en" ?  Text("12 Exercies | 40mins") : Text("5 упражнений | 20 минут"),
                      SizedBox(height: 10,),
                      TextButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FullbodyWorkout(type:"lowebody"+ Welcome.pp)), // Yönlendirme burada yapılıyor
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(14.0),
                          width: 120,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25), // Adjust the radius as needed
                          ),
                          child: Welcome.lang == "en" ?  Text("View More",
                              style: TextStyle(
                                backgroundColor: Colors.white,
                              )) :  Text("Перейти",
                            style: TextStyle(
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/Ellipse 116.png', // Ensure the path is correct
                    width: 120, // Adjust width as needed
                    height: 120, // Adjust height as needed
                  ),
                ],
              ),
            ),
            SizedBox(height:15,),
            Container(
              padding: EdgeInsets.all(16.0),
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                color: Color(0xFFd2d9eb),
                borderRadius: BorderRadius.circular(15), // Adjust the radius as needed
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Welcome.lang == "en" ?   Text("AB Workout") : Text("Тренировка пресса") ,
                      SizedBox(height: 10,),
                      Welcome.lang == "en" ?   Text("14 Exercies | 20mins") : Text("9 упражнений | 40 минут"),
                      SizedBox(height: 10,),
                      TextButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FullbodyWorkout(type:"ab"+ Welcome.pp)), // Yönlendirme burada yapılıyor
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(14.0),
                          width: 120,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25), // Adjust the radius as needed
                          ),
                          child: Welcome.lang == "en" ?  Text("View More",
                              style: TextStyle(
                                backgroundColor: Colors.white,
                              )) :  Text("Перейти",
                            style: TextStyle(
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/Ellipse 117.png', // Ensure the path is correct
                    width: 120, // Adjust width as needed
                    height: 120, // Adjust height as needed
                  ),
                ],
              ),
            ),
            SizedBox(height:25,),
          ],
        ),
      ),
    );
  }
}

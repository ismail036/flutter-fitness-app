import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:vertical_percent_indicator/vertical_percent_indicator.dart';
import 'package:intl/intl.dart';
import 'FullbodyWorkout.dart';
import 'Notification.dart';
import 'activity.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFF7F7F7),
          appBar: AppBar(
            title: Text('Home'),
            actions: [
              IconButton(
                icon: SvgPicture.asset(
                  'assets/images/Group.svg', // SVG dosyanızın yolu
                  width: 24, // Genişlik
                  height: 24, // Yükseklik
                ),
                onPressed: () {
                  // Ekleme butonuna basıldığında yapılacak işlemler
                },
              ),
              IconButton(
                icon: SvgPicture.asset(
                  'assets/images/Group-2.svg', // SVG dosyanızın yolu
                  width: 24, // Genişlik
                  height: 24, // Yükseklik
                ),
                onPressed: () {
                  // Resim butonuna basıldığında yapılacak işlemler
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

  Text getHours(var hours){
    DateTime now = DateTime.now();
    DateTime hoursAgo1 = now.subtract(Duration(hours: hours));
    DateTime hoursAgo2 = now.subtract(Duration(hours: hours + 2));
    String formattedTime = DateFormat('h a').format(hoursAgo1);
    String formattedTime2 = DateFormat('h a').format(hoursAgo2);
    if(hours == 0){
    return Text(formattedTime2 + " - now",
      style: TextStyle(
        color: Color(0xFFA5A3B0),
        fontSize: 12
        )
    );
    }
    return Text(formattedTime2 + " - " +  formattedTime.toString(),
        style: TextStyle(
            color: Color(0xFFA5A3B0),
            fontSize: 12
        ),
    );
  }



  @override
  Widget build(BuildContext context) {
    Future<void> loadJsonAsset() async {
      final String jsonString = await rootBundle.loadString('assets/data.json');
      data = jsonDecode(jsonString);
      setState(() {
        steps = data["today"][0];
        calories = data["today"][1];
      });
    }
    loadJsonAsset();
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
            Text(
              "Activity Status",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
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
                              percent: 0.5,
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
                                Text("Water Intake"),
                                SizedBox(height: 8,),
                                Text("4 Liters"),
                                SizedBox(height: 8,),
                                Text("Real time updates"),
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
                                          Text("600 ml"),
                                          SizedBox(height: 10,),
                                          getHours(6),
                                          Text("500 ml"),
                                          SizedBox(height: 10,),
                                          getHours(4),
                                          Text("1000 ml"),
                                          SizedBox(height: 10,),
                                          getHours(2),
                                          Text("700 ml"),
                                          SizedBox(height: 10,),
                                          getHours(0),
                                          Text("900 ml"),
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
                            Text("Foot steps"),
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
                            Text("Calories"),
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
                                  child: Text(
                                    (1000 - calories).toString() + "kCal\n    left",
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
            Text("What Do You Want To Train"),
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
                      Text("Fullbody Workout"),
                      SizedBox(height: 10,),
                      Text("11 Exercies | 32mins"),
                      SizedBox(height: 10,),
                      TextButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FullbodyWorkout()), // Yönlendirme burada yapılıyor
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
                            child: Text("View More",
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
                      Text("Lowebody Workout"),
                      SizedBox(height: 10,),
                      Text("12 Exercies | 40mins"),
                      SizedBox(height: 10,),
                      TextButton(
                        onPressed: (){},
                        child: Container(
                          padding: EdgeInsets.all(14.0),
                          width: 120,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25), // Adjust the radius as needed
                          ),
                          child: Text("View More",
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
                      Text("AB Workout"),
                      SizedBox(height: 10,),
                      Text("14 Exercies | 20mins"),
                      SizedBox(height: 10,),
                      TextButton(
                        onPressed: (){},
                        child: Container(
                          padding: EdgeInsets.all(14.0),
                          width: 120,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25), // Adjust the radius as needed
                          ),
                          child: Text("View More",
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

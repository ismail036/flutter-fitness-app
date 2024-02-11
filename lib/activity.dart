import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:vertical_percent_indicator/vertical_percent_indicator.dart';

import 'addWater.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Activity Tracker",
            ),
            centerTitle: true,
          ),
          body: ActivityBody(),
        ),
      ),
    );
  }
}


class ActivityBody extends StatefulWidget {
  const ActivityBody({super.key});

  @override
  State<ActivityBody> createState() => _ActivityBodyState();
}

class _ActivityBodyState extends State<ActivityBody> {

  void addWater(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddWater()), // Yönlendirme burada yapılıyor
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15,),
          Container(
            padding:EdgeInsets.symmetric(horizontal: 16.0,vertical: 16),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color(0xFFd1d9ec)  // Adjust the radius as needed
            ),
            child: Column(
              children: [
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Today Target"),
                    TextButton(
                      onPressed: () {
                        // Add your onPressed logic here
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),// Shape of the container (circle in this case)
                          color: Colors.blue, // Background color of the container
                        ),
                        padding: EdgeInsets.all(8), // Padding around the icon
                        child: Icon(
                          Icons.add,
                          color: Colors.white, // Color of the icon
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: addWater,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: Colors.white  // Adjust the radius as needed
                        ),
                        padding:EdgeInsets.symmetric(vertical: 15.0,horizontal: 15),
                        child: Row(
                          children: [
                            Image.asset(
                                'assets/images/glass 1.png', // Replace 'assets/image.svg' with your SVG file path
                                width: 40, // Adjust width as needed
                                height: 40, // Adjust height as needed
                              ),
                            SizedBox(width: 5,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("8L"),
                                SizedBox(height: 10,),
                                Text("Water Intake"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 15,),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: Colors.white  // Adjust the radius as needed
                      ),
                      padding:EdgeInsets.symmetric(vertical: 15.0,horizontal: 15),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/Group (6).png', // Replace 'assets/image.svg' with your SVG file path
                            width: 40, // Adjust width as needed
                            height: 40, // Adjust height as needed
                          ),
                          SizedBox(width: 15,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("2400"),
                              SizedBox(height: 10,),
                              Text("Foot Steps   "),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 15,),
          Text(
              "Activity Progresss"
          ),
          Material(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Container(
              padding:EdgeInsets.symmetric(horizontal: 10.0,vertical: 16),
              margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        VerticalBarIndicator(
                          percent: 0.5,
                          height: 150,
                          width: 25,
                          color: [
                            Colors.indigo,
                            Colors.teal,
                          ],
                        ),
                        Text("Sun")
                      ],
                    ),
                    Column(
                      children: [
                        VerticalBarIndicator(
                          percent: 0.7,
                          height: 150,
                          width: 25,
                          color: [
                            Colors.indigo,
                            Colors.teal,
                          ],
                        ),
                        Text("Mon")
                      ],
                    ),
                    Column(
                      children: [
                        VerticalBarIndicator(
                          percent: 0.3,
                          height: 150,
                          width: 25,
                          color: [
                            Colors.indigo,
                            Colors.teal,
                          ],
                        ),
                        Text("Tue")
                      ],
                    ),
                    Column(
                      children: [
                        VerticalBarIndicator(
                          percent: 0.4,
                          height: 150,
                          width: 25,
                          color: [
                            Colors.indigo,
                            Colors.teal,
                          ],
                        ),
                        Text("Wed")
                      ],
                    ),
                    Column(
                      children: [
                        VerticalBarIndicator(
                          percent: 0.5,
                          height: 150,
                          width: 25,
                          color: [
                            Colors.indigo,
                            Colors.teal,
                          ],
                        ),
                        Text("Thu")
                      ],
                    ),
                    Column(
                      children: [
                        VerticalBarIndicator(
                          percent: 0.2,
                          height: 150,
                          width: 25,
                          color: [
                            Colors.indigo,
                            Colors.teal,
                          ],
                        ),
                        Text("Fri")
                      ],
                    ),
                    Column(
                      children: [
                        VerticalBarIndicator(
                          percent: 0.4,
                          height: 150,
                          width: 25,
                          color: [
                            Colors.indigo,
                            Colors.teal,
                          ],
                        ),
                        Text("Sat")
                      ],
                    ),
                  ],
                ),
            ),
          ),
        ],
      ),
    );
  }
}


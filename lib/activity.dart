import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 15,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
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
                    Container(
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
          )
        ],
      ),
    );
  }
}


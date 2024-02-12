import 'package:flutter/material.dart';

import 'ExerciseDetail.dart';
import 'GetReady.dart';
import 'WorkoutSchedule.dart';


class FullbodyWorkout extends StatelessWidget {
  const FullbodyWorkout({super.key});

  @override
  Widget build(BuildContext context) {
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
              "Fullbody Workout",
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
  @override
  Widget build(BuildContext context) {
    return Container(
         child: Stack(
           children: [
             Container(
               padding: EdgeInsets.all(30),
                 child: Image.asset("assets/images/Vector.png")
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
                     Text("Fullbody Workout"),
                     SizedBox(height: 10,),
                     Text("7 Exercises | 30mins | 320 Calories Burn"),
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
                                 Text("Schedule Workout",
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
                     Text("Exercises"),
                     SizedBox(height: 15,),
                     GestureDetector(
                       onTap: (){
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => ExerciseDetail()), // Yönlendirme burada yapılıyor
                         );
                       },
                       child: Container(
                         height: 60,
                         child: Row(
                           children: [
                             Expanded(child: Row(
                               children: [
                                 Image.asset("assets/images/jumpingJacks.png"),
                                 Column(
                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text("Jumping jacks"),
                                     Text("15x"),
                                   ],
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
                       height: 60,
                       child: Row(
                         children: [
                           Expanded(child: Row(
                             children: [
                               Image.asset("assets/images/jumpingJacks.png"),
                               Column(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text("Jumping jacks"),
                                   Text("15x"),
                                 ],
                               ),
                             ],
                           ),
                           ),
                           Icon(Icons.navigate_next)
                         ],
                       ),
                     ),
                     SizedBox(height: 15,),
                     Container(
                       height: 60,
                       child: Row(
                         children: [
                           Expanded(child: Row(
                             children: [
                               Image.asset("assets/images/jumpingJacks.png"),
                               Column(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text("Jumping jacks"),
                                   Text("15x"),
                                 ],
                               ),
                             ],
                           ),
                           ),
                           Icon(Icons.navigate_next)
                         ],
                       ),
                     ),
                     SizedBox(height: 15,),
                     Container(
                       height: 60,
                       child: Row(
                         children: [
                           Expanded(child: Row(
                             children: [
                               Image.asset("assets/images/jumpingJacks.png"),
                               Column(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text("Jumping jacks"),
                                   Text("15x"),
                                 ],
                               ),
                             ],
                           ),
                           ),
                           Icon(Icons.navigate_next)
                         ],
                       ),
                     ),
                     SizedBox(height: 15,),
                     Container(
                       height: 60,
                       child: Row(
                         children: [
                           Expanded(child: Row(
                             children: [
                               Image.asset("assets/images/jumpingJacks.png"),
                               Column(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text("Jumping jacks"),
                                   Text("15x"),
                                 ],
                               ),
                             ],
                           ),
                           ),
                           Icon(Icons.navigate_next)
                         ],
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
                             MaterialPageRoute(builder: (context) => GetReady()), // Yönlendirme burada yapılıyor
                           );
                         },
                         child: Text("Start Workout",
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






import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class ExerciseDetail extends StatelessWidget {
  const ExerciseDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Jumping jacks",
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
  var _currentValue = 20;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/jumpingJacksDetail.png"),
            SizedBox(height: 25,),


            /*Stack(
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
                Text("20x",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w900
                  ),
                )
              ],
            ),*/

            
            Text("Jumping Jack",
              style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),
            ),
            SizedBox(height: 3,),
            Text("East | 390 Calories Burn",style: TextStyle(color:Colors.grey),),



            SizedBox(height: 25,),
            Align(
              alignment: Alignment.bottomLeft,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("How To Do It"),
                        Text("4 steps")
                      ],
                    )
                  ],
                )
            ),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("O1",style: TextStyle(fontSize: 15, color: Colors.indigoAccent),),
                  SizedBox(width: 15,),
                  Flexible(
                    child: Column(
                      children: [
                        Text("Stand up straight, arms at your sides, feet shoulder-width apart.",
                        style: TextStyle(fontWeight: FontWeight.w600),),
                        Text("Pull your shoulders back and lower them along your spine. Maintain the natural curve of the neck, relaxing the jaw as well.",
                        style: TextStyle(color: Colors.grey),)
                      ],
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 10,),

            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("O2",style: TextStyle(fontSize: 15, color: Colors.indigoAccent),),
                  SizedBox(width: 15,),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Jump up and stretch your arms above your head.",style: TextStyle(fontWeight: FontWeight.w600),),
                        Text("Put your feet shoulder-width apart, bend your knees slightly so that you can jump. When you bounce or bounce just a few inches off the ground, raise your arms above your head until they are about shoulder width apart.",
                          style: TextStyle(color: Colors.grey),)
                      ],
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 10,),

            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("O3",style: TextStyle(fontSize: 15, color: Colors.indigoAccent),),
                  SizedBox(width: 15,),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Stretch out your legs.",style: TextStyle(fontWeight: FontWeight.w600),),
                        Text("During the jump, spread your legs wider than shoulder width and raise your arms above your head. Give way or take away a little space depending on your height and leave a lot of space between your legs.",
                          style: TextStyle(color: Colors.grey),)
                      ],
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 15,),

            Align(
              alignment: Alignment.centerLeft,
              child: Text("Custom Repetitions"),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NumberPicker(
                  value: _currentValue,
                  minValue: 0,
                  maxValue: 100,
                  onChanged: (value) => setState(() => _currentValue = value),
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
                onPressed: (){},
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

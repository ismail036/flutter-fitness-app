import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

import 'Exercise.dart';
import 'db_helper.dart';

var data = [];

var next = 0;
var exerciseType = "";
var startTime;
class TakeRest extends StatelessWidget {
  TakeRest({super.key, required int nextStep, required String type, required time}){
    next = nextStep;
    exerciseType = type;
    startTime = time;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Take a rest"),
          centerTitle: true,
        ),
        body: TakeRestBody(),
      ),
    );
  }
}

class TakeRestBody extends StatefulWidget {
  const TakeRestBody({super.key});

  @override
  State<TakeRestBody> createState() => _TakeRestBodyState();
}

class _TakeRestBodyState extends State<TakeRestBody> {

  var firstExerciseName = "";
  Future<void> getData() async {
    var db = UserDatabaseProvider();
    await db.open();
    data = await db.getListType(exerciseType);
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    getData();
    return Container(
      margin: EdgeInsets.all(16),
      child: Align(
        child: Column(
          children: [
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("TAKE A REST",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Colors.indigo
                      ),),
                    Container(
                      child: CircularCountDownTimer(
                        duration: 10,
                        initialDuration: 0,
                        controller: CountDownController(),
                        width: MediaQuery.of(context).size.width / 6,
                        height: MediaQuery.of(context).size.height / 6,
                        ringColor: Colors.white,
                        ringGradient: null,
                        fillColor: Colors.white,
                        fillGradient: null,
                        backgroundGradient: null,
                        strokeWidth: 0.0,
                        strokeCap: StrokeCap.round,
                        textStyle: TextStyle(
                            fontSize: 30.0, color: Colors.black, fontWeight: FontWeight.w700),
                        textFormat: CountdownTextFormat.S,
                        isReverse: true,
                        isReverseAnimation: true,
                        isTimerTextShown: true,
                        autoStart: true,
                        onStart: () {
                          debugPrint('Countdown Started');
                        },
                        onComplete: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Exercise(type:workoutType,step:next,fE:data[next]['name'],time: startTime)), // Yönlendirme burada yapılıyor
                          );
                        },
                        onChange: (String timeStamp) {
                          debugPrint('Countdown Changed $timeStamp');
                        },
                        timeFormatterFunction: (defaultFormatterFunction, duration) {
                          return Function.apply(defaultFormatterFunction, [duration]);

                        },
                      ),
                    ),
                    Text("Next Movement (${next+1}/${data.length})"),
                    SizedBox(height: 10,
                    ),
                    Text(data[next]["name"].toString(),
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                      ),
                    )

                  ],
                )
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.only(bottom: 10),
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Exercise(type:workoutType,step:next,fE:data[next]['name'],time: startTime)), // Yönlendirme burada yapılıyor
                  );
                },
                child: Text("Skip rest",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

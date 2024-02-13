import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

import 'Exercise.dart';

class GetReady extends StatelessWidget {
  const GetReady ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Get Ready"),
          centerTitle: true,
        ),
        body: ReadyBody(),
      ),
    );
  }
}

class ReadyBody extends StatefulWidget {
  const ReadyBody({super.key});

  @override
  State<ReadyBody> createState() => _ReadyBodyState();
}

class _ReadyBodyState extends State<ReadyBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
            Expanded(
              child: CircularCountDownTimer(
              duration: 10,
              initialDuration: 0,
              controller: CountDownController(),
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 2,
              ringColor: Colors.grey[300]!,
              ringGradient: null,
              fillColor: Colors.indigo,
              fillGradient: null,
              backgroundGradient: null,
              strokeWidth: 20.0,
              strokeCap: StrokeCap.round,
              textStyle: TextStyle(
                  fontSize: 50.0, color: Colors.black, fontWeight: FontWeight.w900),
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
                  MaterialPageRoute(builder: (context) => Exercise()), // Yönlendirme burada yapılıyor
                );
              },
              onChange: (String timeStamp) {
                debugPrint('Countdown Changed $timeStamp');
              },
              timeFormatterFunction: (defaultFormatterFunction, duration) {
                if (duration.inSeconds == 0) {
                  return "Start";
                } else {
                  return Function.apply(defaultFormatterFunction, [duration]);
                }
              },
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Exercise()), // Yönlendirme burada yapılıyor
                );
              },
              child: Text("Start Workout",
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
    );





  }
}


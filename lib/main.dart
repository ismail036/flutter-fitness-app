import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PERO Fitness',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  Welcome(),
    );
  }
}


class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF152877),
            Color(0xFF2D539E),
          ],
          stops: [0, 1],
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 8, // %80'lik alanı kapla
            child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'PERO',
                          style: TextStyle(
                            color: Color(0xFFDC201E),
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        Text(
                          'fitness',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Everybody Can Train',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Your onTap action goes here
                            print('SVG image tapped!');
                          },
                          child: SvgPicture.asset(
                            'assets/images/Group.svg', // Replace 'assets/image.svg' with your SVG file path
                            width: 60, // Adjust width as needed
                            height: 60, // Adjust height as needed
                          ),
                        ),
                        SizedBox(width: 10,),
                        GestureDetector(
                          onTap: () {
                            // Your onTap action goes here
                            print('SVG image tapped!');
                          },
                          child: SvgPicture.asset(
                            'assets/images/Group-2.svg', // Replace 'assets/image.svg' with your SVG file path
                            width: 60, // Adjust width as needed
                            height: 60, // Adjust height as needed
                          ),
                        ),
                      ],
                    ),
                  ]
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Home()), // Yönlendirme burada yapılıyor
                      );
                    },
                    child: Center(
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      maximumSize: MaterialStateProperty.all<Size>(
                        Size(MediaQuery.of(context).size.width * 0.8,60),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );

  }
}

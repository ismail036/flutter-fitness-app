import 'package:flutter/material.dart';

class Exercise extends StatelessWidget {
  const Exercise ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Jumping Jacks"),
          centerTitle: true,
        ),
      ),
    );
  }
}

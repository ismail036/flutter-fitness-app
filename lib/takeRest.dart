import 'package:flutter/material.dart';

class TakeRest extends StatelessWidget {
  const TakeRest({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Take a rest"),
          centerTitle: true,
        ),
      ),
    );
  }
}

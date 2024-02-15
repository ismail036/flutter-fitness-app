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
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

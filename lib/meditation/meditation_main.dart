import 'package:flutter/material.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({super.key});

  @override
  State<MeditationScreen> createState() => _MeditationScreen();
}

class _MeditationScreen extends State<MeditationScreen> {
  @override
  void initState() {
    super.initState();
  }

  Color _circleColor = Colors.blue;

  void startMeditation() {
    setState(() {
      _circleColor = _circleColor == Colors.blue
          ? Colors.red
          : Theme.of(context).primaryColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            startMeditation();
          },
          child: CircleAvatar(
            radius: 80,
            backgroundColor: _circleColor,
          ),
        ),
      ),
    );
  }
}

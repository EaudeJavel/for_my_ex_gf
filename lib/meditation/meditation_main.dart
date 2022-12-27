import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

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

  void createWave() {
    for (int i = 0; i <= CircleAvatar.radius; i++) {
      sinWave.add(new Offset(i.toDouble(),
      sin((time.value * 360 - i) % 360 * degrees2Radians) * 20));
}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mon espace méditation"),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          child: const CircleAvatar(
            radius: 100,
            backgroundColor: Colors.pink,
            child: Text("Méditer"),
          ),
          onTap: () {
            if (kDebugMode) {
              print("object");
            }
          },
        ),
      ),
    );
  }
}

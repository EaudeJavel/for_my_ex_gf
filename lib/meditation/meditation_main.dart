import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/select_btn.dart';

import '../utils/provider.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({super.key});

  @override
  State<MeditationScreen> createState() => _MeditationScreen();
}

class _MeditationScreen extends State<MeditationScreen> {
  Color _circleColor = Colors.red;

  List<String> get minutes => [
        "1",
        "2",
        "3",
      ];

  final String _selectedMinute = "0";

  Color tdm(OnDarkMode onDarkMode) {
    return onDarkMode.textDarkmode;
  }

  @override
  void initState() {
    super.initState();
  }

  String changeTime(item) {
    item = _selectedMinute;
    return _selectedMinute;
  }

  void startMeditation(int time) {
    if (kDebugMode) {
      print(_selectedMinute);
    }
    setState(() {
      _circleColor = Colors.green;
    });
    Future.delayed(Duration(minutes: time), () {
      setState(() {
        _circleColor = Colors.red;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.watch<OnDarkMode>().bgDarkmode,
        title: Text(
          "Meditation",
          style: TextStyle(
            color: tdm(context.watch<OnDarkMode>()),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: context.watch<OnDarkMode>().bgDarkmode,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => {
                startMeditation(int.parse(_selectedMinute)),
              },
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: _circleColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Time'),
                const SizedBox(width: 20),
                DropdownInline(items: minutes, onChanged: changeTime)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

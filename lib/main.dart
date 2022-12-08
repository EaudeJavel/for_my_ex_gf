import 'package:flutter/material.dart';

import 'package:no_more_anxiety/theme.dart';
import 'package:no_more_anxiety/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    Theme(
      data: myAppTheme,
      child: const ElisoApp(),
    ),
  );
}

class ElisoApp extends StatefulWidget {
  const ElisoApp({super.key});

  @override
  ElisoAppState createState() => ElisoAppState();
}

class ElisoAppState extends State<ElisoApp> {
  bool isBusy = false;
  bool isLoggedIn = true;
  String errorMessage = " ";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eliso',
      theme: Theme.of(context),
      home: const MyHomePage(
        title: "Bye bye l'anxiété",
      ),
    );
  }
}

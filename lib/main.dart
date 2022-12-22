import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:no_more_anxiety/layouts/scaffold.dart';

import 'package:no_more_anxiety/theme.dart';
// ignore: unused_import
import 'package:no_more_anxiety/routes.dart';
import 'package:no_more_anxiety/utils/notif_service.dart';

void main() async {
  DartPluginRegistrant.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initNotifs();
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
      home: const Scaffold(
        body: Center(
          child: FirstLevelScaffold(),
        ),
      ),
    );
  }
}

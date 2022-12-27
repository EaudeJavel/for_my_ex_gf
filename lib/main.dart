// ignore_for_file: unused_import

import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:no_more_anxiety/layouts/scaffold.dart';
import 'package:no_more_anxiety/routes.dart';
import 'package:no_more_anxiety/utils/notif_service.dart';
import 'package:provider/provider.dart';

void main() async {
  DartPluginRegistrant.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initNotifs();
  await NotificationService().showNotification();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => BgButtonColor()),
    ],
    child: const ElisoApp(),
  ));
}

class ElisoApp extends StatelessWidget {
  const ElisoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

/// Mix-in [DiagnosticableTreeMixin] to have access to [debugFillProperties] for the devtool
class BgButtonColor with ChangeNotifier, DiagnosticableTreeMixin {
  String _bgButtonColor = "0xFFE0E0E0";
  String get bgButtonColor => _bgButtonColor;

  void changeBgColor() {
    if (_bgButtonColor == "0xFFE0E0E0") {
      _bgButtonColor = "0x00FFE0E0";
    } else {
      _bgButtonColor = "0xFFE0E0E0";
    }
    if (kDebugMode) {
      print(_bgButtonColor);
    }
    notifyListeners();
  }

  /// Makes `BgButtonColor` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('bgColor', bgButtonColor));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color(int.parse(context.watch<BgButtonColor>().bgButtonColor)),
      appBar: AppBar(
        title: const Text('Example'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('change color'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('changeBG_floatingActionButton'),
        onPressed: () => context.read<BgButtonColor>().changeBgColor(),
        tooltip: 'Change color',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ChangeColor extends StatelessWidget {
  const ChangeColor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${context.watch<ChangeColor>()}',
      key: const Key('colorState'),
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}

// class ElisoApp extends StatefulWidget {
//   const ElisoApp({super.key});

//   @override
//   ElisoAppState createState() => ElisoAppState();
// }

// class ElisoAppState extends State<ElisoApp> {
//   bool isBusy = false;
//   bool isLoggedIn = true;
//   String errorMessage = " ";

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Eliso',
//       theme: Theme.of(context),
//       home: const Scaffold(
//         body: Center(
//           child: FirstLevelScaffold(),
//         ),
//       ),
//     );
//   }
// }

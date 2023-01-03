import 'dart:ui';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:no_more_anxiety/theme.dart';
import 'package:no_more_anxiety/layouts/scaffold.dart';
import 'package:no_more_anxiety/routes.dart';
import 'package:no_more_anxiety/utils/notif_service.dart';

void main() async {
  DartPluginRegistrant.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initNotifs();
  await NotificationService().showNotification();
  runApp(
    Theme(
      data: myAppTheme,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => OnDarkMode()),
        ],
        child: const ElisoApp(),
      ),
    ),
  );
}

class ElisoApp extends StatefulWidget {
  const ElisoApp({super.key});

  @override
  ElisoAppState createState() => ElisoAppState();
}

class ElisoAppState extends State<ElisoApp> {
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




// class ElisoApp extends StatelessWidget {
//   const ElisoApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor:
//           Color(int.parse(context.watch<BgButtonColor>().bgButtonColor)),
//       appBar: AppBar(
//         title: const Text('Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: const <Widget>[
//             Text('change color'),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         key: const Key('changeBG_floatingActionButton'),
//         onPressed: () => context.read<BgButtonColor>().changeBgColor(),
//         tooltip: 'Change color',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
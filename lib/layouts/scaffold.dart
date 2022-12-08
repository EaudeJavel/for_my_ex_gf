// import 'package:flutter/material.dart';
// import 'package:no_more_anxiety/routes.dart';

// class FirstLevelScaffold extends StatefulWidget {
//   const FirstLevelScaffold({super.key});

//   @override
//   FirstLevelScaffoldState createState() => FirstLevelScaffoldState();
// }

// class FirstLevelScaffoldState extends State<FirstLevelScaffold>
//     with SingleTickerProviderStateMixin {
//   int _currentIndex = 0;
//   final List<Widget> _screen = <Widget>[
//     const MyHomePage(
//       title: "test",
//     ),
//   ];
//   late TabController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = TabController(length: _screen.length, vsync: this);
//   }

//   void onTabTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//       _controller.animateTo(index);
//     });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: null,
//       body: TabBarView(controller: _controller, children: _screen),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: const Color(0xFFFFFFFF),
//         elevation: 10,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         selectedItemColor: ThemeData().primaryColor,
//         unselectedItemColor: ThemeData().colorScheme.secondary,
//         onTap: onTabTapped,
//         currentIndex: _currentIndex,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.music_note),
//             label: 'Music',
//           ),
//         ],
//       ),
//     );
//   }
// }

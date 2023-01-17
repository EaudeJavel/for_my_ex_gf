// ignore_for_file: unnecessary_null_comparison, unused_import
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show SystemUiOverlayStyle, rootBundle;
import 'package:no_more_anxiety/theme.dart';
import 'package:provider/provider.dart';

import 'package:no_more_anxiety/routes.dart';
import 'package:no_more_anxiety/components/heart.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, String? payload});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String>? sentences;
  bool _isVisible = false;

  Color tdm(OnDarkMode onDarkMode) {
    return onDarkMode.textDarkmode;
  }

  @override
  void initState() {
    super.initState();
    loadSentences();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: context.watch<OnDarkMode>().bgDarkmode,
            appBar: AppBar(
              backgroundColor: context.watch<OnDarkMode>().bgDarkmode,
              systemOverlayStyle: SystemUiOverlayStyle(
                systemNavigationBarColor: Colors.transparent,
                systemNavigationBarIconBrightness: Brightness.dark,
                statusBarColor: context.watch<OnDarkMode>().bgDarkmode,
                statusBarBrightness: Brightness.dark,
                statusBarIconBrightness: Brightness.dark,
              ),
              title: Text(
                "No more anxiety",
                style: TextStyle(
                  color: tdm(context.watch<OnDarkMode>()),
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.favorite),
                  key: const Key('changeBG_floatingActionButton'),
                  onPressed: () => context.read<OnDarkMode>().changeBgColor(),
                  tooltip: 'Change color',
                  color: tdm(context.watch<OnDarkMode>()),
                ),
              ],
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder(
                  future: loadSentences(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      // If the Future is complete, check if it was successful or not
                      if (snapshot.hasError) {
                        return Center(
                          child: Text("An error occurred: ${snapshot.error}"),
                        );
                      } else {
                        // The Future was successful, so we can extract the sentences from the snapshot
                        // Check if the sentences list is null
                        if (sentences == null) {
                          return const Center(
                            child: Text(
                                "Sorry, no sentence is available for today."),
                          );
                        } else {
                          // The sentences list is not null, so we can use it
                          // Calculate the index of the sentence to display
                          int index = DateTime.now().day % sentences!.length;
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 30),
                                  child: SizedBox(
                                      width: 300,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Visibility(
                                          visible: _isVisible,
                                          child: Text(
                                            sentences![index],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: tdm(
                                                  context.watch<OnDarkMode>()),
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      )),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _isVisible = !_isVisible;
                                    });
                                    if (kDebugMode) {
                                      print("visible: $_isVisible");
                                    }
                                    // createText();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    //here
                                    foregroundColor:
                                        context.watch<OnDarkMode>().bgDarkmode,
                                    backgroundColor:
                                        tdm(context.watch<OnDarkMode>()),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                  child: const HeartWidget(),
                                ),
                              ],
                            ),
                          );
                        }
                      }
                    } else {
                      // The Future is still pending, so show a loading indicator
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ],
            )));
  }

  Future<List<String>?> loadSentences() async {
    // Load the JSON string from the asset
    Future<String> jsonStringFuture =
        rootBundle.loadString('assets/json/sentences.json');
    // Wait for the future to complete, and then extract the string value
    String jsonString = await jsonStringFuture;

    // Check if the JSON string represents a map or a list
    if (json.decode(jsonString) is List) {
      // JSON string represents a list
      List jsonData = json.decode(jsonString);
      sentences = jsonData.map((sentence) => sentence.toString()).toList();
    } else {
      // JSON string represents a map
      Map jsonData = json.decode(jsonString);
      // Extract the values from the map and add them to the sentences list
      sentences =
          jsonData.values.map((sentence) => sentence.toString()).toList();
    }
    return sentences;
  }
}

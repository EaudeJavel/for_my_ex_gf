// ignore_for_file: avoid_print, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String>? sentences;

  @override
  void initState() {
    super.initState();
    // Load the sentences when the widget is initialized
    loadSentences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: loadSentences(), // Call the loadSentences function
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
                  child: Text("Sorry, no sentence is available for today."),
                );
              } else {
                // The sentences list is not null, so we can use it
                // Calculate the index of the sentence to display
                int index = DateTime.now().day % sentences!.length;
                print(index);
                return Center(
                  child: Text(sentences![index]),
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
    );
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

    // Return the sentences list
    return sentences;
  }
}

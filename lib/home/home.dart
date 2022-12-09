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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  // Declare an AnimationController
  late AnimationController _controller;
  // Declare an Animation for the size of the HeartWidget
  late Animation<double> _sizeAnimation;
  // Declare an Animation for the color of the HeartWidget
  late Animation<Color?> _colorAnimation;
  List<String>? sentences;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
      debugLabel: 'HeartAnimation',
    );

    // Initialize the _sizeAnimation field
    _sizeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    // Use the Tween to animate the size of the HeartWidget
    _sizeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_sizeAnimation);

    // Create a ColorTween to animate the color of the HeartWidget
    ColorTween colorTween = ColorTween(
      begin: Colors.green,
      end: Colors.red,
    );

    // Create an Animation for the color of the HeartWidget
    _colorAnimation = colorTween.animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    // Load the sentences when the widget is initialized
    loadSentences();
  }

  @override
  void dispose() {
    // Dispose of the AnimationController when the widget is disposed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          // Trigger the heart animation when the button is clicked
          onPressed: () => _controller.forward(),
          child: const Icon(Icons.favorite),
        ),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
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
                        child:
                            Text("Sorry, no sentence is available for today."),
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
            Center(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) => HeartWidget(
                  size: _sizeAnimation.value,
                  color: _colorAnimation.value,
                ),
              ),
            ),
          ],
        ));
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

class HeartWidget extends StatelessWidget {
  const HeartWidget({
    super.key,
    required this.size,
    required this.color,
  });

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.favorite,
      size: size,
      color: color,
    );
  }
}

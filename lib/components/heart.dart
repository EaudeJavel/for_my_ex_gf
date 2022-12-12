// ignore_for_file: unused_import
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HeartWidget extends StatelessWidget {
  const HeartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.favorite,
    );
  }
}

//create a function that create a heart icon in the middle of the screen
void createHeartIcon() {
  const Center(
    child: HeartWidget(),
  );
  if (kDebugMode) {
    print("Heart icon created");
  }
}
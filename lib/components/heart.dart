import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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

//create a function that create a heart icon in the middle of the screen
HeartWidget createHeartIcon() {
  //create a heart icon
  HeartWidget heart = const HeartWidget(
    size: 100,
    color: Colors.red,
  );
  if (kDebugMode) {
    print(heart.size);
  }
  return heart;
}

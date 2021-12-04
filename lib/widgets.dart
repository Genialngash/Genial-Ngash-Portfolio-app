import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

Widget skillWidget({required String skill, required IconData icondata}) {
  return SizedBox(
    height: 35,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icondata,
          color: Colors.orangeAccent,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          skill,
          softWrap: true,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )
      ],
    ),
  );
}

Widget textAnimateColorized({required String text}) {
  const colorizeColors = [
    Colors.greenAccent,
    Colors.tealAccent,
    Colors.red,
    Colors.white
  ];
  return AnimatedTextKit(
    //TODO repeatForever: true,
    animatedTexts: [
      ColorizeAnimatedText(
        text,
        speed: Duration(milliseconds: 357),
        textStyle: TextStyle(
          fontSize: 30,
        ),
        colors: colorizeColors,
      ),
    ],
    isRepeatingAnimation: true,
    onTap: () {
      print("Tap Event");
    },
  );
}

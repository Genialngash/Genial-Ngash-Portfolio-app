import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          style: GoogleFonts.ibmPlexMono(),
          softWrap: true,
          maxLines: 2,
          //overflow: TextOverflow.fade,
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
        textStyle: GoogleFonts.secularOne(
          fontSize: 25,
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

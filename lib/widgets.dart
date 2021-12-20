import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:clay_containers/constants.dart';
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

Widget textAnimateColorized({required String text,double? fontsize}) {
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
          fontSize: fontsize??25,
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

class ExperienceDaysContainer extends StatelessWidget {
  const ExperienceDaysContainer(
      {Key? key, required this.duration, required this.durationName})
      : super(key: key);

  final String duration;
  final String durationName;

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
        height: 60,
        width: 70,
        depth: 70,
        spread: 2,
        curveType: CurveType.concave,
        color: const Color(0xff2F5552),
        customBorderRadius: BorderRadius.all(
          Radius.elliptical(3, 13),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(duration), Text(durationName)],
        ));
  }
}

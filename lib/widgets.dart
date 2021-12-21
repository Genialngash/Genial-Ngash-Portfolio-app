import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

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
        const SizedBox(
          width: 10,
        ),
        Text(
          skill,
          style: GoogleFonts.ibmPlexMono(color: Colors.white),
          softWrap: true,
          maxLines: 2,
          //overflow: TextOverflow.fade,
        )
      ],
    ),
  );
}

Widget textAnimateColorized({required String text, double? fontsize}) {
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
        speed: const Duration(milliseconds: 357),
        textStyle: GoogleFonts.secularOne(
          fontSize: fontsize ?? 25,
        ),
        colors: colorizeColors,
      ),
    ],
    isRepeatingAnimation: true,
    onTap: () {
     
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
        customBorderRadius: const BorderRadius.all(
          Radius.elliptical(3, 13),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              duration,
              style: GoogleFonts.ibmPlexMono(
                fontSize: 21,
                color: Colors.white,
              ),
            ),
            Text(
              durationName,
              style: GoogleFonts.ibmPlexMono(color: Colors.white70),
            )
          ],
        ));
  }
}

Widget socialMediaWidget({required String url, required IconData iconData}) {
  return IconButton(
    onPressed: () async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'cant launch $url';
      }
    },
    icon: FaIcon(iconData),
    color: const Color(0xffF0DD9E),
  );
}

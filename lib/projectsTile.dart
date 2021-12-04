import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart' as timelineTile;
import 'package:url_launcher/url_launcher.dart';

class ProjectsTile extends StatelessWidget {
  const ProjectsTile(
      {Key? key,
      required this.projectTitle,
      required this.assetImageName,
      this.url,
      this.projectDescription})
      : super(key: key);

  final String projectTitle;
  final String? url;
  final String? projectDescription;
  final String assetImageName;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 135,
      child: timelineTile.TimelineTile(
        lineXY: 0.42469,
        alignment: timelineTile.TimelineAlign.manual,
        endChild: GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AnimatedContainer(
                height: screenHeight * .7,
                width: screenWidth * .6,
                duration: Duration(milliseconds: 200),
                margin: EdgeInsets.symmetric(
                    vertical: 40, horizontal: (screenWidth * .3).toDouble()),
                padding: const EdgeInsets.only(top: 4),
                decoration: BoxDecoration(
                  backgroundBlendMode: BlendMode.softLight,
                  color: Color(0xff000A18),
                  image: DecorationImage(
                      image: AssetImage('assets/images/$assetImageName'),
                      fit: BoxFit.contain),
                ),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              backgroundBlendMode: BlendMode.softLight,
              color: Colors.transparent.withOpacity(0.5),
              image: DecorationImage(
                  image: AssetImage('assets/images/$assetImageName'),
                  fit: BoxFit.contain),
            ),
          ),
        ),
        indicatorStyle: timelineTile.IndicatorStyle(
          width: screenWidth * 0.8,
          height: 76,
          drawGap: true,
          indicator: Container(
            width: screenWidth * .8,
            height: 10,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.amber,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                RichText(
                  textScaleFactor: 1.3,
                  text: TextSpan(
                    text: projectTitle,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        log('click');
                        if (await canLaunch(url!)) {
                          await launch(url!);
                        } else {
                          throw 'cant launch $url';
                        }
                      },
                    style: const TextStyle(
                        color: Colors.lightBlue, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(projectDescription ?? ' '),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

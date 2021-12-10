import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart' as timelineTile;
import 'package:url_launcher/url_launcher.dart';

class ProjectsTile extends StatelessWidget {
  const ProjectsTile(
      {Key? key,
      required this.projectTitle,
      required this.assetImageName,
      required this.index,
      this.url,
      this.projectDescription})
      : super(key: key);

  final String projectTitle;
  final String? url;
  final String? projectDescription;
  final String assetImageName;
  final String index;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 125,
      width: screenWidth,
      child: timelineTile.TimelineTile(
        lineXY: 0.42469,
        beforeLineStyle: const timelineTile.LineStyle(
          thickness: 2,
          color: Color(0xffA8E5DC),
        ),
        afterLineStyle: const timelineTile.LineStyle(
          thickness: 3,
          color: Colors.white60,
        ),
        alignment: timelineTile.TimelineAlign.manual,
        startChild: SizedBox.fromSize(
          size: const Size.fromRadius(30),
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 25,
              width: 25,
              padding: const EdgeInsets.all(2),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.elliptical(9, 3)),
                border: Border.all(
                  width: 0.8,
                  color: Colors.amberAccent,
                ),
              ),
              child: Text(
                index,
                style: GoogleFonts.secularOne(
                  color: Colors.tealAccent[400],
                ),
              ),
            ),
          ),
        ),
        endChild: InkWell(
          onTap: () {
            log('clicked');
          },
          onHover: (isHovering) {
            if (isHovering)
              showDialog(
                context: context,
                builder: (context) => AnimatedContainer(
                  height: screenHeight * .7,
                  width: screenWidth * .6,
                  duration: const Duration(milliseconds: 200),
                  margin: EdgeInsets.symmetric(
                      vertical: 40, horizontal: (screenWidth * .3).toDouble()),
                  padding: const EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    backgroundBlendMode: BlendMode.softLight,
                    color: const Color(0xff000A18),
                    image: DecorationImage(
                        image: AssetImage('assets/images/$assetImageName'),
                        fit: BoxFit.contain),
                  ),
                ),
              ).then((value) => Navigator.of(context).maybePop());
            else {
             // Navigator.of(context).maybePop();

              print(isHovering);
            }
          },
          child: Container(
            clipBehavior: Clip.hardEdge,
            margin: const EdgeInsets.only(top: 10, left: 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.elliptical(3, 13)),
              backgroundBlendMode: BlendMode.softLight,
              color: Colors.transparent.withOpacity(0.6),
              image: DecorationImage(
                  filterQuality: FilterQuality.high,
                  opacity: 0.7,
                  image: AssetImage('assets/images/$assetImageName'),
                  fit: BoxFit.cover),
            ),
          ),
        ),
        indicatorStyle: timelineTile.IndicatorStyle(
          width: screenWidth * 0.68,
          height: 87,
          drawGap: true,
          indicator: Container(
            width: screenWidth * .8,
            height: 10,
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.amber.withOpacity(0.3),
              ),
              borderRadius: BorderRadius.circular(17),
            ),
            child: Column(
              children: [
                RichText(
                  textScaleFactor: 1.3,
                  text: TextSpan(
                    text: '$projectTitle',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        log('click');
                        if (await canLaunch(url!)) {
                          await launch(url!);
                        } else {
                          throw 'cant launch $url';
                        }
                      },
                    style: GoogleFonts.secularOne(
                      color: const Color(0xff1CDEC0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  projectDescription ?? ' ',
                  style: GoogleFonts.ibmPlexMono(
                    color: Colors.white60,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

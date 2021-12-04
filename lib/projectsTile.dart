import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart' as timelineTile;

class ProjectsTile extends StatelessWidget {
  const ProjectsTile(
      {Key? key,
      required this.screenWidth,
      required this.projectTitle,
      this.projectDescription})
      : super(key: key);

  final double screenWidth;
  final String projectTitle;
  final String? projectDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 135,
      child: timelineTile.TimelineTile(
        lineXY: 0.42469,
        alignment: timelineTile.TimelineAlign.manual,
        indicatorStyle: timelineTile.IndicatorStyle(
          width: screenWidth * 0.8,
          height: 70,
          drawGap: true,
          indicator: Container(
            width: screenWidth * .8,
            height: 10,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.amber,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text(projectTitle),
                Text(projectDescription ?? ' '),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart' as timelineTile;

class ProjectsTile extends StatelessWidget {
  const ProjectsTile({
    Key? key,
    required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
    height: 200,
    child: timelineTile.TimelineTile(
      
      alignment: timelineTile.TimelineAlign.center,
      indicatorStyle: timelineTile.IndicatorStyle(
          width: screenWidth*0.8,
          height: 70,
          drawGap: true,
          indicator: Container(
            width: screenWidth*.8,
            height: 10,
            decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(20)),
          )),
    ),
                );
  }
}
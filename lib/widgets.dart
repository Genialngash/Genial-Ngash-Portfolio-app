import 'package:flutter/material.dart';

Widget skillWidget({required String skill, required IconData icondata}) {
  return SizedBox(
    height: 35,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          icondata,
          color: Colors.orangeAccent,
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
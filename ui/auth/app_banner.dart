import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myshop/app_properties.dart';

class AppBanner extends StatelessWidget {
  const AppBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 94.0,
      ),
      // transform: Matrix4.rotationZ(-8 * pi / 180)..translate(-10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(80),
        // color: Colors.deepOrange.shade900,
        boxShadow: const [
          BoxShadow(
            blurRadius: 8,
            color: Colors.blueGrey,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: const Text(

        'RUBIK',
        style: TextStyle(
          color: Color(0xFFFFEBEE),
          fontSize: 100,
          fontFamily: 'Glorious',
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}

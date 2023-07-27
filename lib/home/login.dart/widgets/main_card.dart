
import 'package:firebase_test/core/color.dart';
import 'package:flutter/material.dart';

import '../../../core/constants.dart';

class SignInText extends StatelessWidget {
  const SignInText({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 165),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            child: Image.asset('assets/image01.jpg'),
          ),
          kHeight,
          Text(
            title,
            style: TextStyle(
              fontSize: 26,
              color: backgroundcolor,
              // fontWeight: FontWeight.bold,
            ),
          ),
         height50,
          // kHeight20
        ],
      ),
    );
  }
}

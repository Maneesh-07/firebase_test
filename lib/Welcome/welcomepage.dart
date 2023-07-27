import 'package:firebase_test/Provider/auth_provider.dart';
import 'package:firebase_test/core/constants.dart';
import 'package:firebase_test/home/home/home_screen.dart';
import 'package:firebase_test/widgets/button_widget.dart';

import 'package:flutter/material.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 25.0,
            horizontal: 35,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image1.png',
                height: 300,
              ),
              tileHeight,
              Text(
                "Let's Get Started",
                style: fontStyle,
              ),
              kHeight,
              Text(
                "Never a better time thsn now to start",
                style: fontStyle,
              ),
              tileHeight,
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ButtonWidget(
                  buttonColor: Colors.black54,
                  label: 'Get Started',
                  onTap: () {
                   
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ));
                   
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_test/Provider/auth_provider.dart';
import 'package:firebase_test/Welcome/login_screen/login_screen.dart';
import 'package:firebase_test/Welcome/welcomepage.dart';
import 'package:firebase_test/core/constants.dart';
import 'package:firebase_test/services/otp_auth_services.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Signed In As",
            style: fontStyle,
          ),
          kHeight,
          // Text(user.email!),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Auth().logout();
                Get.offAll(MobileLoginPage());
              },
              child: const Text("Logout"),
            ),
          ),
        ],
      ),
    ));
  }
}

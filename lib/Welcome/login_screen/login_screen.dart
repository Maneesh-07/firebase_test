import 'dart:developer';

import 'package:firebase_test/Welcome/otp_screen/otp_screen.dart';
import 'package:firebase_test/core/color.dart';

import 'package:firebase_test/services/otp_auth_services.dart';
import 'package:firebase_test/widgets/button_widget.dart';
import 'package:firebase_test/widgets/textform_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/internet_connectivity_controller.dart';

Auth a = Auth();

TextEditingController mobileController = TextEditingController();

class MobileLoginPage extends StatelessWidget {
  MobileLoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ConnectivityService connectivityService = Get.find();
    return Obx(
      () {
        if (!connectivityService.hasInternetConnection.value) {
          return connectivityService.showAlert(context);
        }
        return Scaffold(
          backgroundColor: backgroundcolor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 250, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      const Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: kWhiteColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Add your phone number.\n We'll send you a verification code",
                        style: TextStyle(
                          fontSize: 13,
                          color: kWhiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 15),
                      Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextFormFieldWidget(
                            lableText: 'Mobile',
                            controller: mobileController,
                            keyboardType: TextInputType.phone,
                            maxLength: 10,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your mobile';
                              } else if (value.length != 10) {
                                return 'Enter a valid mobile.';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      ButtonWidget(
                        label: 'Send OTP',
                        onTap: () async {
                          if (!_formKey.currentState!.validate()) return;
                          sendOtp();
                          Get.to(() => CheckLoginOtp(
                              mobile: '+91${mobileController.text.trim()}'));
                        },
                        buttonColor: colorRed,
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style.copyWith(
                                fontSize: 12,
                                color: kWhiteColor,
                                decoration: TextDecoration.none),
                            children: [
                              const TextSpan(
                                text: "By continuing, you agree to our ",
                                style: TextStyle(),
                              ),
                              TextSpan(
                                text: "User Agreement",
                                style: const TextStyle(
                                  color: colorRed,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    log('User Agreement');
                                  },
                              ),
                              const TextSpan(
                                text: " and ",
                                style: TextStyle(),
                              ),
                              TextSpan(
                                text: "Privacy Policy",
                                style: const TextStyle(
                                  color: colorRed,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    log('Privacy Policy');
                                  },
                              ),
                              const TextSpan(
                                text: ".",
                                style: TextStyle(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  sendOtp() async {
    await a.sendOTP('+91${mobileController.text.trim()}');
  }
}

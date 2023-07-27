import 'package:firebase_test/Welcome/login_screen/login_screen.dart';
import 'package:firebase_test/core/color.dart';
import 'package:firebase_test/core/constants.dart';
import 'package:firebase_test/home/home/home_screen.dart';

import 'package:firebase_test/widgets/internet_connectivity_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/button_widget.dart';
import '../../widgets/textform_widget.dart';

class CheckLoginOtp extends StatelessWidget {
  const CheckLoginOtp({super.key, required this.mobile});

  final String mobile;

  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();
    final ConnectivityService connectivityService = Get.find();

    return Obx(() {
      if (!connectivityService.hasInternetConnection.value) {
        return connectivityService.showAlert(context);
      }

      return Scaffold(
        backgroundColor: backgroundcolor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: kWhiteColor,
              )),
          centerTitle: true,
          elevation: 0,
          backgroundColor: backgroundcolor,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 250, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                height50,
                const CustomText(
                  label: 'Verify your phone number',
                  fontSize: 24,
                ),
                kHeight,
                const CustomText(
                  label: 'Enter the 6 digit code sent to',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                CustomText(
                  label: mobile,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                kHeight,
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormFieldWidget1(
                    lableText: 'Verification Code',
                    controller: otpController,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                  ),
                ),
                ButtonWidget(
                    label: 'Continue',
                    onTap: () {
                      verifyOtp(otpController.text.trim());
                    },
                    buttonColor: colorRed)
              ],
            ),
          ),
        ),
      );
    });
  }

  verifyOtp(String otp) async {
    bool verified = await a.verifyOTP(a.userVerificationId, otp);
    if (verified) {
      Get.offAll(() => const HomeScreen());
      // if (isExisist) {
      //   Get.offAll(() => const HomeScreen());
      // }
    } else {
      return;
    }
  }
}

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_test/main.dart';
import 'package:firebase_test/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../core/constants.dart';

class RegisterScreen extends StatefulWidget {
  final Function() onClickedSignIn;
  const RegisterScreen({super.key, required this.onClickedSignIn});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  
final navigatorKey = GlobalKey<NavigatorState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: const Text("SignIn"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: userNameController,
                        decoration: InputDecoration(
                          labelText: "Enter email",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: const BorderSide(),
                          ),
                          //fillColor: Colors.green
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (email) =>
                            email != null && !EmailValidator.validate(email)
                                ? 'Enter a valid email'
                                : null,
                        keyboardType: TextInputType.name,
                        style: subFontStyle,
                      ),
                      kHeight,
                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: "Password",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: const BorderSide(),
                          ),
                          //fillColor: Colors.green
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => value != null && value.length < 6
                            ? 'Enter min. 6 characters'
                            : null,
                        keyboardType: TextInputType.name,
                        style: subFontStyle,
                      ),
                      kHeight,
                      // TextFormField(
                      //   decoration: InputDecoration(
                      //     labelText: "Confirm Password",
                      //     fillColor: Colors.white,
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(25.0),
                      //       borderSide: const BorderSide(),
                      //     ),
                      //     //fillColor: Colors.green
                      //   ),
                      //   // validator: (val) {
                      //   //   if(val.length==0) {
                      //   //     return "Email cannot be empty";
                      //   //   }else{
                      //   //     return null;
                      //   //   }
                      //   // },
                      //   keyboardType: TextInputType.name,
                      //   style: subFontStyle,
                      // ),
                      height50,
                      SizedBox(
                        height: height / 17,
                        width: width / 2,
                        child: ElevatedButton.icon(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(16)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            elevation: MaterialStateProperty.all(10),
                            shadowColor: MaterialStateProperty.all(Colors.grey),
                            overlayColor: MaterialStateProperty.all(
                                Colors.blue.withOpacity(0.5)),
                            visualDensity: VisualDensity.compact,
                          ),
                          onPressed: signUp,
                          icon: const Icon(Ionicons.arrow_up),
                          label: const Text("Sign Up"),
                        ),
                      ),
                      height50,
                      RichText(
                        text: TextSpan(
                          style: menuFontStyle,
                          text: 'Already have an account?  ',
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = widget.onClickedSignIn,
                              text: 'Login In',
                              style: ktext,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: userNameController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}

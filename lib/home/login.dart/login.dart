import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_test/core/constants.dart';
import 'package:firebase_test/home/login.dart/widgets/Forgot/forgot_page.dart';
import 'package:firebase_test/main.dart';
import 'package:firebase_test/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  final VoidCallback onClickedSignUp;
  const SignIn({
    super.key,
    required this.onClickedSignUp,
  });

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // final AuthServices _auth = AuthServices();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
final navigatorKey = GlobalKey<NavigatorState>();

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
                child: Column(
                  children: [
                    TextFormField(
                      controller: userNameController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: "Enter Email",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(),
                        ),
                        //fillColor: Colors.green
                      ),
                      // validator: (val) {
                      //   if(val.length==0) {
                      //     return "Email cannot be empty";
                      //   }else{
                      //     return null;
                      //   }
                      // },
                      keyboardType: TextInputType.emailAddress,
                      style: subFontStyle,
                    ),
                    kHeight,
                    TextFormField(
                      controller: passwordController,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: "Enter Password",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(),
                        ),
                        //fillColor: Colors.green
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      style: subFontStyle,
                    ),
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
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
                        onPressed: signIn,
                        icon: const Icon(Ionicons.arrow_up),
                        label: const Text("Sigin"),
                      ),
                    ),
                    kHeight,
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ForgotPasswordPage(),
                      )),
                      child: Text(
                        'Forgot password',
                        style: GoogleFonts.robotoSlab(
                          fontSize: 20,
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    height50,
                    RichText(
                      text: TextSpan(
                        style: menuFontStyle,
                        text: 'No Account? ',
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = widget.onClickedSignUp,
                            text: 'Sign Up',
                            style: ktext,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future signIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userNameController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar('Enter all the fields');
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}

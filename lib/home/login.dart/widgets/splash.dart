// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_test/core/color.dart';
// import 'package:firebase_test/home/home/home_screen.dart';

// import 'package:firebase_test/home/login.dart/widgets/authpage.dart';

// import 'package:flutter/material.dart';
// import 'package:loading_indicator/loading_indicator.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     checkLogin();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Column(
//       children: [
//         SizedBox(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           child: const Center(
//             child: Text(
//               'Linkedln',
//               style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
//             ),
//           ),
//         )
//       ],
//     ));
//   }

//   void checkLogin() async {
//     await Future.delayed(const Duration(seconds: 2));
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const CheckUserLogin(),
//       ),
//     );
//   }
// }

// class CheckUserLogin extends StatelessWidget {
//   const CheckUserLogin({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: LoadingIndicator(
//                 indicatorType: Indicator.circleStrokeSpin,
//                 colors: [kWhiteColor],
//                 strokeWidth: 2,
//               ),
//             );
//           } else if (snapshot.hasError) {
//             return const Center(
//               child: Text(
//                 'Something went wrong',
//                 style: TextStyle(color: Colors.red),
//               ),
//             );
//           }
//           if (snapshot.hasData) {
//             return const HomeScreen();
//           } else {
//             return const AuthPage();
//           }
//         },
//       ),
//     );
//   }
// }

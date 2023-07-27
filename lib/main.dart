import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_test/widgets/internet_connectivity_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Welcome/login_screen/login_screen.dart';
import 'core/color.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(ConnectivityService());
      }),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: swatchWhite),
      home: MobileLoginPage(),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: LoginScreen(),
//       debugShowCheckedModeBanner: false,
//       color: Colors.indigo[900],
//     );
//   }
// }

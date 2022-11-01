import 'package:flutter/material.dart';
import 'package:olive_admin_panel/Login/Auth.dart';
import 'package:olive_admin_panel/Login/login_page.dart';

import 'package:olive_admin_panel/drawer.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Widgets/constant.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyA4fgd64T39qupuGKPinOR1YnSVCxIQsmU",
    projectId: "olive-c5960",
    messagingSenderId: "428840031017",
    appId: "1:428840031017:web:7b0aef80c26f59c5079d38",
    storageBucket: "olive-c5960.appspot.com",
  ));
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
          canvasColor: secondaryColor,
        ),
        home: const CehckAuth(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

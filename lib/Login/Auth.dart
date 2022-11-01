import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:olive_admin_panel/Login/login_page.dart';
import 'package:olive_admin_panel/Screens/main_home.dart';
import 'package:olive_admin_panel/drawer.dart';

class CehckAuth extends StatefulWidget {
  const CehckAuth({super.key});

  @override
  State<CehckAuth> createState() => _CehckAuthState();
}

class _CehckAuthState extends State<CehckAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        } else {
          if (snapshot.hasData) {
            return const MainHome();
          } else if (snapshot.hasError) {
            return const LoginPage();
          } else {
            return const LoginPage();
          }
        }
      },
    ));
  }
}

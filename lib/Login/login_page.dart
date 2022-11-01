import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:olive_admin_panel/Login/create_admin.dart';
import 'package:olive_admin_panel/Widgets/btn-two.dart';
import 'package:olive_admin_panel/Widgets/txt.dart';
import 'package:olive_admin_panel/Widgets/txt_filed.dart';
import 'package:olive_admin_panel/drawer.dart';

import '../Widgets/error.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  final key = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: SizedBox(
              //color: Colors.red,
              height: screensize.height,
              width: 400,
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  DefaultTextStyle(
                    style: const TextStyle(fontSize: 70.0, fontFamily: 'Horizon', color: Colors.white),
                    child: AnimatedTextKit(
                      totalRepeatCount: 15,
                      animatedTexts: [
                        TypewriterAnimatedText('OLIVE'),
                        TypewriterAnimatedText('ADMIN'),
                        TypewriterAnimatedText('LOGIN'),
                        // RotateAnimatedText('ADMIN'),
                        // RotateAnimatedText('LOGIN'),
                      ],
                      onTap: () {},
                    ),
                  ),
                  Form(
                      key: key,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 100,
                          ),
                          Row(
                            children: const [
                              text(txt: 'EMAIL', size: 18),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          txtfield(
                            text: 'Enter Email',
                            hight: 50,
                            width: 300,
                            validate: true,
                            errorTxt: 'email is required',
                            controller: email,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: const [
                              text(txt: 'PASSWORD', size: 18),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          txtfield(
                            text: 'Enter Password',
                            hight: 50,
                            width: 300,
                            obscure: true,
                            validate: true,
                            errorTxt: 'password is required',
                            controller: password,
                            maxlines: 1,
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          SizedBox(
                            child: isLoading
                                ? const SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: Center(
                                      child: LoadingIndicator(
                                        indicatorType: Indicator.ballPulse,
                                        colors: [Colors.white],
                                      ),
                                    ),
                                  )
                                : BtnTwo(
                                    txt: 'Login',
                                    fnc: () {
                                      if (key.currentState!.validate()) {
                                        login();
                                      }
                                    },
                                    height: 80,
                                    widh: 300,
                                    clr: Colors.green,
                                  ),
                          )
                        ],
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    )

        //  Row(
        //   children: [
        //     Expanded(
        //       flex: 5,
        //       child: Center(
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Row(
        //               children: [
        //                 const SizedBox(
        //                   width: 20,
        //                 ),
        //                 // text(txt: 'OLIVE', size: 70),
        //                 const SizedBox(
        //                   width: 20,
        //                 ),
        //                 DefaultTextStyle(
        //                   style:
        //                       const TextStyle(fontSize: 70.0, fontFamily: 'Horizon', color: Colors.white),
        //                   child: AnimatedTextKit(
        //                     totalRepeatCount: 15,
        //                     animatedTexts: [
        //                       TypewriterAnimatedText('OLIVE'),
        //                       TypewriterAnimatedText('ADMIN'),
        //                       TypewriterAnimatedText('LOGIN'),
        //                       // RotateAnimatedText('ADMIN'),
        //                       // RotateAnimatedText('LOGIN'),
        //                     ],
        //                     onTap: () {},
        //                   ),
        //                 ),
        //               ],
        //             )

        //             // text(txt: 'ADMIN LOGIN', size: 70),
        //           ],
        //         ),
        //       ),
        //     ),
        //     Expanded(
        //       flex: 4,
        //       child: Form(
        //           key: key,
        //           child: Column(
        //             children: [
        //               const SizedBox(
        //                 height: 150,
        //               ),
        //               const SizedBox(
        //                 height: 40,
        //               ),
        //               const text(txt: 'EMAIL', size: 18),
        //               const SizedBox(
        //                 height: 10,
        //               ),
        //               txtfield(
        //                 text: 'Enter Email',
        //                 hight: screensize.height / 10,
        //                 width: screensize.width / 3,
        //                 validate: true,
        //                 errorTxt: 'email is required',
        //                 controller: email,
        //               ),
        //               const SizedBox(
        //                 height: 30,
        //               ),
        //               const text(txt: 'PASSWORD', size: 18),
        //               const SizedBox(
        //                 height: 10,
        //               ),
        //               txtfield(
        //                 text: 'Enter Password',
        //                 hight: screensize.height / 10,
        //                 width: screensize.width / 3,
        //                 obscure: true,
        //                 validate: true,
        //                 errorTxt: 'password is required',
        //                 controller: password,
        //               ),
        //               const SizedBox(
        //                 height: 100,
        //               ),
        //               SizedBox(
        //                 child: isLoading
        //                     ? const SizedBox(
        //                         height: 50,
        //                         width: 50,
        //                         child: Center(
        //                           child: LoadingIndicator(
        //                             indicatorType: Indicator.ballPulse,
        //                             colors: [Colors.white],
        //                           ),
        //                         ),
        //                       )
        //                     : BtnTwo(
        //                         txt: 'Login',
        //                         fnc: () {
        //                           if (key.currentState!.validate()) {
        //                             login();
        //                           }
        //                         },
        //                         height: screensize.height / 10,
        //                         widh: screensize.width / 2.5,
        //                         clr: Colors.green,
        //                       ),
        //               )
        //             ],
        //           )),
        //     ),
        //   ],
        // ),
        );
  }

  Future login() async {
    setState(() {
      isLoading = true;
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showMsg('Email not registered yet', const Icon(Icons.close, color: Colors.red), context);
      } else {
        showMsg(e.code.toString(), const Icon(Icons.close, color: Colors.red), context);
      }
    } catch (e) {
      showMsg(
          e.toString(),
          const Icon(
            Icons.close,
            color: Colors.red,
          ),
          context);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}

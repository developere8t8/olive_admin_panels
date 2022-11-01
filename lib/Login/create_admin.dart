import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:olive_admin_panel/Widgets/btn-two.dart';
import 'package:olive_admin_panel/Widgets/error.dart';
import 'package:olive_admin_panel/Widgets/txt_filed.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:olive_admin_panel/models/admin.dart';
import '../Widgets/txt.dart';

class LoginDetail extends StatefulWidget {
  const LoginDetail({Key? key}) : super(key: key);

  @override
  State<LoginDetail> createState() => _LoginDetailState();
}

class _LoginDetailState extends State<LoginDetail> {
  final key = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Form(
                      key: key,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0, top: 15),
                            child: Row(
                              children: const [
                                Text(
                                  'CREATE ADMIN',
                                  style: TextStyle(
                                      color: Colors.white, fontWeight: FontWeight.w600, fontSize: 22),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 25.0),
                                child: text(txt: 'Display NAME', size: 18),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          txtfield(
                            text: 'Enter Name',
                            hight: screensize.height / 10,
                            width: screensize.width / 3,
                            validate: true,
                            errorTxt: 'Enter name',
                            controller: name,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 25.0),
                                child: text(txt: 'EMAIL', size: 18),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          txtfield(
                            text: 'Enter Email',
                            hight: screensize.height / 10,
                            width: screensize.width / 3,
                            validate: true,
                            errorTxt: 'Enter email',
                            controller: email,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 25.0),
                                child: text(txt: 'PASSWORD', size: 18),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          txtfield(
                            text: 'Enter Password',
                            hight: screensize.height / 10,
                            width: screensize.width / 3,
                            obscure: true,
                            errorTxt: 'Enter password',
                            validate: true,
                            controller: password,
                            maxlines: 1,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 25.0),
                                child: text(txt: 'CONFIRM PASSWORD', size: 18),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          txtfield(
                            text: 'Enter Confirm Password',
                            hight: screensize.height / 10,
                            width: screensize.width / 3,
                            validate: true,
                            errorTxt: 'Enter confirm password',
                            obscure: true,
                            controller: confirm,
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          SizedBox(
                            child: isLoading
                                ? const SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Center(
                                      child: LoadingIndicator(
                                        indicatorType: Indicator.ballPulse,
                                        colors: [Colors.white],
                                      ),
                                    ),
                                  )
                                : BtnTwo(
                                    txt: 'CREATE',
                                    fnc: () {
                                      if (key.currentState!.validate()) {
                                        if (password.text != confirm.text) {
                                          showMsg('password and confirm password didnot match',
                                              const Icon(Icons.close, color: Colors.red), context);
                                        } else {
                                          createAdmin();
                                        }
                                      }
                                    },
                                    height: screensize.height / 10,
                                    widh: screensize.width / 2.5,
                                    clr: Colors.green,
                                  ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      )),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        // text(txt: 'CREATE', size: 70),
                        SizedBox(
                          height: 20,
                        ),
                        // text(txt: 'ADMIN LOGIN', size: 70),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future createAdmin() async {
    setState(() {
      isLoading = true;
    });
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email.text, password: password.text);

      final newUser = credential.user!.uid;
      final addAdmin = FirebaseFirestore.instance.collection('admins').doc(newUser);
      AdminData data = AdminData(
          email: email.text, id: newUser, name: name.text, password: password.text, status: 'active');

      addAdmin.set(data.toMap());
      name.clear();
      email.clear();
      password.clear();
      confirm.clear();
      //
      // ignore: use_build_context_synchronously
      showMsg('New admin created', const Icon(Icons.check, color: Colors.green), context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showMsg('Email already registers', const Icon(Icons.close, color: Colors.red), context);
      } else if (e.code == 'weak-password') {
        showMsg('Week Password', const Icon(Icons.close, color: Colors.red), context);
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
      isLoading = false;
    }
    setState(() {});
  }
}

import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:olive_admin_panel/Widgets/txt.dart';
import 'package:olive_admin_panel/Widgets/txt_filed.dart';

class PrefrencesQuestion extends StatefulWidget {
  const PrefrencesQuestion({Key? key}) : super(key: key);

  @override
  State<PrefrencesQuestion> createState() => _PrefrencesQuestionState();
}

class _PrefrencesQuestionState extends State<PrefrencesQuestion> {
  TextEditingController question = TextEditingController();
  TextEditingController descrption = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFD5F76),
        centerTitle: true,
        title: const Text(
          'ADD QUESTIONS',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 15),
                child: Row(
                  children: const [
                    Text(
                      'PREFRENCES QUESTONS',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 22),
                    ),
                  ],
                ),
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 18.0, top: 25),
                    child: text(
                      txt: 'ADD NEW QUESTION',
                      size: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 8.0),
                child: Row(
                  children: const [
                    text(
                      txt: 'Question',
                      size: 15,
                    ),
                  ],
                ),
              ),
              txtfield(
                text: 'Enter Question',
                hight: screensize.height / 10,
                width: screensize.width / 1.9,
                controller: question,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 8.0),
                child: Row(
                  children: const [
                    text(
                      txt: 'Description',
                      size: 15,
                    ),
                  ],
                ),
              ),
              txtfield(
                text: 'Enter Description',
                hight: screensize.height / 3,
                width: screensize.width / 1.9,
                controller: descrption,
              ),
              const SizedBox(
                height: 20,
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 20, top: 8.0),
              //   child: Row(
              //     children: const [
              //       text(
              //         txt: 'Answer',
              //         size: 15,
              //       ),
              //     ],
              //   ),
              // ),
              // txtfield(
              //   text: 'Enter Answer',
              //   hight: screensize.height / 10,
              //   width: screensize.width / 1.9,
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 20, top: 8.0),
              //   child: Row(
              //     children: const [
              //       text(
              //         txt: 'Answer Image',
              //         size: 15,
              //       ),
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 20, top: 8.0, right: 20),
              //   child: Container(
              //     height: screensize.height / 3.5,
              //     width: screensize.width / 3.3,
              //     decoration: BoxDecoration(
              //       color: Colors.transparent,
              //       borderRadius: BorderRadius.circular(10),
              //       border: Border.all(
              //         color: Colors.white,
              //         width: 1,
              //       ),
              //     ),
              //     child: Center(
              //       child: Container(
              //         height: 100,
              //         width: 100,
              //         decoration: const BoxDecoration(
              //           shape: BoxShape.circle,
              //           color: Color(0xffFD5F76),
              //         ),
              //         child: Center(
              //           child: IconButton(
              //             onPressed: () {},
              //             icon: const Icon(
              //               Icons.add,
              //               color: Colors.white,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              MaterialButton(
                onPressed: () {
                  if (question.text.isNotEmpty && descrption.text.isNotEmpty) {
                    addQuestion();
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            title: Text('Message'),
                            content: Text('Provide question and description both fields'),
                            actions: [CloseButton()],
                          );
                        });
                  }
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: const Color(0xffFD5F76),
                height: screensize.height / 10,
                minWidth: screensize.width / 3,
                child: const Text(
                  'Add Question',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future addQuestion() async {
    final newquestion = FirebaseFirestore.instance.collection('questions').doc();
    await newquestion
        .set({'id': newquestion.id, 'questions': question.text, 'description': descrption.text});
    setState(() {
      question.clear();
      descrption.clear();
    });
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Message'),
            content: Text('Question added'),
            actions: [CloseButton()],
          );
        });
  }
}

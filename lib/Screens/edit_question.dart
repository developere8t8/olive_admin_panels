import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:olive_admin_panel/Widgets/btn-two.dart';
import 'package:olive_admin_panel/Widgets/constant.dart';
import 'package:olive_admin_panel/Widgets/txt_filed.dart';
import 'package:olive_admin_panel/models/questions.dart';

class EditQuestion extends StatefulWidget {
  const EditQuestion({Key? key}) : super(key: key);

  @override
  State<EditQuestion> createState() => _EditQuestionState();
}

class _EditQuestionState extends State<EditQuestion> {
  List<QuestionsData> questions = [];
  TextEditingController question = TextEditingController();
  TextEditingController description = TextEditingController();
  String questionID = '';
  int currentIndex = 0;
  bool isLoadingupdate = false;
  bool isLoading = false;

  @override
  void initState() {
    getQuestions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFD5F76),
        centerTitle: true,
        title: const Text(
          'EDIT QUESTIONS',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: isLoading
            ? const Center(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Center(
                    child: LoadingIndicator(
                      indicatorType: Indicator.ballPulse,
                      colors: [Colors.white],
                    ),
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 5,
                      child: ListView.builder(
                          itemCount: questions.isEmpty ? 0 : questions.length,
                          shrinkWrap: true,
                          primary: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                horizontalTitleGap: 10,
                                minLeadingWidth: 20,
                                tileColor: secondaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
                                  child: Text(
                                    'Question # ${index + 1}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                trailing: InkWell(
                                  onTap: () {
                                    setState(() {
                                      question.text = questions[index].questions!;
                                      description.text = questions[index].description!;
                                      questionID = questions[index].id!;
                                      currentIndex = index;
                                    });
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color(0xffFE805A),
                                        width: 2,
                                      ),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'DETAIL',
                                        style: TextStyle(
                                          color: Color(0xffFE805A),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 250,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          const Text(
                            'Question',
                            style: TextStyle(
                                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          txtfield(
                            text: 'Question',
                            hight: screensize.height / 12,
                            width: screensize.width / 5,
                            controller: question,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Discription',
                            style: TextStyle(
                                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          txtfield(
                            text: 'Discription',
                            hight: screensize.height / 12,
                            width: screensize.width / 5,
                            controller: description,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // const Text(
                          //   'Change Image',
                          //   style: TextStyle(
                          //       color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
                          // ),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          // Stack(
                          //   children: [
                          //     Container(
                          //       height: 160,
                          //       width: 300,
                          //       decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(10),
                          //         color: Colors.yellow,
                          //         image: const DecorationImage(
                          //             image: AssetImage('images/img_1.png'),
                          //             fit: BoxFit.cover,
                          //             opacity: 0.8),
                          //       ),
                          //     ),
                          //     Positioned(
                          //       bottom: 10,
                          //       child: IconButton(
                          //         onPressed: () {},
                          //         icon: const Icon(
                          //           CupertinoIcons.pencil_circle_fill,
                          //           color: Colors.white,
                          //           size: 40,
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          SizedBox(
                            child: isLoadingupdate
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
                                    txt: 'Save',
                                    fnc: () async {
                                      setState(() {
                                        isLoadingupdate = true;
                                      });
                                      final user = FirebaseFirestore.instance
                                          .collection('questions')
                                          .doc(questionID);
                                      await user.update(
                                          {'questions': question.text, 'description': description.text});
                                      setState(() {
                                        question.clear();
                                        description.clear();
                                        isLoadingupdate = false;
                                      });

                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return const AlertDialog(
                                              title: Text('Message'),
                                              content: Text('Changes saved'),
                                              actions: [CloseButton()],
                                            );
                                          });
                                    },
                                    height: screensize.height / 10,
                                    widh: screensize.width / 4,
                                    clr: Colors.green,
                                  ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            child: isLoadingupdate
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
                                    txt: 'Delete',
                                    fnc: () async {
                                      setState(() {
                                        isLoadingupdate = true;
                                      });
                                      final user = FirebaseFirestore.instance
                                          .collection('questions')
                                          .doc(questionID);
                                      await user.delete();
                                      setState(() {
                                        questions.removeAt(currentIndex);
                                        question.clear();
                                        description.clear();
                                        isLoadingupdate = false;
                                      });

                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return const AlertDialog(
                                              title: Text('Message'),
                                              content: Text('Question deleted'),
                                              actions: [CloseButton()],
                                            );
                                          });
                                    },
                                    height: screensize.height / 10,
                                    widh: screensize.width / 4,
                                    clr: Colors.red,
                                  ),
                          ),
                          const SizedBox(
                            height: 20,
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

  //getting accepted Users
  Future getQuestions() async {
    setState(() {
      isLoading = true;
    });
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('questions').get();
    if (snapshot.docs.isNotEmpty) {
      questions =
          snapshot.docs.map((e) => QuestionsData.fromMap(e.data() as Map<String, dynamic>)).toList();
    }
    isLoading = false;
    setState(() {});
  }
}

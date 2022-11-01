import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:olive_admin_panel/Widgets/btn-two.dart';
import 'package:olive_admin_panel/Widgets/container.dart';
import 'package:olive_admin_panel/Widgets/txt.dart';
import 'package:olive_admin_panel/Widgets/txt_filed.dart';
import 'package:olive_admin_panel/models/dish.dart';
import 'package:intl/intl.dart';

import 'dish_home.dart';

class Dishes extends StatefulWidget {
  const Dishes({Key? key}) : super(key: key);

  @override
  State<Dishes> createState() => _DishesState();
}

class _DishesState extends State<Dishes> {
  TextEditingController dish1 = TextEditingController();
  TextEditingController description1 = TextEditingController();
  TextEditingController dish2 = TextEditingController();
  TextEditingController description2 = TextEditingController();
  bool isLoadingupdate = false;
  XFile? img1;
  XFile? img2;
  int dishCount = 0;

  @override
  void initState() {
    getData();
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
          'ADD DISHES',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.1,
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 18.0, top: 25),
                                child: text(
                                  txt: 'ADD DISH 1',
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
                                  txt: 'Dish-1 Title',
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                          txtfield(
                            text: 'Enter Dish-1 Name',
                            hight: screensize.height / 10,
                            width: screensize.width / 1.9,
                            controller: dish1,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 20, top: 8.0),
                          //   child: Row(
                          //     children: const [
                          //       text(
                          //         txt: 'Dish-1 Description',
                          //         size: 15,
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // txtfield(
                          //   text: 'Enter Dish-1 Description',
                          //   hight: screensize.height / 3,
                          //   width: screensize.width / 1.9,
                          //   controller: description1,
                          // ),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 8.0),
                            child: Row(
                              children: const [
                                text(
                                  txt: 'Dish-1 Image',
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                          Stack(
                            children: [
                              Container(
                                height: 160,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.yellow,
                                ),
                                child: img1 != null
                                    ? Image.network(
                                        img1!.path,
                                        fit: BoxFit.fill,
                                      )
                                    : Container(),
                              ),
                              Positioned(
                                bottom: 10,
                                child: IconButton(
                                  onPressed: () {
                                    pickImage1();
                                  },
                                  icon: const Icon(
                                    CupertinoIcons.pencil_circle_fill,
                                    color: Color.fromARGB(255, 249, 2, 249),
                                    size: 40,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                left: 40,
                                child: IconButton(
                                  onPressed: () async {
                                    setState(() {
                                      img1 = null;
                                    });
                                  },
                                  icon: const Icon(
                                    CupertinoIcons.delete,
                                    color: Color.fromARGB(255, 249, 2, 249),
                                    size: 40,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    //secind dish column
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.1,
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 18.0, top: 25),
                                child: text(
                                  txt: 'ADD DISH-2',
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
                                  txt: 'Dish-2 Title',
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                          txtfield(
                            text: 'Enter Dish-2 Name',
                            hight: screensize.height / 10,
                            width: screensize.width / 1.9,
                            controller: dish2,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 20, top: 8.0),
                          //   child: Row(
                          //     children: const [
                          //       text(
                          //         txt: 'Dish-2 Description',
                          //         size: 15,
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // txtfield(
                          //   text: 'Enter Dish-2 Description',
                          //   hight: screensize.height / 3,
                          //   width: screensize.width / 1.9,
                          //   controller: description2,
                          // ),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 8.0),
                            child: Row(
                              children: const [
                                text(
                                  txt: 'Dish-2 Image',
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                          Stack(
                            children: [
                              Container(
                                height: 160,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.yellow,
                                ),
                                child: img2 != null
                                    ? Image.network(
                                        img2!.path,
                                        fit: BoxFit.fill,
                                      )
                                    : Container(),
                              ),
                              Positioned(
                                bottom: 10,
                                child: IconButton(
                                  onPressed: () {
                                    pickImage2();
                                  },
                                  icon: const Icon(
                                    CupertinoIcons.pencil_circle_fill,
                                    color: Color.fromARGB(255, 249, 2, 249),
                                    size: 40,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                left: 40,
                                child: IconButton(
                                  onPressed: () async {
                                    setState(() {
                                      img2 = null;
                                    });
                                  },
                                  icon: const Icon(
                                    CupertinoIcons.delete,
                                    color: Color.fromARGB(255, 249, 2, 249),
                                    size: 40,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
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
                          txt: 'Save',
                          fnc: () {
                            addDish();
                          },
                          height: screensize.height / 10,
                          widh: screensize.width / 4,
                          clr: Colors.green,
                        ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future addDish() async {
    try {
      setState(() {
        isLoadingupdate = true;
      });

      if (dishCount == 0) {
        if (dish1.text.isEmpty) {
          showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  title: Text('Message'),
                  content: Text('Please enter dish-1 name'),
                  actions: [CloseButton()],
                );
              });
        } else if (dish2.text.isEmpty) {
          showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  title: Text('Message'),
                  content: Text('Please enter dish-2 name'),
                  actions: [CloseButton()],
                );
              });
        } else if (img1 == null) {
          showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  title: Text('Message'),
                  content: Text('Please select image for dish-1'),
                  actions: [CloseButton()],
                );
              });
        } else if (img2 == null) {
          showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  title: Text('Message'),
                  content: Text('Please select image for dish-2'),
                  actions: [CloseButton()],
                );
              });
        } else {
          QuerySnapshot dishsnap = await FirebaseFirestore.instance.collection('daily-dish').get();
          if (dishsnap.docs.length >= 2) {
            showDialog(
                context: context,
                builder: (context) {
                  return const AlertDialog(
                    title: Text('Message'),
                    content: Text('only 2 dishes can be added...Please delete a dish to add new one'),
                    actions: [CloseButton()],
                  );
                });
          } else {
            final newDish = FirebaseFirestore.instance.collection('daily-dish').doc();

            //uploading image

            final firebaseStorage = FirebaseStorage.instance;
            var snapshot1 = await firebaseStorage.ref().child('/dish_images/${newDish.id}').putData(
                  await img1!.readAsBytes(),
                  SettableMetadata(contentType: 'image/jpeg'),
                );
            var imgUrlNew1 = await snapshot1.ref.getDownloadURL();
            var snapshot2 = await firebaseStorage.ref().child('/dish_images/${newDish.id}2').putData(
                  await img2!.readAsBytes(),
                  SettableMetadata(contentType: 'image/jpeg'),
                );
            var imgUrlNew2 = await snapshot2.ref.getDownloadURL();
            DailyDish dishes = DailyDish(
                date: DateFormat('MMM dd yyyy').format(DateTime.now()),
                dish1: dish1.text,
                dish1Image: imgUrlNew1,
                dish1Voters: [],
                dish1Votes: 0,
                dish2: dish2.text,
                dish2Image: imgUrlNew2,
                dish2Voters: [],
                dish2Votes: 0,
                dishVotes: [],
                totalVotes: 0);
            await newDish.set(dishes.toMap());
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Message'),
                    content: const Text('Dish added'),
                    actions: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) => const DishHomePage()));
                        },
                        shape: const StadiumBorder(),
                        child: const Text('Ok'),
                      )
                    ],
                  );
                });
            setState(() {
              isLoadingupdate = false;
              img1 = null;
              dish1.clear();
              description1.clear();
              isLoadingupdate = false;
              img2 = null;
              dish2.clear();
              description2.clear();
            });
          }
        }
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                title: Text('Error'),
                content: Text('You already have two dishes...Please delete them to add new dish'),
                actions: [CloseButton()],
              );
            });
      }
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Error'),
              content: Text(e.toString()),
              actions: const [CloseButton()],
            );
          });
    } finally {
      setState(() {
        isLoadingupdate = false;
      });
    }
  }

  Future pickImage1() async {
    // ignore: invalid_use_of_visible_for_testing_member
    final imageweb = await ImagePicker.platform.getImage(source: ImageSource.gallery);
    if (imageweb != null) {
      setState(() {
        img1 = imageweb;
      });
    }
  }

  Future pickImage2() async {
    // ignore: invalid_use_of_visible_for_testing_member
    final imageweb = await ImagePicker.platform.getImage(source: ImageSource.gallery);
    if (imageweb != null) {
      setState(() {
        img2 = imageweb;
      });
    }
  }

  Future getData() async {
    QuerySnapshot snap = await FirebaseFirestore.instance.collection('daily-dish').get();
    if (snap.docs.isNotEmpty) {
      setState(() {
        dishCount = snap.docs.length;
      });
    } else {
      setState(() {
        dishCount = 0;
      });
    }
  }
}

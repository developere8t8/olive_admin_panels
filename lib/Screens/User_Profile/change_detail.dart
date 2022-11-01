import 'package:flutter/material.dart';
import 'package:olive_admin_panel/Widgets/btn.dart';
import 'package:olive_admin_panel/Widgets/txt_filed.dart';

import '../../Widgets/constant.dart';

class ChangeDetail extends StatefulWidget {
  const ChangeDetail({Key? key}) : super(key: key);

  @override
  State<ChangeDetail> createState() => _ChangeDetailState();
}

class _ChangeDetailState extends State<ChangeDetail> {
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFD5F76),
        centerTitle: true,
        title: const Text(
          'CHANGE DESCRIPTION OF USER',
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
              const SizedBox(
                height: 50,
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 12.0, bottom: 10),
                    child: Text(
                      'Place Holder Name',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              txtfield(
                text: 'Enter Name',
                hight: screensize.height / 10,
                width: screensize.width / 1.9,
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 12.0, bottom: 10),
                    child: Text(
                      'Description',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              txtfield(
                text: 'Description',
                hight: screensize.height / 5.5,
                width: screensize.width / 1.9,
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: screensize.height / 1.5,
                width: screensize.width / 1.5,
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 28.0,
                        top: 20,
                      ),
                      child: Row(
                        children: const [
                          Text(
                            'What do you have Prefer?',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 28.0,
                        top: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.edit_note,
                                  color: Colors.white,
                                ),
                              ),
                              const Text(
                                'Edit',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                              const Text(
                                'Delete',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 28.0,
                        top: 20,
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Description',
                                style: TextStyle(
                                  color: Color(0xffFD5F76),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Grant of Prison Allowance. Government of the Punjab, Finance Department, Lahore vide Notification No.FD.PR.6-8/2004 Dated 20th July,\nGrant of Prison Allowance. Government of the Punjab, Finance Department, Lahore vide Notification No.FD.PR.6-8/2004 Dated 20th July, \n2022 innce. \nGovernment of the Punjab, Finance Department, Lahore vide Notification No.FD.PR.6-8/2004 Dated 20th July, \n2022 in pursuance of ...',
                                style: TextStyle(
                                  color: Colors.white38,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          'Date:',
                          style: TextStyle(
                            color: Color(0xffFD5F76),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '15-Sep-2022',
                          style: TextStyle(
                            color: Colors.white38,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          'Time:',
                          style: TextStyle(
                            color: Color(0xffFD5F76),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '10:41 AM',
                          style: TextStyle(
                            color: Colors.white38,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Btn(
                        txt: 'Deactivate',
                        fnc: () {
                          print('pok');
                        },
                        height: screensize.height / 13,
                        widh: screensize.width / 7),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Btn(
                txt: 'Done',
                fnc: () {
                  print('pok');
                },
                height: screensize.height / 10,
                widh: screensize.width / 4,
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

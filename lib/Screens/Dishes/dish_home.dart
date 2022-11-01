import 'package:flutter/material.dart';
import 'package:olive_admin_panel/Screens/Dishes/dishes.dart';
import 'package:olive_admin_panel/Screens/Dishes/edit_dish.dart';
import 'package:olive_admin_panel/Widgets/container.dart';

class DishHomePage extends StatefulWidget {
  const DishHomePage({Key? key}) : super(key: key);

  @override
  State<DishHomePage> createState() => _DishHomePageState();
}

class _DishHomePageState extends State<DishHomePage> {
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DISHES',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 0, right: 0),
              child: Center(
                child: Wrap(
                  spacing: 40,
                  runSpacing: 40,
                  children: [
                    Contain(
                        txt: 'Delete Dishes',
                        fnc: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EditDish(),
                            ),
                          );
                        },
                        iconData: (Icons.edit_note),
                        hight: 160,
                        width: 230),
                    Contain(
                        txt: 'Add Dish',
                        fnc: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Dishes(),
                            ),
                          );
                        },
                        iconData: (Icons.add_circle),
                        hight: 160,
                        width: 230),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
    // return Scaffold(
    //   body: Column(
    //     children: [
    //       Padding(
    //         padding: const EdgeInsets.only(left: 15.0, top: 15),
    //         child: Row(
    //           children: const [
    //             Text(
    //               'DISHES',
    //               style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 22),
    //             ),
    //           ],
    //         ),
    //       ),
    //       const SizedBox(
    //         height: 130,
    //       ),
    //       SingleChildScrollView(
    //         scrollDirection: Axis.horizontal,
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             const SizedBox(
    //               width: 70,
    //             ),
    //             Contain(
    //                 txt: 'Edit Dish',
    //                 fnc: () {
    //                   Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                       builder: (context) => const EditDish(),
    //                     ),
    //                   );
    //                 },
    //                 iconData: (Icons.edit_note),
    //                 hight: screensize.height / 4.8,
    //                 width: screensize.width / 5),
    //             const SizedBox(
    //               width: 35,
    //             ),
    //             const SizedBox(
    //               width: 35,
    //             ),
    //             Contain(
    //                 txt: 'Add Dish',
    //                 fnc: () {
    //                   Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                       builder: (context) => const Dishes(),
    //                     ),
    //                   );
    //                 },
    //                 iconData: (Icons.add_circle),
    //                 hight: screensize.height / 4.8,
    //                 width: screensize.width / 5),
    //           ],
    //         ),
    //       ),
    //       const SizedBox(
    //         height: 70,
    //       ),
    //     ],
    //   ),
    // );
  }
}

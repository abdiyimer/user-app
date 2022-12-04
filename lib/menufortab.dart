import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'coffe_tile.dart';
import 'coffees.dart';

class menufortab extends StatelessWidget {
  List<Menu> menuForMenuForTab;
  // ignore: use_key_in_widget_constructors
  menufortab({super.key, required this.menuForMenuForTab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(66, 87, 37, 37),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/1.jpg'), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  coffetile(
                    menuForCoffetile: menuForMenuForTab[0],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  coffetile(
                    menuForCoffetile: menuForMenuForTab[1],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  coffetile(
                    menuForCoffetile: menuForMenuForTab[2],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  coffetile(
                    menuForCoffetile: menuForMenuForTab[3],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // body: GridView.builder(
      //     itemCount: 10,
      //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //         crossAxisCount: 2),
      //     itemBuilder: ((context, index) {
      //       return Padding(
      //         padding: const EdgeInsets.all(10.0),
      //         child: Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 10.0),
      //           child: Container(
      //             padding: EdgeInsets.all(50),
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(12),
      //               color: Color.fromARGB(66, 87, 37, 37),
      //               boxShadow: const [
      //                 BoxShadow(
      //                   color: Colors.grey,
      //                   offset: Offset(8, 8),
      //                 ),
      //                 BoxShadow(
      //                   color: Colors.white10,
      //                   offset: Offset(-8, -8),
      //                 ),
      //               ],
      //             ),
      //             child: Column(),
      //           ),
      //         ),
      //       );
      //     })
      //     )
    );
  }
}

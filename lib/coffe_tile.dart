import 'package:flutter/material.dart';

import 'coffees.dart';
import 'orderpage.dart';

// ignore: camel_case_types, must_be_immutable
class coffetile extends StatelessWidget {
  Menu menuForCoffetile;
  coffetile({
    super.key,
    required this.menuForCoffetile,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, bottom: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Container(
              // width: 300,
              // height:

              width: MediaQuery.of(context).size.width * .85,
              // height: MediaQuery.of(context).size.height - 320,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('images/3.jpg'), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[900],
                  boxShadow: [
                    const BoxShadow(
                      color: Colors.black54,
                      offset: Offset(5, 5),
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                    BoxShadow(
                      color: Colors.grey.shade800,
                      offset: const Offset(-5, -5),
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                            //width: MediaQuery.of(context).size.width * .7,
                            menuForCoffetile.image)),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      menuForCoffetile.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$  ' + menuForCoffetile.price,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 115, 32, 7),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: GestureDetector(
                              onTap: () => showDialog(
                                //barrierColor: Colors.pink,
                                builder: (context) => orderpage(
                                  menuForOrderpage: menuForCoffetile,
                                  location1: '',
                                  location2: '',
                                ),

                                context: context,
                                barrierDismissible: false,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

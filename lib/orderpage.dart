import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'coffees.dart';
//import 'newpage.dart';

// ignore: camel_case_types, must_be_immutable
class orderpage extends StatefulWidget {
  //var locationmessage = location;
  Menu menuForOrderpage;
  var location1;
  var location2;

  orderpage({
    super.key,
    required this.menuForOrderpage,
    required this.location1,
    required this.location2,
  });

  @override
  State<orderpage> createState() => _orderpageState();
}

class _orderpageState extends State<orderpage> {
  //locationmessage = location;
  final number = Random().nextInt(100);
  final Stream<QuerySnapshot> xxx =
      FirebaseFirestore.instance.collection('orders').snapshots();

  // String get location => location;

  fire(var menu) {
    final coffees = {
      "name": menu.name,
      "price": menu.price,
      "time": Timestamp.now(),
      "status": menu.status,
      'number': number,
      "location1": widget.location1,
      "location2": widget.location2,
    };

    FirebaseFirestore.instance
        .collection("orders")
        .doc(menu.name + DateTime.now().toString())
        .set(coffees)
        .onError((e, _) => print("Error writing document: $e"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      backgroundColor: Colors.brown[200],
      //     title: Text('Order Your Need',
      //         style: TextStyle(
      //             fontWeight: FontWeight.bold,
      //             fontSize: 20,
      //             color: Color.fromARGB(255, 93, 26, 22)))),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Thanks for being our customer',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Color.fromARGB(255, 92, 34, 30)),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 300.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              // image: DecorationImage(
              //     image: AssetImage(
              //       widget.menuForOrderpage.image,
              //     ),
              //     fit: BoxFit.cover)

              color: Colors.brown[300],
            ),
            child: Column(
              children: [
                Container(
                  width: 300.0,
                  height: 300.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      image: DecorationImage(
                          image: AssetImage(
                            widget.menuForOrderpage.image,
                          ),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.menuForOrderpage.name,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 77, 26, 22),
                        ),
                      ),
                      Text(
                        "\$ " + widget.menuForOrderpage.price,
                        style: TextStyle(
                            color: Color.fromARGB(255, 77, 26, 22),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      fire(Menu(
                        name: widget.menuForOrderpage.name,
                        image: widget.menuForOrderpage.image,
                        price: widget.menuForOrderpage.price,
                        status: widget.menuForOrderpage.status,
                        // location1: '',
                        // location2: '',
                        // number: number,
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      // color: Colors.deepOrange,
                      child: const Text('Order Now'),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Text('Order Confirmation Code : $number'),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          // GestureDetector(
          //     onTap: () {
          //       fire(Menu(
          //         name: widget.menuForOrderpage.name,
          //         image: widget.menuForOrderpage.image,
          //         price: widget.menuForOrderpage.price,
          //         status: widget.menuForOrderpage.status,
          //         // location1: '',
          //         // location2: '',
          //         // number: number,
          //       ));
          //     },
          //     child: Container(
          //       padding: const EdgeInsets.all(10),
          //       color: Colors.deepOrange,
          //       child: const Text('Order Now'),
          //     )),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: MediaQuery.of(context).size.height - 600,
            child: StreamBuilder<QuerySnapshot>(
              stream: xxx,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Loading");
                }

                // Container(child: Text('Thanks for being our customer'));
                // //Text(widget.menuForOrderpage.name);

                return ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;

                    return Container(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        //  name: displayMenulist[index].name,
                        child: data['name'] == widget.menuForOrderpage.name
                            ? Container(
                                height: 65,
                                width: 120,
                                decoration: BoxDecoration(
                                    color: Colors.brown[300],
                                    borderRadius: BorderRadius.circular(20),
                                    //boxShadow:

                                    // color: Colors.grey[900],
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(5, 5),
                                        blurRadius: 3,
                                        spreadRadius: 1,
                                      ),
                                      // BoxShadow(
                                      //   color: Colors.grey.shade400,
                                      //   offset: const Offset(-5, -5),
                                      //   blurRadius: 8,
                                      //   spreadRadius: 1,
                                      // ),
                                    ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  //mainAxisAlignment:MainAxisAlignment.center,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Text(
                                        'your order is ',
                                        //data['name'],
                                        // querySnapshot!.docs[i]['name'],
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(115, 87, 31, 31),

                                          // fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: Text(
                                        data['status'] == true
                                            ? 'Picked'
                                            : 'Not Picked',
                                        // querySnapshot!.docs[i]['name'],
                                        style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 77, 26, 22),

                                          // fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),

                                    // ElevatedButton(
                                    //     onPressed: () {
                                    //       FirebaseFirestore.instance
                                    //           .collection('orders')
                                    //           .doc(document.id)
                                    //           .update({'status': 'true'});

                                    //       // onTap: () {

                                    //       // fire(Arguments(
                                    //       //     status: data['status'],
                                    //       //     Image: '',
                                    //       //     Name: data['name'],
                                    //       //     Price: data['price']));

                                    //       //},
                                    //       // fire(widget.argumentsformain);

                                    //       // ignore: unrelated_type_equality_checks
                                    //       // if (buttonindex == i) {
                                    //       //   setState(() {
                                    //       //     buttonindex == [1000000];
                                    //       //   });
                                    //       // } else {
                                    //       //   setState(() {
                                    //       //     buttonindex.add(i);
                                    //       //   });
                                    //       // }
                                    //     },
                                    //     style: ButtonStyle(
                                    //         backgroundColor: MaterialStateProperty.all<Color>(
                                    //             Colors.deepOrange)),
                                    //     child: Text(
                                    //         // buttonindex.contains(i)
                                    //         //   ? "Picked"
                                    //         //   :
                                    //         "Pick")),

                                    //padding: EdgeInsets.only(right: 20),
                                    // Padding(
                                    //   padding: const EdgeInsets.only(right: 20.0),
                                    //   child: Container(
                                    //     padding: EdgeInsets.all(10),
                                    //     color: Colors.blue,
                                    //     child: GestureDetector(
                                    //       onTap: () {
                                    //         // print();
                                    //        // deletedata(document.id);
                                    //         // setState(() {
                                    //         //   print(data![i].id);
                                    //         // });

                                    //         //                         FirebaseFirestore.instance.collection("pick").doc(Arguments.Name + DateTime.now().toString()).delete().then(
                                    //         //   (doc) => print("Document deleted"),
                                    //         //   onError: (e) => print("Error updating document $e"),
                                    //         // );
                                    //       },
                                    //       child: Text('Delete'),
                                    //     ),
                                    //   ),
                                    // ),
                                    //),
                                    //),
                                  ],
                                ),
                              )
                            : Container(),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

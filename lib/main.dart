// import 'package:user_app/coffees.dart';
// import 'package:user_app/menufortab.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';

import 'coffees.dart';
import 'menufortab.dart';
import 'orderpage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(myapp());
}

class myapp extends StatelessWidget {
  Menu? menuFormainpage;
  myapp({
    super.key,
    this.menuFormainpage,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homepage(),
    );
  }
}

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  // var locationmessage = "";
  // ignore: prefer_typing_uninitialized_variables
  var location1;
  // ignore: prefer_typing_uninitialized_variables
  var location2;
  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastposition = await Geolocator.getLastKnownPosition();
    print(lastposition);
    setState(() {
      location1 = position.latitude;
      location2 = position.longitude; //$position.longitude";
    });
  }

  static List<Menu> allMenulist = [
    Menu(
      name: 'coffee',
      image: 'images/coffee.jpg',
      price: '4',
      status: 'false',
      // location1: '',
      // location2: '',
    ),
    Menu(
      name: 'Machiatto',
      image: 'images/dumlao.jpg',
      price: '3',
      status: 'false',
      // location1: '',
      // location2: '',
    ),
    Menu(
      name: 'Espresso',
      image: 'images/espresso.jpg',
      price: '2',
      status: 'false',
      // location1: '',
      // location2: '',
    ),
    Menu(
      name: 'Tea',
      image: 'images/tea.jpg',
      price: '1',
      status: 'false',
      // location1: '',
      // location2: '',
    ),
  ];

  List<Menu> displayMenulist = List.from(allMenulist);
  void updatelist(String value) {
    setState(() {
      displayMenulist = allMenulist
          .where((element) =>
              element.name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => showDialog(
            builder: (context) => menufortab(menuForMenuForTab: allMenulist),
            context: context,
            barrierDismissible: false,
          ),
          child: const Icon(Icons.menu),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Your Favourite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notifications'),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.transparent,
        child: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * .7,
              height: MediaQuery.of(context).size.height - 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(5, 5),
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(-5, -5),
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(5, 5),
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(-5, -5),
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            //Image.asset()
            image: DecorationImage(
                image: AssetImage(
                  'images/3.jpg',
                ),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                'Find the best coffee for you ',
                style: GoogleFonts.bebasNeue(
                    fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                onChanged: (value) => updatelist(value),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search your coffee here ...',
                  prefixIconColor: Colors.pink,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: displayMenulist.length,
                itemBuilder: (context, index) => ListTile(
                  onTap: () => showDialog(
                    builder: (context) => orderpage(
                      menuForOrderpage: Menu(
                        status: displayMenulist[index].status,
                        image: displayMenulist[index].image,
                        name: displayMenulist[index].name,
                        price: displayMenulist[index].price,
                        // location1: '',
                        // location2: '',
                      ),
                      location1: location1,
                      location2: location2,
                    ),
                    context: context,
                    barrierDismissible: false,
                  ),
                  leading: Container(
                    width: 50,
                    height: 50,
                    child: Image.asset(
                      displayMenulist[index].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(displayMenulist[index].name!),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

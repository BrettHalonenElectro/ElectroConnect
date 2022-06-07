// import 'package:blogapp/Blog/addBlog.dart';
import 'package:newfront/Pages/SignIn.dart';
import 'package:newfront/Pages/WelcomePage.dart';
// import 'package:blogapp/Screen/HomeScreen.dart';
// import 'package:blogapp/Profile/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:newfront/NetworkHandler.dart';
import 'package:newfront/Screen/BoilerScreen.dart';
import 'package:newfront/Screen/ConfigureDeviceScreen.dart';
import 'package:newfront/Screen/ForcedAirScreen.dart';
import 'package:newfront/Screen/HeatPumpScreen.dart';
import 'package:newfront/Screen/MakeUpAirScreen.dart';
import 'package:newfront/Screen/ProvisionScreen.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  int currentState = 0;
  final pages = [
    BoilerScreen(),
    HeatPumpScreen(),
    MakeUpAirScreen(),
    ForcedAirScreen(),
  ];
  final storage = FlutterSecureStorage();
  NetworkHandler networkHandler = NetworkHandler();

  String username = "";

  void onItemTapped(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  void checkProfile() async {
    var response = await networkHandler.get("/profile/checkProfile");
    setState(() {
      username = response['username'];
    });
  }

  @override
  void initState() {
    super.initState();
    checkProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  //profilePhoto,
                  SizedBox(
                    height: 10,
                  ),
                  Text("Hello"),
                ],
              ),
            ),
            ListTile(
              title: Text("Connect Boiler"),
              trailing: Icon(Icons.launch),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ConfigureDeviceScreen()));
              },
            ),
            ListTile(
              title: Text("Logout"),
              trailing: Icon(Icons.power_settings_new),
              onTap: logout,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        //backgroundColor: Color.fromRGBO(124, 174, 65, 100.0),
        backgroundColor: Color(0xff7cae41),
        title: Text("Home"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: Center(
        child: pages.elementAt(pageIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: Colors.red,
        backgroundColor: Color(0xff0C4861),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Boiler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Heat Pump',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'MakeUp Air',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Forced Air',
          ),
        ],
        currentIndex: pageIndex,
        onTap: onItemTapped,
      ),
    );
  }

  void logout() async {
    await storage.delete(key: "token");
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => SignInPage()),
        (route) => false);
  }
}

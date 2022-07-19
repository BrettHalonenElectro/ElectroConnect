import 'package:eicfront/UI/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../screens/dashboard_screen.dart';
import '../screens/notif_screen.dart';
import '../screens/notification_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  int currentState = 0;
  final pages = [
    DashboardScreen(),
    NotificationScreen(),
    SettingsScreen(),
  ];
  final storage = FlutterSecureStorage();

  String username = "";

  void onItemTapped(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0C4861),
        title: Text("Electro Connect"),
        centerTitle: true,
      ),
      body: Center(
        child: pages.elementAt(pageIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff7cae41),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: pageIndex,
        onTap: onItemTapped,
      ),
    );
  }
}

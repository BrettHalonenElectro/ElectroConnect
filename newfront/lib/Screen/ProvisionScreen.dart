import 'package:flutter/material.dart';
import 'package:newfront/Pages/HomePage.dart';
import 'package:newfront/Screen/BoilerScreen.dart';

class ProvisionScreen extends StatefulWidget {
  ProvisionScreen({Key? key}) : super(key: key);

  @override
  _ProvisionScreenState createState() => _ProvisionScreenState();
}

class _ProvisionScreenState extends State<ProvisionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connect Device'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('return home'),
          onPressed: () {
            // Navigate to second route when tapped.
          },
        ),
      ),
    );
  }

  onPressed() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => BoilerScreen()),
        (route) => false);
  }
}

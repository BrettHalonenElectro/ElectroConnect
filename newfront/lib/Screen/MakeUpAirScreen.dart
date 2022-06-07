import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MakeUpAirScreen extends StatefulWidget {
  MakeUpAirScreen({Key? key}) : super(key: key);

  @override
  _MakeUpAirScreenState createState() => _MakeUpAirScreenState();
}

class _MakeUpAirScreenState extends State<MakeUpAirScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Make up air Page",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

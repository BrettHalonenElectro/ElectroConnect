import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForcedAirScreen extends StatefulWidget {
  ForcedAirScreen({Key? key}) : super(key: key);

  @override
  _ForcedAirScreenState createState() => _ForcedAirScreenState();
}

class _ForcedAirScreenState extends State<ForcedAirScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Forced air Page",
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

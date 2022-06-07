import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeatPumpScreen extends StatefulWidget {
  HeatPumpScreen({Key? key}) : super(key: key);

  @override
  _HeatPumpScreenState createState() => _HeatPumpScreenState();
}

class _HeatPumpScreenState extends State<HeatPumpScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Heat pump Page",
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

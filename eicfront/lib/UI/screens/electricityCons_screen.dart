import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ElectricityConsScreen extends StatefulWidget {
  ElectricityConsScreen({Key? key}) : super(key: key);

  @override
  _ElectricityConsScreenState createState() => _ElectricityConsScreenState();
}

class _ElectricityConsScreenState extends State<ElectricityConsScreen> {
  double _valueZone2 = 100.0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        //title: Text('Set Temperature'),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: const Text("hiii"),
    );
  }
}

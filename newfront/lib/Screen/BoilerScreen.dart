import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newfront/Model/DevicedataModel.dart';
import 'dart:async';
import 'dart:convert';
import 'package:newfront/NetworkHandler.dart';

class BoilerScreen extends StatefulWidget {
  BoilerScreen({Key? key}) : super(key: key);

  @override
  _BoilerScreenState createState() => _BoilerScreenState();
}

class _BoilerScreenState extends State<BoilerScreen> {
  NetworkHandler networkHandler = NetworkHandler();
  DevicedataModel dataModel = DevicedataModel(temperature: 0);

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var response = await networkHandler.get("/devicedata/getdata");
    var data = DevicedataModel.fromJson(response);
    setState(() {
      dataModel = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 100,
            width: 50,
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
            child: Card(
              elevation: 8.0,
              child: Text(
                'Temperature: ${dataModel.temperature}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

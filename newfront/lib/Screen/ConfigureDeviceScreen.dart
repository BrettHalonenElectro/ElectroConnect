import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newfront/Model/UserDeviceModel.dart';
import 'package:newfront/NetworkHandler.dart';

import '../Pages/HomePage.dart';

class ConfigureDeviceScreen extends StatefulWidget {
  ConfigureDeviceScreen({Key? key}) : super(key: key);

  @override
  _ConfigureDeviceScreenState createState() => _ConfigureDeviceScreenState();
}

class _ConfigureDeviceScreenState extends State<ConfigureDeviceScreen> {
  final _globalkey = GlobalKey<FormState>();
  List<String> deviceModels = ['Mini-Boiler', 'Mid-Boiler'];
  String? _selectedModel;
  List<int> kwRatings = [1, 2, 10];
  int? _selectedKwRating;
  List<String> phaseRatings = ['Single Phase', 'Dual Phase'];
  String? _selectedPhaseRating;
  List<int> powerRating = [120, 240];
  int? _selectedPowerRating;
  NetworkHandler networkHandler = NetworkHandler();

  getCurrentUser() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5.0),
                child: DropdownButton(
                  hint: Text('Model'), // Not necessary for Option 1
                  value: _selectedModel,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedModel = newValue as String?;
                    });
                  },
                  items: deviceModels.map((device) {
                    return DropdownMenuItem(
                      child: new Text(device),
                      value: device,
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: DropdownButton(
                  hint: Text('kW Rating'), // Not necessary for Option 1
                  value: _selectedKwRating,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedKwRating = newValue as int?;
                    });
                  },
                  items: kwRatings.map((rating) {
                    return DropdownMenuItem(
                      value: rating,
                      child: Text(rating.toString()),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: DropdownButton(
                  hint: Text('Phase Rating'), // Not necessary for Option 1
                  value: _selectedPhaseRating,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedPhaseRating = newValue as String?;
                    });
                  },
                  items: phaseRatings.map((phaseRating) {
                    return DropdownMenuItem(
                      value: phaseRating,
                      child: Text(phaseRating),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: DropdownButton(
                  hint: Text('Power Rating'), // Not necessary for Option 1
                  value: _selectedPowerRating,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedPowerRating = newValue as int?;
                    });
                  },
                  items: powerRating.map((powerRating) {
                    return DropdownMenuItem(
                      value: powerRating,
                      child: Text(powerRating.toString()),
                    );
                  }).toList(),
                ),
              ),
              addDeviceButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget addDeviceButton() {
    return InkWell(
      onTap: () async {
        // if (_globalkey.currentState!.validate()) {
        if (1 == 1) {
          UserDeviceModel model = UserDeviceModel(
            devicemodel: _selectedModel.toString(),
            kwrating: _selectedKwRating!.toInt(),
            phaserating: _selectedPhaseRating.toString(),
            powerrating: _selectedPowerRating!.toInt(),
          );

          var response = await networkHandler.post1(
              "/userdevice/add", model.ToJson(model));

          if (response.statusCode == 200 || response.statusCode == 201) {
            // ignore: use_build_context_synchronously
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
                (route) => false);
          }
        }
      },
      child: Center(
        child: Container(
          height: 50,
          width: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.teal),
          child: Center(
              child: Text(
            "Save Device",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}

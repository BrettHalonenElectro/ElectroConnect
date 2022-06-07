import 'dart:convert';

class DevicedataModel {
  int temperature;
  //DateTime time;

  DevicedataModel({required this.temperature, r //equired this.time,
      });

  factory DevicedataModel.fromJson(Map<String, dynamic> json) {
    return DevicedataModel(
      temperature: json['temperature'],
      //time: json['time'],
    );
  }
}

class UserDeviceModel {
  String devicemodel;
  int kwrating;
  String phaserating;
  int powerrating;
  String? username;

  UserDeviceModel({
    required this.devicemodel,
    required this.kwrating,
    required this.phaserating,
    required this.powerrating,
    this.username,
  });

  factory UserDeviceModel.fromJson(Map<String, dynamic> json) {
    return UserDeviceModel(
      devicemodel: json['devicemodel'],
      kwrating: json['kwrating'],
      phaserating: json['phaserating'],
      powerrating: json['powerrating'],
      username: json['username'],
    );
  }

  Map<String, dynamic> ToJson(UserDeviceModel instance) => <String, dynamic>{
        'devicemodel': instance.devicemodel,
        'kwrating': instance.kwrating,
        'phaserating': instance.phaserating,
        'powerrating': instance.powerrating,
        'username': instance.username,
      };
}

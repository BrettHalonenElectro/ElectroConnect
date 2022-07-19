import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class NotificationModel {
  String? message;
  int urgency;
  bool deleted;
  @JsonKey(name: "_id")
  String id;

  NotificationModel({
    required this.message,
    required this.urgency,
    required this.deleted,
    required this.id,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      message: json['message'],
      urgency: json['urgency'],
      deleted: json['deleted'],
      id: json['_id'],
    );
  }

  factory NotificationModel.fromMap(Map<String, dynamic> json) =>
      NotificationModel(
        message: json["message"],
        urgency: json["urgency"],
        deleted: json["deleted"],
        id: json["_id"],
      );

  Map<String, dynamic> ToJson(NotificationModel instance) => <String, dynamic>{
        'message': instance.message,
        'urgency': instance.urgency,
        'deleted': instance.deleted,
        'id': instance.id,
      };
}

// To parse this JSON data, do
//
//     final eventsModel = eventsModelFromJson(jsonString);

import 'dart:convert';

EventsModel eventsModelFromJson(String str) =>
    EventsModel.fromJson(json.decode(str));

String eventsModelToJson(EventsModel data) => json.encode(data.toJson());

class EventsModel {
  EventsModel({
    required this.id,
    required this.appName,
    required this.desc,
    required this.colorValue,
    required this.logoFileName,
    required this.logoFilePath,
    required this.splashScreenFileName,
    required this.splashScreenFilePath,
    required this.status,
    required this.userId,
    required this.eventDate,
    required this.endDate,
    required this.eventLocation,
    required this.longitude,
    required this.lattitude,
    required this.accessCode,
    required this.createdAt,
    required this.updatedAt,
    required this.appSpecificUsersId,
    required this.appinfoId,
  });

  int id;
  String appName;
  String desc;
  String colorValue;
  String logoFileName;
  String logoFilePath;
  String splashScreenFileName;
  String splashScreenFilePath;
  String status;
  String userId;
  String eventDate;
  String endDate;
  String eventLocation;
  String longitude;
  String lattitude;
  String accessCode;
  DateTime createdAt;
  DateTime updatedAt;
  String appSpecificUsersId;
  String appinfoId;

  factory EventsModel.fromJson(Map<String, dynamic> json) => EventsModel(
        id: json["id"],
        appName: json["app_name"],
        desc: json["desc"],
        colorValue: json["color_value"],
        logoFileName: json["logo_file_name"],
        logoFilePath: json["logo_file_path"],
        splashScreenFileName: json["splash_screen_file_name"],
        splashScreenFilePath: json["splash_screen_file_path"],
        status: json["status"],
        userId: json["user_id"],
        eventDate: json["event_date"],
        endDate: json["end_date"],
        eventLocation: json["event_location"],
        longitude: json["longitude"],
        lattitude: json["lattitude"],
        accessCode: json["access_code"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        appSpecificUsersId: json["app_specific_users_id"],
        appinfoId: json["appinfo_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "app_name": appName,
        "desc": desc,
        "color_value": colorValue,
        "logo_file_name": logoFileName,
        "logo_file_path": logoFilePath,
        "splash_screen_file_name": splashScreenFileName,
        "splash_screen_file_path": splashScreenFilePath,
        "status": status,
        "user_id": userId,
        "event_date": eventDate,
        "end_date": endDate,
        "event_location": eventLocation,
        "longitude": longitude,
        "lattitude": lattitude,
        "access_code": accessCode,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "app_specific_users_id": appSpecificUsersId,
        "appinfo_id": appinfoId,
      };
}

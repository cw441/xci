// To parse this JSON data, do
//
//     final postyr = postyrFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Postyr> postyrFromJson(String str) => List<Postyr>.from(json.decode(str).map((x) => Postyr.fromJson(x)));

String postyrToJson(List<Postyr> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Postyr {
  Postyr({
    required this.id,
    required this.namecom,
    required this.idname,
    required this.v,
  });

  String id;
  String namecom;
  String idname;
  int v;

  factory Postyr.fromJson(Map<String, dynamic> json) => Postyr(
    id: json["_id"],
    namecom: json["namecom"],
    idname: json["idname"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "namecom": namecom,
    "idname": idname,
    "__v": v,
  };
}

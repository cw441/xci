// To parse this JSON data, do
//
//     final postyy = postyyFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Postyy> postyyFromJson(String str) => List<Postyy>.from(json.decode(str).map((x) => Postyy.fromJson(x)));

String postyyToJson(List<Postyy> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Postyy {
  Postyy({
    required this.id,
    required this.commnet,
    required this.v,
  });

  String id;
  String commnet;
  int v;

  factory Postyy.fromJson(Map<String, dynamic> json) => Postyy(
    id: json["_id"],
    commnet: json["commnet"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "commnet": commnet,
    "__v": v,
  };
}

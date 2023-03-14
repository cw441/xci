
import 'package:meta/meta.dart';
import 'dart:convert';

List<PostSd> postSdFromJson(String str) => List<PostSd>.from(json.decode(str).map((x) => PostSd.fromJson(x)));

String postSdToJson(List<PostSd> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostSd {
  PostSd({
    required this.id,
    required this.email,
    required this.name,
    required this.passwred,
    required this.v,
  });

  String id;
  String email;
  String name;
  String passwred;
  int v;

  factory PostSd.fromJson(Map<String, dynamic> json) => PostSd(
    id: json["_id"],
    email: json["email"],
    name: json["name"],
    passwred: json["passwred"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "email": email,
    "name": name,
    "passwred": passwred,
    "__v": v,
  };
}

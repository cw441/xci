// To parse this JSON data, do
//
//     final postSd = postSdFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<PostSd> postSdFromJson(String str) => List<PostSd>.from(json.decode(str).map((x) => PostSd.fromJson(x)));

String postSdToJson(List<PostSd> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostSd {
  PostSd({
    required this.id,
    required this.name,
    required this.desc,
    required this.numberproduct,
    required this.sizeproduct,
    required this.prase,
    required this.expar,
    required this.image,
    required this.conutry,
    required this.v,
  });

  String id;
  String name;
  String desc;
  String numberproduct;
  String sizeproduct;
  String prase;
  String expar;
  String image;
  String conutry;
  int v;

  factory PostSd.fromJson(Map<String, dynamic> json) => PostSd(
    id: json["_id"],
    name: json["name"],
    desc: json["desc"],
    numberproduct: json["numberproduct"],
    sizeproduct: json["sizeproduct"],
    prase: json["prase"],
    expar: json["expar"],
    image: json["image"],
    conutry: json["conutry"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "desc": desc,
    "numberproduct": numberproduct,
    "sizeproduct": sizeproduct,
    "prase": prase,
    "expar": expar,
    "image": image,
    "conutry": conutry,
    "__v": v,
  };
}

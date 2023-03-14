// To parse this JSON data, do
//
//     final postyrw = postyrwFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Postyrw> postyrwFromJson(String str) => List<Postyrw>.from(json.decode(str).map((x) => Postyrw.fromJson(x)));

String postyrwToJson(List<Postyrw> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Postyrw {
  Postyrw({
    required this.id,
    required this.namebuy,
    required this.image,
    required this.prase,
    required this.numberproduct,
    required this.tem,
    required this.address,
    required this.phone,
    required this.iduser,
    required this.v,
  });

  String id;
  String namebuy;
  String image;
  String prase;
  String numberproduct;
  String tem;
  String address;
  String phone;
  String iduser;
  int v;

  factory Postyrw.fromJson(Map<String, dynamic> json) => Postyrw(
    id: json["_id"],
    namebuy: json["namebuy"],
    image: json["image"],
    prase: json["prase"],
    numberproduct: json["numberproduct"],
    tem: json["tem"],
    address: json["address"],
    phone: json["phone"],
    iduser: json["iduser"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "namebuy": namebuy,
    "image": image,
    "prase": prase,
    "numberproduct": numberproduct,
    "tem": tem,
    "address": address,
    "phone": phone,
    "iduser": iduser,
    "__v": v,
  };
}

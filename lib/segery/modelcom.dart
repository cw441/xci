
import 'dart:convert';

List<Postyr> postyrFromJson(String str) => List<Postyr>.from(json.decode(str).map((x) => Postyr.fromJson(x)));

String postyrToJson(List<Postyr> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Postyr {
  Postyr({
    required this.id,
    required this.namecom,
    required this.idname,
    required this.auther,
    required this.v,
  });

  String id;
  String namecom;
  String idname;
  Auther auther;
  int v;

  factory Postyr.fromJson(Map<String, dynamic> json) => Postyr(
    id: json["_id"],
    namecom: json["namecom"],
    idname: json["idname"],
    auther: Auther.fromJson(json["auther"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "namecom": namecom,
    "idname": idname,
    "auther": auther.toJson(),
    "__v": v,
  };
}

class Auther {
  Auther({
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

  factory Auther.fromJson(Map<String, dynamic> json) => Auther(
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

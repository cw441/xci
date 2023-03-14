import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:katk/segery/model.dart';
import 'package:url_launcher/url_launcher.dart';

import 'model.dart';

const headers = {'Content-Type': 'application/json', 'Accept': 'application/json'};

Future<List<Postyy>> fetchPost() async {
  final response =
  await http.get(Uri.parse('https://sddkakn.onrender.com/user1/getc'),
    headers: headers,
  );

  if (response.statusCode == 200) {

    print(response.body);

    final jsoon = json.decode(response.body);
    return  jsoon.map<Postyy>((json) => Postyy.fromJson(json)).toList();

  } else {
    throw Exception('Failed to load album');
  }
}

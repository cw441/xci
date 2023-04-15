import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'modelcom.dart';
class coomwes extends StatefulWidget {
  String iad;
  String apidata;
   coomwes({Key? key, required this.iad,required this.apidata}   ) : super(key: key);

  @override
  State<coomwes> createState() => _coomwesState(iad,apidata);
}

class _coomwesState extends State<coomwes> {
  String iad;
  String apidata;
_coomwesState(this.iad,this.apidata);

  static const headers = {'Content-Type': 'application/json', 'Accept': 'application/json'};

  Future<List<Postyr>> fetchPost() async {

    final response =
    await http.get(Uri.parse(apidata),
      headers: headers
    );

    if (response.statusCode == 200) {

      print(response.body);

      final jsoon = json.decode(response.body);
      return  jsoon.map<Postyr>((json) => Postyr.fromJson(json)).toList();

    } else {
      throw Exception('Failed to load album');
    }
  }
  late Future<List<Postyr>> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = fetchPost();

  }

@override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder<List<Postyr>>(
        future: futurePost,
        builder: (context, snapshot) {
      if (snapshot.hasData) {
        return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (_, index) =>
            Padding(
              padding: const EdgeInsets.all(4),
              child:Card(
                color: Colors.white,
                elevation: 1,
                child: Row(
                  children: [
                   IconButton(onPressed: () {
                     setState(() {
                       deleteAlbum("${snapshot.data![index].id}");
                     });
                   },
                     alignment: Alignment.bottomRight,

                     icon: Icon(Icons.delete,
                       color: Colors.red.shade700,
                     ),
                   ),

                    Expanded(
                     child:Text(
                     "${snapshot.data![index].namecom} ",
                       textAlign:TextAlign.end,
                        style: TextStyle(
                        fontSize: 20.0,
                          color: Colors.black,
                             letterSpacing: 0.5
                      ),
                    ),
                    ),
                     Container(
                       height:50,
                       width: 50,
                       decoration: BoxDecoration(
                         image:DecorationImage(
                           image:AssetImage(  'images/rr5.jpg',
                           ),
                           fit: BoxFit.cover,
                         ),
                       ),
                     ),
                   ]

        ),
              )
              ,)
          );
      } else {
        return Center(child: CircularProgressIndicator());
      }
        },
        ),
    )
    ;
  }
}
Future<List<Postyr>> deleteAlbum( id) async {
  final http.Response response = await http.delete(
    Uri.parse('https://sddkakn.onrender.com/userr/deletcq/$id'),
    headers:{
      'Content-Type':'application/json',
      'Accept': 'application/json'
    },
  );
  if (response.statusCode == 200) {
    return postyrFromJson(jsonDecode(response.body));

  }
  else {
    throw Exception('Failed to delete album.');
  }
}

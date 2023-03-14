import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'getdate.dart';
import 'model.dart';
class coomment extends StatefulWidget {
  const coomment({Key? key}) : super(key: key);

  @override
  State<coomment> createState() => _coommentState();
}

class _coommentState extends State<coomment> {
  late Future<List<Postyy>> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = fetchPost();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder<List<Postyy>>(
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
                     "${snapshot.data![index].commnet} ",
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
Future<List<Postyy>> deleteAlbum( id) async {
  final http.Response response = await http.delete(
    Uri.parse('https://sddkakn.onrender.com/user1/deletc/$id'),
    headers:{
      'Content-Type':'application/json',
      'Accept': 'application/json'
    },
  );
  if (response.statusCode == 200) {
    return postyyFromJson(jsonDecode(response.body));

  }
  else {
    throw Exception('Failed to delete album.');
  }
}

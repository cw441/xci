import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../categorise.dart';
import 'modelbuy.dart';

class saw extends StatefulWidget {
  const saw({Key? key}) : super(key: key);

  @override
  State<saw> createState() => _sawState();
}
late Future<List<Postyrw>> futurePost;



class _sawState extends State<saw> {
  @override
void initState() {
  super.initState();
  futurePost = iitouostwe();
}
  static const headers = {'Content-Type': 'application/json', 'Accept': 'application/json'};
  Future<List<Postyrw>> iitouostwe() async {
    SharedPreferences preferences =await SharedPreferences.getInstance();
    final String? idss = preferences.getString('idss');

    final response =
    await http.get(
      Uri.parse( 'https://sddkakn.onrender.com/userr/getbuy/${idss}'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      print(response.body);
      final jsoon = json.decode(response.body);
      return  jsoon.map<Postyrw>((json) => Postyrw.fromJson(json)).toList();


    } else {
      throw Exception('Failed to load album');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:FutureBuilder<List<Postyrw>>(
        future: futurePost,
        builder: (context, snapshot) {

         if (snapshot.hasData) {
         return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (_, index) =>
          Container(
              width: MediaQuery.of(context).size.width*1,
              height: MediaQuery.of(context).size.height*0.3,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
               crossAxisAlignment: CrossAxisAlignment.end,
            children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                children: [
                 Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child:  Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        Align(
                            alignment: Alignment.topRight,
                            child:  Text(
                              "${snapshot.data![index].numberproduct}",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.red.shade700
                              ),

                            ),
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child:
                            Text(' : العدد العلاج المطلوب ' ,
                                style: TextStyle(
                                    fontSize: 18,
                                    decoration: TextDecoration.none,
                                    color: Colors.red.shade700
                                )
                            )),
                      ],

                    ),
                  ),

                                  SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child:  Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              "${snapshot.data![index].prase}",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.red.shade700
                              ),

                            ),
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child:
                            Text(' : السعر الكلي  ' ,
                                style: TextStyle(
                                    fontSize: 18,
                                    decoration: TextDecoration.none,
                                    color: Colors.red.shade700
                                )
                            )),
                      ],

                    ),
                  ),

                  SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                  Text(
                    "${snapshot.data![index].namebuy}",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.red.shade700
                    ),

                  ),

        ]),
                 Row(mainAxisSize: MainAxisSize.max,

                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [


                 Text(
                        "${snapshot.data![index].tem}",
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.red.shade700
                        ),

                      ),                  SizedBox(width: MediaQuery.of(context).size.width*0.1,),

                   Text(
                        "${snapshot.data![index].address}",
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.red.shade700
                        ),

                      ),                  SizedBox(width: MediaQuery.of(context).size.width*0.1,),

                   Text(
                        "${snapshot.data![index].phone}",
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.red.shade700
                        ),

                      ),
            ],),
       ]  ),
               ClipRRect(
                  borderRadius:BorderRadius.circular(15),
                  child: Image.memory(
                    base64Decode("${snapshot.data![index].image}"),
                    width: MediaQuery.of(context).size.height*0.3,
                    height: MediaQuery.of(context).size.height*0.3,   fit: BoxFit.fill,
                  )
              ),
            ],
          ),
          )
         );
         }
         else {
           return Center(child: CircularProgressIndicator());
         }
        }
        ),
        floatingActionButton: FloatingActionButton(
            elevation: 10,
            child:Container(
             height: 100,
             width: 100,
             child: Icon(Icons.home,
             size: 30,
             color: Colors.red.shade700,),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),

                  color: Colors.white
              ),
            ),

            onPressed:(){

              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => sss()));

            }
        )
    );
  }
}

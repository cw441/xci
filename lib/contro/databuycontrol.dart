import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../buy/modelbuy.dart';
import '../categorise.dart';
import '../mainall.dart';
import '../segery/editnum.dart';
import 'controlpnal.dart';
import 'edittlb.dart';

class ssaass extends StatefulWidget {
  const ssaass({Key? key}) : super(key: key);

  @override
  State<ssaass> createState() => _ssaassState();
}
late Future<List<Postyrw>> futurePost;



class _ssaassState extends State<ssaass> {
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
      Uri.parse( 'https://sddkakn.onrender.com/userr/getbuy'),
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
  bool isdecstop(BuildContext context) =>MediaQuery.of(context).size.width >= 850;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

       leading: IconButton(
        onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => control()));
    },
        icon:Icon(Icons.arrow_back) ,),
    centerTitle:true ,
    elevation: 0,
    foregroundColor:Colors.red.shade700,
    backgroundColor: Colors.white,
    title: Text("طلبات العملاء",
    style: TextStyle(
    color: Colors.red.shade700,
    fontSize: 20
    ),
    ),),
        backgroundColor: Colors.white,
        body:FutureBuilder<List<Postyrw>>(
            future: futurePost,
            builder: (context, snapshot) {

              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) =>
                    Card(
                        color: Colors.white,
                        elevation: 1,
                        child:   Container(
                          width: MediaQuery.of(context).size.width*1,
                          height: MediaQuery.of(context).size.height*0.25,
                          child:SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(width: MediaQuery.of(context).size.width*0.6),

                              Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.end,

                                        children: [

                                          SizedBox(width: MediaQuery.of(context).size.width*0.05),
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
                                                        fontSize:   isdecstop(context)? 18:14,
                                                        color: Colors.red.shade700
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                    alignment: Alignment.topRight,
                                                    child:
                                                    Text(' : السعر الكلي  ' ,
                                                        style: TextStyle(
                                                            fontSize:   isdecstop(context)? 18:14,
                                                            decoration: TextDecoration.none,
                                                            color: Colors.red.shade700
                                                        )
                                                    )),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                          Text(
                                            "${snapshot.data![index].namebuy}",
                                            style: TextStyle(
                                                fontSize:   isdecstop(context)? 15:14,
                                                color: Colors.red.shade700
                                            ),
                                          ),
                                        ]),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.all(4),
                                            child:  Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                TextButton(onPressed: (){
                                                  Navigator.push(context, MaterialPageRoute(
                                                      builder: (context) =>
                                                          pcssddd  (apip:'https://sddkakn.onrender.com/userr/uptbug/${snapshot.data![index].id}') ));
                                                },
                                                  child:Icon(Icons.edit,
                                                    color: Colors.red.shade700,

                                                  ),  ) ,
                                                SizedBox(width: MediaQuery.of(context).size.width*0.05,),

                                                Text(
                                            "${snapshot.data![index].tem}",
                                            style: TextStyle(
                                                fontSize:   isdecstop(context)? 15:14,
                                                color: Colors.red.shade700
                                            ),

                                        )])),
                                        Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: Alignment.topRight,
                                            child:  Text(
                                              "${snapshot.data![index].numberproduct}",
                                              style: TextStyle(
                                                  fontSize:   isdecstop(context)? 15:14,
                                                  color: Colors.red.shade700
                                              ),
                                            ),
                                          ),
                                          Align(
                                              alignment: Alignment.topRight,
                                              child:
                                              Text(' : العدد العلاج المطلوب ' ,
                                                  style: TextStyle(
                                                      fontSize:   isdecstop(context)? 15:14,

                                                      decoration: TextDecoration.none,
                                                      color: Colors.red.shade700
                                                  )
                                              )),
                                        ],
                                      ),
                                                      SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Align(
                                    alignment: Alignment.topRight,
                                    child:  Text(
                                          "${snapshot.data![index].address}",
                                      style: TextStyle(
                                          fontSize:   isdecstop(context)? 15:14,
                                          color: Colors.red.shade700
                                      ),
                                    ),
                                    ),
                                  Align(
                                      alignment: Alignment.topRight,
                                      child:Icon(Icons.location_on,
                                          color: Colors.red.shade700,
                                        size: 25,

                                      )
                                      ),
                                  ],
                                ),               SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                        Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: Text(
                                          "${snapshot.data![index].phone}",
                                          style: TextStyle(
                                              fontSize:   isdecstop(context)? 15:14,
                                              color: Colors.red.shade700
                                          ),
                                        ),),
                                              Align(
                                                  alignment: Alignment.topRight,
                                                  child:Icon(Icons.phone,
                                                    color: Colors.red.shade700,
                                                    size: 25,

                                                  )
                                              ),
                                            ],
                                        ),
                                      ],),
                                  ]  ),
                              Container(
                                  width: MediaQuery.of(context).size.height*0.2,
                                  height: MediaQuery.of(context).size.height*0.2,
                                  child: Image.memory(
                                    base64Decode("${snapshot.data![index].image}"),
                                    width: MediaQuery.of(context).size.height*0.2,
                                    height: MediaQuery.of(context).size.height*0.2,
                                    fit: BoxFit.fill,
                                  )
                              ),

                            ],
                          ),)
                        ))
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
                  builder: (context) => control()));

            }
            )
    );
  }
}

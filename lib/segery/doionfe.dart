
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


import '../segery/model.dart';
import '../thn/secrren_details.dart';
import 'secrren_details.dart';



class sssxcr extends StatefulWidget {
  String ddoo;
  String link;

  sssxcr({Key? key , required this.ddoo,required this.link}) : super(key: key);

  @override
  State<sssxcr> createState() => _sssxcrState(ddoo,link);
}

class _sssxcrState extends State<sssxcr> {

  late Future<List<PostSd>> futurePost;


  @override
  void initState() {
    super.initState();
    futurePost = iitouostwe();
  }

  static const headers = {'Content-Type': 'application/json', 'Accept': 'application/json'};
  Future<List<PostSd>> iitouostwe() async {

    final response =
    await http.get(
      Uri.parse( 'https://sddkakn.onrender.com/${link}/${ddoo}'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      print(response.body);
      final jsoon = json.decode(response.body);
      return  jsoon.map<PostSd>((json) => PostSd.fromJson(json)).toList();


    } else {
      throw Exception('Failed to load album');
    }
  }
  String ddoo;
  String link;
  _sssxcrState(
   this.ddoo,
      this.link
      );
  @override
  bool isdecstop(BuildContext context) =>MediaQuery.of(context).size.width >= 850;

  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<List<PostSd>>(
        future: futurePost,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                clipBehavior: Clip.none,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: isdecstop(context)? 1:12,
                  mainAxisSpacing:isdecstop(context)? 10:50,
                  crossAxisCount:  isdecstop(context)? 3:2,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) =>
                    Stack(
                      children: [

                        Container(
                            width:isdecstop(context)? MediaQuery.of(context).size.width*0.3:MediaQuery.of(context).size.width*0.4,
                            height: MediaQuery.of(context).size.height*0.35,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12.withOpacity(0.1),
                                    offset: Offset(4, 4),
                                    blurRadius: 2,
                                    spreadRadius: 1),
                                BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(-4, -4),
                                    blurRadius: 2,
                                    spreadRadius: 1),
                              ],
                            ),
                            child: Column (
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  TextButton(
                                      onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(
                                            builder: (context) =>screenIn1(
                                              id:snapshot.data![index].id,
                                              name:snapshot.data![index].name,
                                              image:snapshot.data![index].image,
                                              desc:snapshot.data![index].desc,
                                              numberproduct:snapshot.data![index].numberproduct,
                                              sizeproduct:snapshot.data![index].sizeproduct,
                                              expar:snapshot.data![index].expar,
                                              prase:snapshot.data![index].prase,
                                              conutry:snapshot.data![index].conutry,



                                            )
                                        )
                                        );
                                      },
                                      child: ClipRRect(
                                          borderRadius:BorderRadius.circular(15),
                                          child: Image.memory(
                                            base64Decode("${snapshot.data![index].image}"),
                                            width:isdecstop(context)? MediaQuery.of(context).size.width*0.3:MediaQuery.of(context).size.width*0.4,
                                            height: isdecstop(context)? MediaQuery.of(context).size.height*0.25:MediaQuery.of(context).size.width*0.17,
                                            fit: BoxFit.fill,
                                          )
                                      )
                                  ),
                                  Row(children: [
                                    TextButton(
                                      onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(
                                            builder: (context) =>screenIn1(
                                              id:snapshot.data![index].id,
                                              name:snapshot.data![index].name,
                                              image:snapshot.data![index].image,
                                              desc:snapshot.data![index].desc,
                                              numberproduct:snapshot.data![index].numberproduct,
                                              sizeproduct:snapshot.data![index].sizeproduct,
                                              expar:snapshot.data![index].expar,
                                              prase:snapshot.data![index].prase,
                                              conutry:snapshot.data![index].conutry,



                                            )
                                        )
                                        );
                                      },
                                      child: Text(
                                        'اقرأ الوصف',
                                        textAlign:TextAlign.end,
                                        style: TextStyle(
                                            fontSize: isdecstop(context)? 18:14,
                                            color: Colors.black54
                                        ),
                                      ),),
                                    Spacer(),
                                    Text(
                                      "${snapshot.data![index].name} ".length>10?'...'+"${snapshot.data![index].name} ".substring(0,10):"${snapshot.data![index].name} ",
                                      textAlign:TextAlign.end,
                                      style: TextStyle(
                                          fontSize:   isdecstop(context)? 18:14,
                                          color: Colors.black54
                                      ),
                                    ),


                                  ],
                                  ),
                                  Center(
                                    child:Text(
                                      r"$" "${snapshot.data![index].prase}",
                                      textAlign:TextAlign.center,
                                      style: TextStyle(
                                          fontSize:   isdecstop(context)?18:14,
                                          color: Colors.yellow.shade600
                                      ),
                                    ),
                                  )
                                ]
                            )
                        ),


                      ],
                    )

            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),

      //    floatingActionButton: FloatingActionButton(
      //        elevation: 10,

      //        child:Container(
      //         height: 100,
      //         width: 100,
      //         child: Icon(Icons.add,
      //         size: 30,
      //         color: Colors.red.shade700,),
      //          decoration: BoxDecoration(
      //              borderRadius: BorderRadius.circular(100),

      //              color: Colors.white
      //          ),
      //        ),

      //        onPressed:(){

      //          Navigator.push(context, MaterialPageRoute(
      //              builder: (context) => posted()));

      //        }
      //    )
    );
  }
}
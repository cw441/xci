
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:katk/contro/controlpnal.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Sign_up/modle.dart';
import 'Sign_up/segin.dart';
import 'buy/databuy.dart';
import 'categorise.dart';
import 'comm/displaysendget.dart';
import 'mnnhn.dart';


class ssse extends StatefulWidget {

  ssse({Key? key ,}) : super(key: key);

  @override
  State<ssse> createState() => _ssseState();
}

class _ssseState extends State<ssse> {

  late Future<List<PostSd>> futurePost;
  bool isSg = true;
  String a ="ff";
  String b ="11";

  @override
  void initState() {
    super.initState();
    futurePost = iitouostwe();
  }
  savid(idd)async{
    SharedPreferences preferences =await SharedPreferences.getInstance();
    preferences.setString('idss',idd );
    print(preferences.getString('idss'));

  }
  static const headers = {'Content-Type': 'application/json', 'Accept': 'application/json'};
  Future<List<PostSd>> iitouostwe() async {
    SharedPreferences preferences =await SharedPreferences.getInstance();
    final String? passored = preferences.getString('passored');
    final String? email = preferences.getString('email');
    final response =
    await http.get(
      Uri.parse( 'https://sddkakn.onrender.com/userr/getlogin/${isSg?email:a}/${isSg?passored:b}'),
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
  bool isdecstop(BuildContext context) =>MediaQuery.of(context).size.width >= 850;
  bool isMobel(BuildContext context) =>MediaQuery.of(context).size.width <= 850;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: isdecstop(context)? AppBar(
        foregroundColor:Colors.red.shade700,
        backgroundColor: Colors.white,
        elevation: 0,
        actions:[
          IconButton(
            onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => logw()));
        },
          icon:Icon(Icons.output) ,)],)
          : AppBar(
        actions:[
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => logw()));
            },
            icon:Icon(Icons.output) ,)],
        centerTitle:true ,
        elevation: 0,
        foregroundColor:Colors.red.shade700,
        backgroundColor: Colors.white,
        title: Text("الامل",
          style: TextStyle(
              color: Colors.red.shade700,
              fontSize: 20
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      drawer: isdecstop(context)? null:Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.white
              ),
              child: Column(
                children: [
                  Container(
                    height:100,
                    width:100,
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(10),
                      image:DecorationImage(
                        image:AssetImage('images/uu9.jpg'
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),

                  ),

                ],
              ),
            ),
            ListTile(
                title: Text('الادويه',
                    style: TextStyle(
                        color:Colors. red.shade700,
                        fontSize: 15
                    )),
                onTap: () { Navigator.push(
                    context,MaterialPageRoute(builder: (context) => sss())
                );}
            ),
            ListTile(
                title: Text('معلومات عنا',
                    style: TextStyle(
                        color:Colors. red.shade700,
                        fontSize: 15
                    )),
                onTap: () { Navigator.push(
                    context,MaterialPageRoute(builder: (context) => sddsc())
                );}
            ),
            ListTile(
                title: Text('اراء العملاء',
                    style: TextStyle(
                        color:Colors. red.shade700,
                        fontSize: 15
                    )),
                onTap: () { Navigator.push(
                    context,MaterialPageRoute(builder: (context) => sdds())
                );}
            ),
          ],
        ),

      ),
      body: FutureBuilder<List<PostSd>>(
        future: futurePost,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return RefreshIndicator(
                onRefresh:  (){
                  return Future.delayed(
                      Duration(seconds: 2),
                          (){
                        setState(() {

                          iitouostwe();
                        });
                      });
                  },

                child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) =>
                   Container(
                         child: Column(
                         children: [
                          if(isdecstop(context))
                            Container(
                              color: Colors.white,
                              height: MediaQuery.of(context).size.height*0.1,
                              width: MediaQuery.of(context).size.width*1,
                              child:

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right:50 ),
                                    child:
                                    Container(
                                      height: MediaQuery.of(context).size.height*0.1,
                                      width: 200,
                                      decoration: BoxDecoration(
                                          image:DecorationImage(
                                            image:AssetImage(  'images/4fe.jpg',
                                            ),
                                            fit: BoxFit.fill,
                                          )
                                      ),),),

                                  Padding(
                                      padding: const EdgeInsets.all(8),
                                      child:
                                      TextButton(onPressed: ()    {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => sss()));
                                        }, child: Text('الادوية',
                                        textAlign: TextAlign.end ,
                                        style: TextStyle(
                                          color: Colors.red.shade700,
                                          fontSize: 20,
                                        ),)
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.all(8),
                                      child:TextButton(onPressed: (){
                                        savid("${snapshot.data![index].id}");

                                        Navigator.push(context, MaterialPageRoute(builder: (context) => saw()));
                                        }, child: Text('طلبات الادوية',
                                        textAlign: TextAlign.end ,
                                        style: TextStyle(
                                          color: Colors.red.shade700,
                                          fontSize: 20,
                                        ),)
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: TextButton(onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => sddsc()));
                                        },
                                          child: Text('معلومات عنا',
                                            textAlign: TextAlign.end ,
                                            style: TextStyle(
                                              color: Colors.red.shade700,
                                              fontSize: 20,
                                            ),)
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.all(8),
                                      child:TextButton(onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => sdds()));},
                                          child: Text('اراء العملاء',
                                            textAlign: TextAlign.end ,
                                            style: TextStyle(
                                              color: Colors.red.shade700,
                                              fontSize: 20,
                                            ),)
                                      )),
                                ],
                              ),
                            ),
                          Container(
                            height:isdecstop(context)? MediaQuery.of(context).size.height*0.9:MediaQuery.of(context).size.height*1,
                            width: MediaQuery.of(context).size.width*1,
                            decoration: BoxDecoration(
                              image:DecorationImage(
                                image:AssetImage(  'images/58h.jpg',
                                ),
                                fit: isdecstop(context)?BoxFit.fill:BoxFit.cover,
                              ),
                            ),
                            child: Container(
                                height: MediaQuery.of(context).size.height*0.9,
                                width: MediaQuery.of(context).size.width*1,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        Colors.black12,
                                        Colors.black87,
                                      ],
                                      begin: Alignment.topLeft,
                                      end:Alignment.bottomRight
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if(isMobel(context)) Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: TextButton(
                                          onPressed: (){
                                            savid("${snapshot.data![index].id}");
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => saw()));
                                            }, child:Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              borderRadius:BorderRadius.circular(100),
                                              color: Colors.white,
                                            ),
                                            child: Icon(Icons.real_estate_agent,
                                              size: 25,
                                              color: Colors.red.shade700,

                                            )
                                        ),)),
                                    SizedBox(          height: MediaQuery.of(context).size.height*0.3,),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(30),
                                            child:
                                            Text('الامل \n لتوفير الدواء الخاص بك ',
                                              textAlign: TextAlign.end ,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30,
                                              ),
                                            ),),
                                          Padding(
                                            padding: const EdgeInsets.only(right:150 ),
                                            child:
                                            TextButton(onPressed: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => sss()));
                                              }, child:Container(
                                                height: 40,
                                                width: 70,
                                                decoration: BoxDecoration(
                                                  borderRadius:BorderRadius.circular(10),
                                                  color: Colors.red.shade700,
                                                ),
                                                child:Center(child:
                                                Text('ابدأ',
                                                  textAlign: TextAlign.center ,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                  ),))
                                            ),),)
                                        ],),)

                                  ],
                                )
                            ),
                          )
                        ],
                      ),
                    )
                )
            );
          }


          else  {
            return Center(child: CircularProgressIndicator());
          }
          },

      ),
    );
  }
}
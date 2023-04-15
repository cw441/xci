import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:katk/contro/passwoord.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Sign_up/modle.dart';
import '../Sign_up/segin.dart';
import '../categorise.dart';
import '../comm/displaysendget.dart';
import 'addtreat.dart';
import 'databuycontrol.dart';

class control extends StatefulWidget {
  const control({Key? key}) : super(key: key);

  @override
  State<control> createState() => _controlState();
}

class _controlState extends State<control> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:   AppBar(
        foregroundColor:Colors.red.shade700,
        backgroundColor: Colors.white,
        elevation: 0,
        actions:[
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => eeeexxs()));
            },
            icon:Icon(Icons.output) ,)],),
      backgroundColor: Colors.white,
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

                child:

                ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) =>Center(
                      child:SingleChildScrollView(
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.max,
                              children: [

                                Text(
                                  "${snapshot.data![index].name} ",
                                  textAlign:TextAlign.start,
                                  style: TextStyle(
                                      fontSize:    18,
                                    color: Colors.red.shade700,
                                  ),
                                ),
                                Container(
                                  height:80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius:BorderRadius.circular(15),
                                    image:DecorationImage(
                                      image:AssetImage(  'images/rr5.jpg',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),),
                              ],),
                            SizedBox(height:MediaQuery.of(context).size.width*0.07, ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                TextButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) =>
                                          asdn() ));
                                  },
                                  child: cont('اضافة علاج'), ),
                                TextButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) =>
                                          sss() ));
                                  },
                                    child:  cont('عرض علاج')),
                              ],),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                TextButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) =>
                                          ssaass() ));
                                  },
                                    child: cont('طلبات العملاء')),
                                TextButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) =>
                                          sdds() ));
                                  },
                                    child:  cont('مراسلة')),
                              ],)
                          ],
                        ),
                      ),
                    )  )
            );
          }
          else {
            return Center(child: CircularProgressIndicator());
          }
          },

      ),);
  }
  cont(text){
    return Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
            height: MediaQuery.of(context).size.width*0.2,
            width:MediaQuery.of(context).size.width*0.2,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(4, 4),
                    blurRadius: 2,
                    spreadRadius: 1),
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(-4, -4),
                    blurRadius: 2,
                    spreadRadius: 1),
              ],
            ),
            child:Center(child:Text(text,
              style: TextStyle(
                  color: Colors.red.shade700,
                  fontSize: 16
              ) ,
              textAlign: TextAlign.end ,) ,)));

  }
}


import 'dart:convert';
import 'package:katk/segery/postcomseg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:telegram/telegram.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:katk/segery/model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:http/http.dart' as http;
import '../buy/postbuy.dart';
import '../comm/commnat.dart';
import 'commnatseg.dart';
import 'editnum.dart';
import 'getdata.dart';

class screenIn1 extends StatefulWidget {
  String id;
  String name;
  String desc;
  String conutry;
   String expar;
   String sizeproduct;
  String numberproduct;
  String prase;
  String image;

   screenIn1({Key? key,
     required this.id,
  required this.name,
  required this.desc,
  required this.image,
  required this.conutry,
  required this.expar,
  required this.sizeproduct,
  required this.numberproduct,
  required this.prase,
 }) : super(key: key);

  @override
  State<screenIn1> createState() => _screenIn1State(id,name,desc,conutry,prase,expar,sizeproduct,numberproduct,image);
}

class _screenIn1State extends State<screenIn1> {
  String id;
  String name;
  String desc;
  String conutry;
  String expar;
  String sizeproduct;
  String numberproduct;
  String prase;
  String image;
  _screenIn1State(
      this.id,
      this.name,
      this.desc,
      this.image,
      this.conutry,
      this.expar,
      this.sizeproduct,
      this.numberproduct,
      this.prase,
      );
  late Future<List<PostSd>> futurePost;
  void initState() {
    super.initState();
    futurePost = iitouostwe();
  }
  @override
  Widget build(BuildContext context) {
                return Scaffold(
                  body:Column(
                    children: [
                           Image.memory(
                                   base64Decode(prase),
                               fit: BoxFit.fill,
                           height:MediaQuery.of(context).size.height*0.45,
                           width: MediaQuery.of(context).size.width*1,
                             ) ,
                        Container(
                            decoration: BoxDecoration(
                            color: Colors.white,
                            ),
                            width: MediaQuery.of(context).size.width*1,
                            height: MediaQuery.of(context).size.height*0.55,
                              child:SingleChildScrollView(
                                  child:Column(
                                  children: [
                                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                                   Row(
                                     mainAxisSize: MainAxisSize.max,
                                     children: [
                                       Padding(
                                         padding: const EdgeInsets.all(4),
                                         child: Align(
                                             alignment: Alignment.topLeft,
                                             child:  Text(sizeproduct ,
                                                 style: TextStyle(
                                                     fontSize: 18,
                                                     decoration: TextDecoration.none,
                                                     color: Colors.black
                                                 )
                                             ),
                                         ),
                                       ),
                                       Spacer(),
                                       Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Align(
                                          alignment: Alignment.topRight,
                                          child: FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: Text(
                                                  name,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      decoration: TextDecoration.none,
                                                      color: Colors.black
                                                  )
                                              )
                                          )
                                      ),
                                    ),

                                   ],
                                   ),

                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Align(
                                          alignment: Alignment.topRight,
                                          child:Expanded(
                                              child: AutoSizeText(
                                                desc  ,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    decoration: TextDecoration.none,
                                                    color: Colors.black45
                                                ),
                                                minFontSize: 15,
                                                maxLines: 15,
                                              )
                                          )
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Align(
                                          alignment: Alignment.topRight,
                                          child:  Text( image,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  decoration: TextDecoration.none,
                                                  color: Colors.black
                                              )
                                          )
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4),
                                      child:Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [

                                      Align(
                                          alignment: Alignment.topRight,
                                          child:  Text( expar ,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  decoration: TextDecoration.none,
                                                  color: Colors.black
                                              )
                                          )
                                      ),
                                            Align(
                                                alignment: Alignment.topRight,
                                                child:
                                                Text(' : تاريخ الانتهاء ' ,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        decoration: TextDecoration.none,
                                                        color: Colors.black
                                                    )
                                                )),
                                              ]
                                      )
                                              ),
                                    Padding(
                                      padding: const EdgeInsets.all(4),
                                      child:  Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              TextButton(onPressed: (){
                                                Navigator.push(context, MaterialPageRoute(
                                                    builder: (context) =>
                                                        pcssa  (apip:'https://sddkakn.onrender.com/userr/uptd/${id}') ));
                                              },
                                                child:Icon(Icons.edit,
                                                  color: Colors.red.shade700,

                                                ),  ) ,
                                        Spacer(),
                                        Align(
                                        alignment: Alignment.topRight,
                                        child: Text(numberproduct ,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      decoration: TextDecoration.none,
                                                      color: Colors.black
                                                  )
                                              )
                                        ),
                                              Align(
                                                  alignment: Alignment.topRight,
                                                  child:
                                                  Text(' : العدد المتوفر ' ,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          decoration: TextDecoration.none,
                                                          color: Colors.black
                                                      )
                                                  )),
                                            ],

                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(4),
                                      child:Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Align(
                                          alignment: Alignment.topLeft,
                                          child:  Text(  conutry ,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  decoration: TextDecoration.none,
                                                  color: Colors.black
                                              )
                                          )
                                      ),
                                          Align(
                                              alignment: Alignment.topRight,
                                              child:
                                              Text(' : السعر ' ,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      decoration: TextDecoration.none,
                                                      color: Colors.black
                                                  )
                                              )),
                                      ]
                                      )
                                    ),

                                    Container(
                                      height: MediaQuery.of(context).size.height*0.4,
                                      width: MediaQuery.of(context).size.width*1,
                                      child: coomwes(
                                          iad:id,
                                          apidata:'https://sddkakn.onrender.com/userr/comnetuserg/${id}'
                                      ),
                                    ),
                                    Container(
                                      height: MediaQuery.of(context).size.height*0.1,
                                      width: MediaQuery.of(context).size.width*1,
                                      child: pcs(
                                        iad:id,
                                          apip:"https://sddkakn.onrender.com/userr/comnetuserp"
                                      ),
                                    ),


                                  ]
                       )
                      )
                    )
                     ]
      ),
                  floatingActionButton:  FloatingActionButton(
                      elevation: 10,

                      child:Container(
                        height: 100,
                        width: 100,
                        child: Icon(Icons.shopping_cart,
                          size: 30,
                          color: Colors.red.shade700,),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),

                            color: Colors.white
                        ),
                      ),

                      onPressed:(){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>
                                  postedq(
                                      imaag:prase,
                                      naame:name,
                                      praase:conutry
                                  )
                          ));
                        },
                  )
                       );
  }
  Future showToast(String massage) async{
    await Fluttertoast.cancel();
    Fluttertoast.showToast(msg: massage,fontSize: 18,backgroundColor:Colors.red.shade700, );
  }
  bool isSg = true;
  String a ="ff";
  String b ="11";

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

}

import 'dart:convert';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:telegram/telegram.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

import '../segery/commnatseg.dart';
import '../segery/postcomseg.dart';


class  screenIn34 extends StatefulWidget {
  String id;

  String name;
  String desc;
  String conutry;
   String expar;
   String sizeproduct;
  String numberproduct;
  String prase;
  String image;

   screenIn34({Key? key,
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
  State<screenIn34> createState() => _screenIn34State(id,name,desc,conutry,prase,expar,sizeproduct,numberproduct,image);
}

class _screenIn34State extends State<screenIn34> {
  String id;

  String name;
  String desc;
  String conutry;
  String expar;
  String sizeproduct;
  String numberproduct;
  String prase;
  String image;
  _screenIn34State(
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
                                             )
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

                                    SizedBox(height:MediaQuery.of(context).size.height*0.08 ,),
                                    Container(
                                      height: MediaQuery.of(context).size.height*0.77,
                                      width: MediaQuery.of(context).size.width*1,
                                      child: coomwes(
                                          iad:id,
                                          apidata:'https://sddkakn.onrender.com/user1/comnetuserg2/${id}'
                                      ),
                                    ),
                                    Container(
                                      height: MediaQuery.of(context).size.height*0.1,
                                      width: MediaQuery.of(context).size.width*1,
                                      child: pcs(
                                          iad:id,
                                          apip:"https://sddkakn.onrender.com/user1/comnetuserp2"
                                      ),
                                    )
                                  ]
                       )
                      )
                    )
                     ]
      ),
                  floatingActionButton: SpeedDial(
                    icon: Icons.shopping_cart,
                    backgroundColor:Colors.red.shade700,
                    activeIcon: Icons.close,
                    spacing: 5,
                    spaceBetweenChildren: 5,
                    onOpen: ()=> showToast('اختر احد طرق التواصل معنا'),
                    children: [
                      SpeedDialChild(
                          child:Icon(Icons.call,
                            color: Colors.red.shade700,
                          ),
                      onTap: () async {
                        FlutterPhoneDirectCaller.callNumber('07802403955');
                      },
                      label: 'اتصل بنا'),
                        SpeedDialChild(
                          child:Icon(Icons.whatshot,
                            color: Colors.red.shade700,
                          ),
                          onTap: () async {
                            final link = WhatsAppUnilink(
                            phoneNumber: '07802403955',
                             text: "Hey! I'm inquiring about the apartment listing",
                                );
                            await launchUrlString('$link'); },
                          label: 'واتساب'),
                      SpeedDialChild(
                          child:Icon(Icons.telegram,
                            color: Colors.red.shade700,
                          ),
                          onTap: () async {
                            Telegram.send(
                                username:'mohmod457',
                                message:'Thanks for building Telegram Package :)'
                            );
                            },
                          label: 'التليكرام'),
                    ],
                  ),
                       );
  }
  Future showToast(String massage) async{
    await Fluttertoast.cancel();
    Fluttertoast.showToast(msg: massage,fontSize: 18,backgroundColor:Colors.red.shade700, );
  }

}

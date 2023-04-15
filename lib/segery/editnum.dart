
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:katk/segery/secrren_details.dart';

import 'display_treatment.dart';


class pcssa extends StatefulWidget {

  String apip;


  pcssa({Key? key, required this.apip }) : super(key: key);

  @override
  State<pcssa> createState() => _pcssaState( apip);
}

class _pcssaState extends State<pcssa> {
  var formkey = GlobalKey<FormState>();
  var commnet = TextEditingController();


  upload() async{
    var  res =await http.put(Uri.parse(apip),
        headers : {'Content-Type': 'application/json', 'Accept': 'application/json'},
        body:json.encode({
          "numberproduct": commnet.text,
        })

    ) ;
    return res ;

  }
  bool isloading =false;

  void initState(){
    super.initState();

  }

  String apip;
  _pcssaState(
      this.apip
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.white,
        body: Form(
                key:formkey ,

                child:  Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [



                    Padding(
                        padding: const EdgeInsets.all(4),
                        child:Container(
                          width: MediaQuery.of(context).size.width*0.7,
                          child: TextFormField(

                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.confirmation_number ,
                                    color: Colors.red.shade700),
                                hintText:'عدد العلاج الموجود',
                                hintStyle: TextStyle(  color: Colors.red.shade700,
                                    fontSize: 18),
                                hintTextDirection: TextDirection.rtl,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red.shade700,
                                        width: 1),
                                    borderRadius:BorderRadius.circular(50)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red.shade700)
                                )
                            ),
                            validator: (value){
                              if(value!.length<1){
                                return "ادخل العدد" ;
                              }
                              return null;
                            },

                            controller: commnet,

                          ),
                        )
                    ),
                    SizedBox(height: 10,),
                    Center(
                      child: Container(
                        height: 50,
                        width: 120,
                        decoration: BoxDecoration(
                                                                color: Colors.red.shade700,

                            borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextButton(onPressed:()async{
                          if(formkey.currentState!.validate()){
                            Navigator.pop(context,false);
                            upload();
                          }else{
                          }
                        },
                            child:Row(
                              children: [

                                Icon(
                              Icons.upload,
                              size: 30,
                              color: Colors.white
                            ),
                                Text('تعديل العدد',
                                  textAlign:TextAlign.end,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white
                                  ),
                                )
                                ,],
                            )
                        )
                    ),
                    )
                  ],
                )
            )
    );
  }
}

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../categorise.dart';
import '../segery/display_treatment.dart';
import 'databuy.dart';


class postedq extends StatefulWidget {
  String imaag;
  String naame;
  String praase;

   postedq({Key? key,
    required this.naame,
    required this.praase,
    required this.imaag,}) : super(key: key);

  @override
  State<postedq> createState() => _postedqState(
   naame,
   praase,
   imaag,);
}

class _postedqState extends State<postedq> {
  int result=0,num1=0,num2=0;
malta(){
  setState(() {
    num1= int.parse(numberproduct.text);
    num2= int.parse(praase);
    result=num1*num2;
  });
}

  var formkey = GlobalKey<FormState>();
  var address = TextEditingController();
  var phone = TextEditingController();
  var numberproduct = TextEditingController();

  upload() async{
    SharedPreferences preferences =await SharedPreferences.getInstance();
    final String? idss = preferences.getString('idss');
    var  res =await http.post(Uri.parse(  "https://sddkakn.onrender.com/userr/addbuy"),
        headers : {'Content-Type': 'application/json', 'Accept': 'application/json'},
        body:json.encode({
          "namebuy": naame,
          "image": imaag,
          "numberproduct": numberproduct.text,
          "prase":result,
          "tem": " لم يصل  ",
          "address":address.text,
          "phone":phone.text,
          "iduser":idss,
        })

    ) ;
    return res ;
  }

  String imaag;
  String naame;
  String praase;
  _postedqState(
  this.naame,
  this.praase,
  this.imaag,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:SingleChildScrollView(
          child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center ,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*0.05),
                  Image.memory(
                    base64Decode(imaag),
                    fit: BoxFit.fill,
                    height:MediaQuery.of(context).size.height*0.2,
                    width: MediaQuery.of(context).size.height*0.2,
                  ) ,

                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                                naame,
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
                  Form(
                    key:formkey ,
                    child:SingleChildScrollView(
                        child:  Column(
                          children: [

                            Padding(
                                padding: const EdgeInsets.all(8),
                                child: TextFormField(
                                  decoration: InputDecoration(

                                      suffixIcon: Icon(Icons.medical_information ,
                                          color: Colors.red.shade700),
                                      hintText:'عدد العلاجات باللغة الانكليزية ',
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
                                      return "ادخل العدد باللغة الانكليزية" ;
                                    }
                                    return null;
                                  },
                                  controller: numberproduct,
                                  onChanged: (text){

                                  },

                                )
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8),
                                child: TextFormField(
                                  decoration: InputDecoration(

                                      suffixIcon: Icon(Icons.description ,
                                          color: Colors.red.shade700),
                                      hintText:'رقم الهاتف ',
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
                                      return "ادخل الوصف" ;
                                    }
                                    return null;
                                  },
                                  controller: phone,
                                  onChanged: (text){

                                  },
                                )
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8),
                                child: TextFormField(
                                  decoration: InputDecoration(

                                      suffixIcon: Icon(Icons.confirmation_number ,
                                          color: Colors.red.shade700),
                                      hintText:'العنوان  ',
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
                                      return "ادخل العدد الموجود" ;
                                    }
                                    return null;
                                  },
                                  controller: address,
                                  onChanged: (text){

                                  },
                                )
                            ),

                            SizedBox(height: 20,),
                            Container(
                                height: 45,
                                width: 140,
                                decoration: BoxDecoration(
                                  color: Colors.red.shade700,
                                  borderRadius: BorderRadius.circular(15),

                                ),
                                child: TextButton(onPressed:()async{
                                  malta();

                                  if(formkey.currentState!.validate()){
                                    upload();
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(builder: (context){
                                          return saw( );
                                        }
                                        )
                                    );



                                  }else{

                                  }
                                },
                                  child: Text('شراء الدواء',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),)),

                          ],
                        )
                    ),
                  ),

                ],
              )),)
    );
  }
}

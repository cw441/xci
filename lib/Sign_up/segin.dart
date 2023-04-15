import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../categorise.dart';
import '../contro/controlpnal.dart';
import '../mainall.dart';
import '../segery/display_treatment.dart';
import 'logi.dart';


class logw extends StatefulWidget {
  const logw({Key? key}) : super(key: key);

  @override
  State<logw> createState() => _logwState();
}

class _logwState extends State<logw> {
  void initState() {

    super.initState();

  }

  var formkey = GlobalKey<FormState>();
  var email = TextEditingController();
  var passwred = TextEditingController();

  upload() async{
    var  res =await http.post(Uri.parse(  "https://sddkakn.onrender.com/userr/in"),
        headers : {'Content-Type': 'application/json', 'Accept': 'application/json'},
        body:json.encode({
          "email": email.text,
          "passwred": passwred.text
        })

    ) ;
    return res ;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body:SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center ,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.05),

                Container(
                    height: MediaQuery.of(context).size.height*0.6,
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Image.asset('images/uu9.jpg',
                      fit: BoxFit.fill,
                    )
                ) ,
                SizedBox(height: MediaQuery.of(context).size.height*0.05),

                Form(
                  key:formkey ,
                  child:SingleChildScrollView(
                      child:  Column(
                        children: [

                          Padding(
                              padding: const EdgeInsets.all(8),
                              child: TextFormField(
                                decoration: InputDecoration(

                                    suffixIcon: Icon(Icons.email ,
                                        color: Colors.red.shade700),
                                    hintText:'البريد الالكتروني',
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
                                    return "ادخل البريد الالكتروني" ;
                                  }
                                  return null;
                                },
                                controller: email,
                                onChanged: (text){

                                },

                              )
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8),
                              child: TextFormField(
                                decoration: InputDecoration(

                                    suffixIcon: Icon(Icons.key ,
                                        color: Colors.red.shade700),
                                    hintText:'كلمة السر ',
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
                                    return "ادخل كلمة السر" ;
                                  }
                                  return null;
                                },
                                controller: passwred,
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
                                if(formkey.currentState!.validate()){
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(builder: (context){
                                        return control( );
                                      }
                                      )
                                  );

                                    SharedPreferences preferences =await SharedPreferences.getInstance();
                                    preferences.setString('passored', passwred.text);
                                    preferences.setString('email', email.text);
                                    print(preferences.getString('passwred'));

                                  upload();
                                }else{

                                 }
                                },
                                child: Text('تسجيل الدخول',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                                ),)),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child:
                          Container(
                              height:45,
                              width: MediaQuery.of(context).size.width*1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(onPressed:(){

                                   Navigator.of(context).pushReplacement(
                                   MaterialPageRoute(builder: (context){
                                   return log();}));
                                },
                                  child: Text('تسجيل حساب جديد',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.red.shade700,
                                    )
                                  ),
                                  ),
                                Text(' ليس لديك حساب؟',
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 15
                                  ),
                                  textAlign: TextAlign.end ,
                                ),

                              ],
                              )
                          ))
                        ],
                      )
                  ),
                ),

              ],
           ),)
    );
  }
}

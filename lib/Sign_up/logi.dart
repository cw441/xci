
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:katk/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../categorise.dart';
import '../contro/controlpnal.dart';
import '../mainall.dart';


class log extends StatefulWidget {
  const log({Key? key}) : super(key: key);

  @override
  State<log> createState() => _logState();
}

class _logState extends State<log> {
  var formkey = GlobalKey<FormState>();
  var name = TextEditingController();
  var email = TextEditingController();
  var passwred = TextEditingController();


  upload() async{
    var  res =await http.post(Uri.parse(  "https://sddkakn.onrender.com/userr/creat"),
        headers : {'Content-Type': 'application/json',
          'Accept': 'application/json',},
        body:json.encode({
          "email": email.text,
          "name": name.text,
          "passwred": passwred.text
        })

    ) ;
    return res ;

  }
bool isloading =false;

  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:Center(child: Text('تسجيل حساب جديد',
          style: TextStyle(
            fontSize: 20,
            color: Colors.red.shade700,
          ),
        )
          ),
              elevation: 0
      ),
      backgroundColor: Colors.white,
        body:SingleChildScrollView(

          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center ,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key:formkey ,
            child:SingleChildScrollView(
                child:  Column(
                 children: [
                   Container(
                       height: MediaQuery.of(context).size.height*0.6,
                       width: MediaQuery.of(context).size.width*0.5,
                       child: Image.asset('images/uu9.jpg',
                         fit: BoxFit.fill,
                       )
                   ) ,
                   SizedBox(height: MediaQuery.of(context).size.height*0.05),

                   Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      decoration: InputDecoration(

                          suffixIcon: Icon(Icons.person ,
                              color: Colors.red.shade700),
                          hintText:'الاسم',
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
                              if(value!.length<4){
                              return "يرجى ادخال اسم يزيد عن ثلاث حروف و اقل من خمسة عشر حرفاً" ;
                              }
                              return null;
                              },

                      controller: name,

                    )
                ),
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

                SizedBox(height: 10,),
                   Container(
                       height: 55,
                       width: 210,
                       decoration: BoxDecoration(
                         color: Colors.red.shade700,
                         borderRadius: BorderRadius.circular(15),

                       ),
                       child: TextButton(onPressed:(){
                         setState(() async{
                        if(formkey.currentState!.validate()){
                          upload();
                         SharedPreferences preferences =await SharedPreferences.getInstance();
                         preferences.setString('passored', passwred.text);
                         preferences.setString('email', email.text );

                         isloading=true;


                             Future.delayed(
                             Duration(seconds: 4),(){

                           Navigator.of(context).pushReplacement(
                               MaterialPageRoute(builder: (context){
                                 return ssse();
                                }
                               )
                           );

                         });}else{
                           Navigator.of(context).pushReplacement(
                               MaterialPageRoute(builder: (context){
                                 return control();
                               }
                               )
                           );
                          }
                           });

                        },
                         child: isloading?Row(
                             children:[
                               CircularProgressIndicator(color: Colors.white,backgroundColor:Colors.red.shade700 ,),
                               SizedBox(width: 4,),
                               Text('جاري عمل حساب جديد',
                                 style: TextStyle(
                                   fontSize: 18,
                                   color: Colors.white,
                                 ),
                               ),
                             ]
                         ) :Text('تسجيل ',
                         style: TextStyle(
                           fontSize: 18,
                           color: Colors.white,
                         ),
                       )
                      )
                   ),
                  ],
                )
              ),
            )
           ],
           )
          )

    );
  }
}

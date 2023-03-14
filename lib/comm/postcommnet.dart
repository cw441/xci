
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'displaysendget.dart';


class eeeexx extends StatefulWidget {
  const eeeexx({Key? key}) : super(key: key);

  @override
  State<eeeexx> createState() => _eeeexxState();
}

class _eeeexxState extends State<eeeexx> {
  var formkey = GlobalKey<FormState>();
  var commnet = TextEditingController();


  upload() async{
    var  res =await http.post(Uri.parse(  "https://sddkakn.onrender.com/user1/addc"),
        headers : {'Content-Type': 'application/json', 'Accept': 'application/json'},
        body:json.encode({
          "commnet": commnet.text,
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

        backgroundColor: Colors.white,
        body: Center(
            child:Form(
                      key:formkey ,

                          child:  Row(
                            children: [



                              Padding(
                                  padding: const EdgeInsets.all(4),
                                  child:Container(
                                    width: MediaQuery.of(context).size.width*0.85,
                                    child: TextFormField(

                                    decoration: InputDecoration(
                                        suffixIcon: Icon(Icons.person ,
                                            color: Colors.red.shade700),
                                        hintText:'اكتب ملاحظتك',
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
                                      if(value!.length<3){
                                        return "يجب ان تكون ملاحظة اكثر من ثلاث حروف" ;
                                      }
                                      return null;
                                    },

                                    controller: commnet,

                                   ),
                                  )
                                 ),Center(child:
                                  Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: TextButton(onPressed:()async{
                                    if(formkey.currentState!.validate()){
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(builder: (context){
                                            return sdds();
                                          }
                                          )
                                      );
                                      upload();
                                    }else{
                                    }
                                  },
                                      child: Icon(
                                        Icons.send,
                                        size: 30,
                                        color: Colors.red.shade700,
                                      )
                                  )
                              ),
                            )
                            ],
                          )
                    )

            )
    );
  }
}

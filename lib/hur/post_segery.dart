import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../segery/display_treatment.dart';
import 'display_treatment.dart';


class ffffds extends StatefulWidget {
  const ffffds({Key? key}) : super(key: key);

  @override
  State<ffffds> createState() => _ffffdsState();
}

class _ffffdsState extends State<ffffds> {
  void initState() {

    super.initState();

  }

  File? image;
  bool _isLoading = false;
  Uint8List? decodedBytes;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    }
    on PlatformException
    catch (e) {
      print(e);
    } }




  var formkey = GlobalKey<FormState>();
  var name = TextEditingController();
  var desc = TextEditingController();
  var numberproduct = TextEditingController();
  var sizeproduct = TextEditingController();
  var prase = TextEditingController();
  var expar = TextEditingController();
  var conutry = TextEditingController();
  upload() async{
    Uint8List imageBytes = await image!.readAsBytes(); //convert to bytes
    String base64string = base64.encode(imageBytes);
    var  res =await http.post(Uri.parse(  "https://sddkakn.onrender.com/user1/add8"),
        headers : {'Content-Type': 'application/json', 'Accept': 'application/json'},
        body:json.encode({
          "name": name.text,
          "desc": desc.text,
          "numberproduct": numberproduct.text,
          "sizeproduct":sizeproduct.text,
          "prase":prase.text,
          "expar":expar.text,
          "conutry":conutry.text,
          "image":base64string
        })

    ) ;
    return res ;
  }



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
                                      hintText:' اسم الدواء',
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
                                      return "ادخل اسم الدواء" ;
                                    }
                                    return null;
                                  },
                                  controller: name,
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
                                      hintText:'وصف العلاج  ',
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
                                  controller: desc,
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
                                      hintText:'العدد المتوفر  ',
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
                                  controller: numberproduct,
                                  onChanged: (text){

                                  },
                                )
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8),
                                child: TextFormField(
                                  decoration: InputDecoration(

                                      suffixIcon: Icon(Icons.format_size ,
                                          color: Colors.red.shade700),
                                      hintText:'حجم العلاج  ',
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
                                      return "ادخل الحجم" ;
                                    }
                                    return null;
                                  },
                                  controller: sizeproduct,
                                  onChanged: (text){

                                  },
                                )
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8),
                                child: TextFormField(
                                  decoration: InputDecoration(

                                      suffixIcon: Icon(Icons.price_change ,
                                          color: Colors.red.shade700),
                                      hintText:'السعر  ',
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
                                      return "ادخل السعر" ;
                                    }
                                    return null;
                                  },
                                  controller: prase,
                                  onChanged: (text){

                                  },
                                )
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8),
                                child: TextFormField(
                                  decoration: InputDecoration(

                                      suffixIcon: Icon(Icons.explicit_rounded ,
                                          color: Colors.red.shade700),
                                      hintText:'تاريخ الانتهاء ',
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
                                      return "ادخل التاريخ النفاذ" ;
                                    }
                                    return null;
                                  },
                                  controller: expar,
                                  onChanged: (text){

                                  },
                                )
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8),
                                child: TextFormField(
                                  decoration: InputDecoration(

                                      suffixIcon: Icon(Icons.factory_outlined ,
                                          color: Colors.red.shade700),
                                      hintText:'الدولة المنشأ  ',
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
                                      return "ادخل اسم البلد" ;
                                    }
                                    return null;
                                  },
                                  controller: conutry,
                                  onChanged: (text){

                                  },
                                )
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8),
                                child: TextButton(onPressed: (){
                                  pickImage();
                                },
                                   child: Container(
                                     height: 100,
                                     width: 100,
                                     decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(10),

                                     image:DecorationImage(
                                       image:AssetImage(  'images/rrb.jpg',
                                       ),
                                       fit: BoxFit.fill,
                                     ),
                                   ),)
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
                                          return hur( );
                                        }
                                        )
                                    );


                                    upload();
                                  }else{

                                  }
                                },
                                  child: Text('نشر العلاج',
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

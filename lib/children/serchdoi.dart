import 'package:flutter/material.dart';

import '../segery/doionfe.dart';


class sdsdfl extends StatefulWidget {
  const sdsdfl({Key? key}) : super(key: key);

  @override
  State<sdsdfl> createState() => _sdsdflState();
}

class _sdsdflState extends State<sdsdfl> {
  var ddooi=TextEditingController();
  var ddoo;
  var link;
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key:formkey ,
        child:  Row(
          children: [
            Padding(
                padding: const EdgeInsets.all(4),
                child:Container(
                  width: MediaQuery.of(context).size.width*0.85,
                  child: TextFormField(

                    decoration: InputDecoration(

                        hintText:'اسم العلاج',
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

                    controller: ddooi,

                  ),
                )
            ),
            Center(
              child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextButton(onPressed:()async{
                    print(ddooi);
                    if(formkey.currentState!.validate()){
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context){
                            return sssxcr(
                              ddoo:ddooi.text,
                              link:'user1/getd1'

                            );
                          }
                          )
                      );
                    }else{
                    }
                  },
                      child: Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.red.shade700,
                      )
                  )
              ),
            )
          ],
        )  );
  }
}


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Sign_up/segin.dart';
import 'databuycontrol.dart';


class eeeexxs extends StatefulWidget {
  const eeeexxs({Key? key}) : super(key: key);

  @override
  State<eeeexxs> createState() => _eeeexxsState();
}

class _eeeexxsState extends State<eeeexxs> {
  var formkey = GlobalKey<FormState>();
  var commnet = TextEditingController();

  int num1=0,num2=0;

  bool isloading =false;

  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.white,
        body:
            Form(
                      key:formkey ,


                              child:Column(
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
                                        suffixIcon: Icon(Icons.person ,
                                            color: Colors.red.shade700),
                                        hintText:'اكتب كلمة السر',
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
                                        return "اكتب كلمة السر " ;
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
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: TextButton(onPressed:()async{
                                    setState(() {
                                    num1= int.parse(commnet.text);
                                    num2= int.parse('1111');

                                  });
                                    if(formkey.currentState!.validate()){
                                      if(num1==num2){
                                        SharedPreferences preferences =await SharedPreferences.getInstance();
                                        preferences.setString('pass', commnet.text);

                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(builder: (context){
                                            return logw();
                                          }
                                          )
                                      );}else{
                                        return showDialog(
                                            context: context,
                                            builder: (context)=>AlertDialog(
                                              title:Text('كلمة السر خطأ',
                                                style: TextStyle(
                                                    color: Colors.red.shade700,
                                                    fontSize: 16
                                                ) ,
                                                textAlign: TextAlign.end ,) ,)
                                        );
                                      }
                                    }else{

                                    }
                                  },
                                      child:Container(
                                          height: 50,
                                          width: 150,
                                          decoration: BoxDecoration(
                                            borderRadius:BorderRadius.circular(10),
                                            color: Colors.red.shade700,
                                          ),
                                          child:Center(child: Text('تحقق من كلمة السر',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16
                                        ) ,
                                        textAlign: TextAlign.end ,)))
                                  )
                              ),
                            )
                            ],
                          )
                    )


    );
  }
}

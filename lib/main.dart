import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:katk/Sign_up/segin.dart';

import 'categorise.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        debugShowCheckedModeBanner:false,
      home: slashScreen()
    );
  }
}

class slashScreen extends StatefulWidget {
  const slashScreen({Key? key}) : super(key: key);

  @override
  State<slashScreen> createState() => _slashScreenState();
}

class _slashScreenState extends State<slashScreen> {
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3),trans);

  }
trans() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences preferences =await SharedPreferences.getInstance();

    var emall = preferences.getString('email');
    var passored= preferences.getString('passored');
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>

        emall != null && passored != null?sss():
        logw()), (route) => false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(
        child:Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.05),
            Container(
              height: MediaQuery.of(context).size.height*0.6,
              width: MediaQuery.of(context).size.width*0.5,
                child: Image.asset('images/uu9.jpg',
                fit: BoxFit.fill,
            )
           ) ,
            SizedBox(height: MediaQuery.of(context).size.height*0.1),

            Container(
                height: MediaQuery.of(context).size.height*0.1,
                width: MediaQuery.of(context).size.width*0.5,
                child: Image.asset('images/gg5.jpg',
                  fit: BoxFit.fill,
                )
            ) ,
          ],
        )
      )
    );
  }
}
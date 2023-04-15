import 'package:flutter/material.dart';
import 'package:katk/comm/postcommnet.dart';

import '../contro/controlpnal.dart';
import '../mainall.dart';
import 'serchdoi.dart';
import 'display_treatment.dart';
class fscbo6 extends StatefulWidget {
  const fscbo6({Key? key}) : super(key: key);

  @override
  State<fscbo6> createState() => _fscbo6State();
}

class _fscbo6State extends State<fscbo6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

        body:SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width*1,
                  height: MediaQuery.of(context).size.height*0.1,
                  child: sdsdfl()),
              Container(
                height: MediaQuery.of(context).size.height*0.9,
                width: MediaQuery.of(context).size.width*1,
                child: shib(),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            elevation: 10,
            child:Container(
              height: 100,
              width: 100,
              child: Icon(Icons.home,
                size: 30,
                color: Colors.red.shade700,),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),

                  color: Colors.white
              ),
            ),

            onPressed:(){

              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => control()));

            }
        )
    );
  }
}

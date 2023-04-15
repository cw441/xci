import 'package:flutter/material.dart';
import 'package:katk/comm/postcommnet.dart';

import '../contro/controlpnal.dart';
import '../mainall.dart';
import 'serchdoi.dart';
import 'display_treatment.dart';
class fscbo5 extends StatefulWidget {
  const fscbo5({Key? key}) : super(key: key);

  @override
  State<fscbo5> createState() => _fscbo5State();
}

class _fscbo5State extends State<fscbo5> {
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
                child: klb(),
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

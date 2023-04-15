import 'package:flutter/material.dart';
import 'package:katk/comm/postcommnet.dart';

import '../contro/controlpnal.dart';
import '../mainall.dart';
import 'commnat.dart';
class sdds extends StatefulWidget {
  const sdds({Key? key}) : super(key: key);

  @override
  State<sdds> createState() => _sddsState();
}

class _sddsState extends State<sdds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('اراء العملاء',

        style: TextStyle(
        color: Colors.red.shade700,
      ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,),
      body:SingleChildScrollView(
        child: Column(
        children: [
        Container(
          height: MediaQuery.of(context).size.height*0.77,
          width: MediaQuery.of(context).size.width*1,
          child: coomment(),
        ),
          Container(
            height: MediaQuery.of(context).size.height*0.1,
            width: MediaQuery.of(context).size.width*1,
            child: eeeexx(),
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

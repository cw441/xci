import 'package:flutter/material.dart';
import 'package:katk/comm/postcommnet.dart';

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
      appBar: AppBar(title: Text('اراء المستخدمين',

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
      )
    );
  }
}

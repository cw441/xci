import 'package:flutter/material.dart';

import '../children/post_segery.dart';
import '../eyes/post_segery.dart';
import '../hur/post_segery.dart';
import '../klf/post_segery.dart';
import '../retan/post_segery.dart';
import '../segery/post_segery.dart';
import '../shib/post_segery.dart';
import '../snan/post_segery.dart';
import '../tgmal/post_segery.dart';
import '../thn/post_segery.dart';
import 'controlpnal.dart';

class asdn extends StatefulWidget {
  const asdn({Key? key}) : super(key: key);

  @override
  State<asdn> createState() => _asdnState();
}

class _asdnState extends State<asdn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:SingleChildScrollView(
        child:
    Column(
        children: [


          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              Padding(
                  padding: const EdgeInsets.all(8),
                  child:
                  Container(
                    height: 30,
                    child:  Text('اضافة علاج' ,
                      style: TextStyle(
                        color: Colors.red.shade700,
                        fontSize: 18,

                      ),
                      textAlign: TextAlign.end ,
                    ),
                  ) ),
              SizedBox(height:MediaQuery.of(context).size.height*0.08,) ,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>
                            posted()));
                  },
                    child:division('اضافة علاج لعيون ','images/1z.jpg'),
                  ),
                  TextButton(onPressed: (){

                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          postChilld()));
                  },
                      child:  division('اضافة علاج لاطفال','images/df5.jpg')),


                ],),
              SizedBox(height:MediaQuery.of(context).size.width*0.08,) ,

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  TextButton(onPressed: ()  {

                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => ffffds()));
                  },
                      child:  division('اضافةالمستلزمات الطبية ','images/zzf.jpg')),
                  TextButton(onPressed: (){

                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => duof()));
                  },
                      child: division('اضافة علاج السكري','images/qa3.jpg'))
                ],),
              SizedBox(height:MediaQuery.of(context).size.width*0.08,) ,

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  TextButton(onPressed: (){

                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          yyyyye()));
                  },
                    child: division('اضافة علاج القلب','images/3d8.jpg'),),
                  TextButton(onPressed: (){

                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          ppostc()));
                  },
                      child:  division('اضافة علاج الرئتين ','images/3la.jpg')),

                ],),
              SizedBox(height:MediaQuery.of(context).size.width*0.08,) ,

              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(onPressed: (){

                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => fgfgh()));
                    },
                        child:  division(' اضافة علاج اعشاب','images/nww.jpg')),
                    TextButton(onPressed: (){

                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => ssscz()));

                    },
                        child:  division(' اضافة مستحظرات طبيه','images/m01.jpg')),
                  ]),
              SizedBox(height:MediaQuery.of(context).size.width*0.08,) ,

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(onPressed: (){

                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => rtsf()));
                  },
                      child:   division('اضافة علاج الاذن','images/v7.jpg')),
                  TextButton(onPressed: (){

                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          vvvd()));
                  },
                      child: division('اضافة علاج لاسنان ','images/4dg.jpg')),
                ],),


            ],
          )
        ]
    )  ),
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
                  builder: (context) => control()
              )
              );

            }
        )

    );
  }
  division(String text , String image){
    return  Padding(
        padding: const EdgeInsets.all(8),
        child:Container(
          height: 80,
          width:MediaQuery.of(context).size.width*0.4,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(4, 4),
                  blurRadius: 2,
                  spreadRadius: 1),
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(-4, -4),
                  blurRadius: 2,
                  spreadRadius: 1),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                    '$text',
                    style: TextStyle(
                        color: Colors.red.shade700,
                        fontSize: 16
                    ) ,
                    textAlign: TextAlign.end ,
                    maxLines: 2,
                  )
              ),
              Container(
                height:80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(15),
                  image:DecorationImage(
                    image:AssetImage(  '$image',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),


            ],),
        )
    );
  }
}

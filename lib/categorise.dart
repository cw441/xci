
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:katk/retan/towscreen.dart';
import 'package:katk/segery/towscreen.dart';
import 'package:katk/shib/towscreen.dart';
import 'package:katk/snan/towscreen.dart';
import 'package:katk/tgmal/towscreen.dart';
import 'package:katk/thn/towscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Sign_up/modle.dart';
import 'children/towscreen.dart';
import 'contro/controlpnal.dart';
import 'eyes/towscreen.dart';
import 'hur/towscreen.dart';
import 'klf/towscreen.dart';
import 'mainall.dart';

class sss extends StatefulWidget {

  sss({Key? key ,}) : super(key: key);

  @override
  State<sss> createState() => _sssState();
}

class _sssState extends State<sss> {

  late Future<List<PostSd>> futurePost;
bool isSg = true;
String a ="ff";
  String b ="11";

  @override
  void initState() {
    super.initState();
    futurePost = iitouostwe();
  }
savid(idd)async{
  SharedPreferences preferences =await SharedPreferences.getInstance();
  preferences.setString('idss',idd );
  print(preferences.getString('idss'));

}
  static const headers = {'Content-Type': 'application/json', 'Accept': 'application/json'};
  Future<List<PostSd>> iitouostwe() async {
    SharedPreferences preferences =await SharedPreferences.getInstance();
    final String? passored = preferences.getString('passored');
    final String? email = preferences.getString('email');
    final response =
    await http.get(
      Uri.parse( 'https://sddkakn.onrender.com/userr/getlogin/${isSg?email:a}/${isSg?passored:b}'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      print(response.body);
      final jsoon = json.decode(response.body);
      return  jsoon.map<PostSd>((json) => PostSd.fromJson(json)).toList();


    } else {
      throw Exception('Failed to load album');
    }
  }
  bool isdecstop(BuildContext context) =>MediaQuery.of(context).size.width >= 850;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: FutureBuilder<List<PostSd>>(
        future: futurePost,
        builder: (context, snapshot) {

          if (snapshot.hasData) {
            return RefreshIndicator(
                onRefresh:  (){
                  return Future.delayed(
                  Duration(seconds: 2),
                  (){
                    setState(() {

                      iitouostwe();
                    });
                  });
                },

                child:

              ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) =>
                  Container(

                      child: Column(
                          children: [


                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                              children: [
                                Padding(
                                    padding: const EdgeInsets.all(8),
                                    child:
                                    Container(
                                      height: 30,
                                      child:  Text('التصنيفات' ,
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
                                      savid("${snapshot.data![index].id}");
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) =>
                                              fscbo2()));
                                    },
                                      child:division('العناية بالعيون ','images/1z.jpg'),
                                    ),
                                    TextButton(onPressed: (){                                    savid("${snapshot.data![index].id}");

                                    Navigator.push(context, MaterialPageRoute(
                                          builder: (context) =>
                                              fscbo1()));
                                    },
                                      child:  division('العناية بالحوامل و الاطفال','images/df5.jpg')),


                                  ],),
                                SizedBox(height:MediaQuery.of(context).size.width*0.08,) ,

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                  children: [
                                    TextButton(onPressed: ()  {                                    savid("${snapshot.data![index].id}");

                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => fscbo3()));
                                    },
                                        child:  division('المستلزمات الطبية ','images/zzf.jpg')),
                                    TextButton(onPressed: (){                                    savid("${snapshot.data![index].id}");

                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => fscbo()));
                                    },
                                        child: division('علاجات السكري','images/qa3.jpg'))
                                  ],),
                                SizedBox(height:MediaQuery.of(context).size.width*0.08,) ,

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                  children: [
                                    TextButton(onPressed: (){                                    savid("${snapshot.data![index].id}");

                                    Navigator.push(context, MaterialPageRoute(
                                          builder: (context) =>
                                              fscbo5()));
                                    },
                                      child: division('علاجات مرضى القلب','images/3d8.jpg'),),
                                    TextButton(onPressed: (){                                    savid("${snapshot.data![index].id}");

                                    Navigator.push(context, MaterialPageRoute(
                                          builder: (context) =>
                                              fscbo4()));
                                    },
                                      child:  division('الرئتين و التنفس ','images/3la.jpg')),

                                  ],),
                                SizedBox(height:MediaQuery.of(context).size.width*0.08,) ,

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextButton(onPressed: (){                                    savid("${snapshot.data![index].id}");

                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => fscbo6()));
                                  },
                                      child:  division(' العلاج بالاعشاب','images/nww.jpg')),
                                    TextButton(onPressed: (){                                    savid("${snapshot.data![index].id}");

                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => fscbo8()));

                                  },
                                      child:  division('مستحظرات طبيه','images/m01.jpg')),
                                  ]),
                                SizedBox(height:MediaQuery.of(context).size.width*0.08,) ,

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextButton(onPressed: (){                                    savid("${snapshot.data![index].id}");

                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => fscbo9()));
                                    },
                                      child:   division('علاجات الاذن ','images/v7.jpg')),
                                           TextButton(onPressed: (){                                    savid("${snapshot.data![index].id}");

                                    Navigator.push(context, MaterialPageRoute(
                                          builder: (context) =>
                                              fscbo7()));
                                    },
                                        child: division('العناية الاسنان ','images/4dg.jpg')),
                                  ],),


                              ],
                            )
                          ]
                      )
                  ),
            )
            );
          }
           else {
            return Center(child: CircularProgressIndicator());
          }
        },

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
          width:isdecstop(context)? MediaQuery.of(context).size.width*0.3:MediaQuery.of(context).size.width*0.4,
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
                  child: AutoSizeText(
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
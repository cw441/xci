
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'package:http/http.dart' as http;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:katk/Sign_up/logi.dart';
import 'package:katk/retan/display_treatment.dart';
import 'package:katk/segery/display_treatment.dart';
import 'package:katk/shib/display_treatment.dart';
import 'package:katk/snan/display_treatment.dart';
import 'package:katk/tgmal/display_treatment.dart';
import 'package:katk/thn/display_treatment.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Sign_up/modle.dart';
import 'buy/databuy.dart';
import 'children/display_treatment.dart';
import 'comm/commnat.dart';
import 'comm/displaysendget.dart';
import 'eyes/display_treatment.dart';
import 'hur/display_treatment.dart';
import 'klf/display_treatment.dart';

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

                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                Center(
                                 child:Text(
                                    "\n${snapshot.data![index].name}",
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.red.shade700
                                    ),
                  )
                                  ),
                                  TextButton(onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) =>
                                            saw()));

                                    savid("${snapshot.data![index].id}");

                                  },
                                      child:  Container(
                                    height:50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      image:DecorationImage(
                                        image:AssetImage(  'images/rr5.jpg',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  )
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment:CrossAxisAlignment.end ,
                              children: [
                                Container(
                                  child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: TextFormField(
                                        textAlign:TextAlign.start,
                                        decoration: InputDecoration(

                                            suffixIcon: Icon(Icons.search ,
                                                color: Colors.red.shade700),
                                            hintText:'عماً تبحث',
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

                                      )
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(8),
                                    child:
                                    Container(
                                      height: 30,
                                      child:  Text('التصنيفات'' <' ,
                                        style: TextStyle(
                                          color: Colors.red.shade700,
                                          fontSize: 18,

                                        ),
                                        textAlign: TextAlign.end ,
                                      ),
                                    ) ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(onPressed: (){
                                      savid("${snapshot.data![index].id}");
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) =>
                                              eyes()));
                                    },
                                      child:division('العناية بالعيون ','images/1z.jpg'),
                                    ),
                                    TextButton(onPressed: (){                                    savid("${snapshot.data![index].id}");

                                    Navigator.push(context, MaterialPageRoute(
                                          builder: (context) =>
                                      chilld()));
                                    },
                                      child:  division('العناية بالحوامل و الاطفال','images/df5.jpg')),
                                    TextButton(onPressed: (){                                    savid("${snapshot.data![index].id}");

                                    Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => segery()));
                                    },
                                        child: division('علاجات السكري','images/qa3.jpg'))

                                  ],),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                  children: [
                                    TextButton(onPressed: (){                                    savid("${snapshot.data![index].id}");

                                    Navigator.push(context, MaterialPageRoute(
                                          builder: (context) =>
                                              klb()));
                                    },
                                      child: division('علاجات مرضى القلب','images/3d8.jpg'),),
                                    TextButton(onPressed: (){                                    savid("${snapshot.data![index].id}");

                                    Navigator.push(context, MaterialPageRoute(
                                          builder: (context) =>
                                              retan()));
                                    },
                                      child:  division('الرئتين و التنفس ','images/3la.jpg')),
                                    TextButton(onPressed: (){                                    savid("${snapshot.data![index].id}");

                                    Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => shib()));
                                    },
                                        child:  division(' العلاج بالاعشاب','images/nww.jpg'))
                                  ],),

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(onPressed: (){                                    savid("${snapshot.data![index].id}");

                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => thn()));
                                    },
                                      child:   division('علاجات الاذن ','images/v7.jpg')),
                                    TextButton(onPressed: (){                                    savid("${snapshot.data![index].id}");

                                    Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => tgmal()));

                                    },
                                      child:  division('مستحظرات طبيه','images/m01.jpg')),
                                    TextButton(onPressed: (){                                    savid("${snapshot.data![index].id}");

                                    Navigator.push(context, MaterialPageRoute(
                                          builder: (context) =>
                                              ssnan()));
                                    },
                                        child: division('العناية الاسنان ','images/4dg.jpg')),
                                  ],),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(onPressed: ()  {                                    savid("${snapshot.data![index].id}");

                                    Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => hur()));
                                      },
                                      child:  division('السمتلزمات الطبية ','images/zzf.jpg')),

                                  ],)

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

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),

        image:DecorationImage(
          image:AssetImage(  'images/3m7.jpg',
          ),
          fit: BoxFit.fill,
        ),
      ),
    ),
    onPressed:(){

        Navigator.push(context, MaterialPageRoute(
            builder: (context) => sdds()));

    }
      )
    );
  }
  division(String text , String image){
    return  Padding(
        padding: const EdgeInsets.all(8),
        child:Container(
          height: 80,
          width: MediaQuery.of(context).size.width*0.3,
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
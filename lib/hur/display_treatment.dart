import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:katk/eyes/secrren_details.dart';
import 'package:katk/hur/post_segery.dart';
import 'package:katk/hur/secrren_details.dart';
import 'package:katk/klf/post_segery.dart';
import 'package:katk/klf/secrren_details.dart';
import 'package:katk/retan/post_segery.dart';
import 'package:katk/retan/secrren_details.dart';
import 'package:katk/segery/model.dart';
import 'package:katk/eyes/post_segery.dart';
import 'package:katk/tgmal/post_segery.dart';
import 'package:katk/tgmal/secrren_details.dart';
import 'package:katk/thn/post_segery.dart';

import '../snan/secrren_details.dart';
import 'getdata.dart';
class hur extends StatefulWidget {
  const hur({Key? key}) : super(key: key);

  @override
  State<hur> createState() => _hurState();
}

class _hurState extends State<hur> {
  late Future<List<PostSd>> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = fetcaahPost();
  }
  bool isdecstop(BuildContext context) =>MediaQuery.of(context).size.width >= 850;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<List<PostSd>>(
        future: futurePost,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              clipBehavior: Clip.none,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: isdecstop(context)? 1:12,
                mainAxisSpacing:isdecstop(context)? 10:50,
                crossAxisCount:  isdecstop(context)? 3:2,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) =>Stack(children: [Container(
                   width:isdecstop(context)? MediaQuery.of(context).size.width*0.3:MediaQuery.of(context).size.width*0.4,
                   height: MediaQuery.of(context).size.height*0.35,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12.withOpacity(0.1),
                          offset: Offset(4, 4),
                          blurRadius: 2,
                          spreadRadius: 1),
                      BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4, -4),
                          blurRadius: 2,
                          spreadRadius: 1),
                    ],
                  ),
                  child: Column (
                    mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                      TextButton(
                          onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>xcxcb(
                            id:snapshot.data![index].id,

                            name:snapshot.data![index].name,
                              image:snapshot.data![index].image,
                              desc:snapshot.data![index].desc,
                              numberproduct:snapshot.data![index].numberproduct,
                              sizeproduct:snapshot.data![index].sizeproduct,
                              expar:snapshot.data![index].expar,
                            prase:snapshot.data![index].prase,
                            conutry:snapshot.data![index].conutry,



                            )
                         )
                        );
                                                },
                        child: ClipRRect(
                            borderRadius:BorderRadius.circular(15),
                            child: Image.memory(
                              base64Decode("${snapshot.data![index].image}"),
                              width:isdecstop(context)? MediaQuery.of(context).size.width*0.3:MediaQuery.of(context).size.width*0.4,
                              height: isdecstop(context)?MediaQuery.of(context).size.height*0.25 :MediaQuery.of(context).size.width*0.17,
                              fit: BoxFit.fill,
                            )
                          )
                        ),
                Row(children: [
                  TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>xcxcb(
                            id:snapshot.data![index].id,
                            name:snapshot.data![index].name,
                            image:snapshot.data![index].image,
                            desc:snapshot.data![index].desc,
                            numberproduct:snapshot.data![index].numberproduct,
                            sizeproduct:snapshot.data![index].sizeproduct,
                            expar:snapshot.data![index].expar,
                            prase:snapshot.data![index].prase,
                            conutry:snapshot.data![index].conutry,



                          )
                      )
                      );
                    },
                    child: Text(
                      'اقرأ الوصف',
                      textAlign:TextAlign.end,
                      style: TextStyle(
                          fontSize: isdecstop(context)? 18:14,
                          color: Colors.black54
                      ),
                    ),),
                  Spacer(),
                     Text(
                       "${snapshot.data![index].name} ".length>10?'...'+"${snapshot.data![index].name} ".substring(0,10):"${snapshot.data![index].name} ",
                          textAlign:TextAlign.start,
                          style: TextStyle(
                              fontSize:   isdecstop(context)? 18:14,
                              color: Colors.black54
                          ),
                        )]),
                        Center(
                          child:Text(
                          r"$" "${snapshot.data![index].prase}",
                          textAlign:TextAlign.center,
                          style: TextStyle(
                              fontSize:   isdecstop(context)? 18:14,
                              color: Colors.yellow.shade600
                          ),
                        ),
                       )
                      ]
                  )
                ),
              IconButton(onPressed: () {
                setState(() {
                  deleteAlbum("${snapshot.data![index].id}");
                });
              },
                alignment: Alignment.bottomRight,

                icon: Icon(Icons.delete,
                  color: Colors.red.shade700,
                ),
              ),

               ],
               )

            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
   //    floatingActionButton: FloatingActionButton(
   //        elevation: 10,

   //        child:Container(
   //         height: 100,
   //         width: 100,
   //         child: Icon(Icons.add,
   //         size: 30,
   //         color: Colors.red.shade700,),
   //          decoration: BoxDecoration(
   //              borderRadius: BorderRadius.circular(100),

   //              color: Colors.white
   //          ),
   //        ),

   //        onPressed:(){

   //          Navigator.push(context, MaterialPageRoute(
   //              builder: (context) => ffffds()));

   //        }
   //    )
    )
    ;
  }
  Future<List<PostSd>> deleteAlbum( id) async {
    final http.Response response = await http.delete(
      Uri.parse('https://sddkakn.onrender.com/user1/delet8/$id'),
      headers:{
        'Content-Type':'application/json',
        'Accept': 'application/json'
      },
    );
    if (response.statusCode == 200) {
      return postSdFromJson(jsonDecode(response.body));

    }
    else {
      throw Exception('Failed to delete album.');
    }
  }

}

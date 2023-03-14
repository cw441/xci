import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:katk/segery/model.dart';
import 'package:katk/eyes/post_segery.dart';
import 'package:katk/segery/secrren_details.dart';

import 'getdata.dart';
class segery extends StatefulWidget {
  const segery({Key? key}) : super(key: key);

  @override
  State<segery> createState() => _segeryState();
}

class _segeryState extends State<segery> {
  late Future<List<PostSd>> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = fetcaahPost();
  }
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
                crossAxisSpacing: 12,
                mainAxisSpacing: 1,
                crossAxisCount: 3,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) =>Padding(
               padding: const EdgeInsets.all(2),
               child:Stack(
                 children: [

                   Container(
                       width: MediaQuery.of(context).size.width*0.33,
                       height: MediaQuery.of(context).size.height*0.36,
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
                    mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                      TextButton(
                          onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>screenIn1(
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
                              width: MediaQuery.of(context).size.width*0.33,
                              height: MediaQuery.of(context).size.height*0.25,
                              fit: BoxFit.fill,
                            )
                          )
                        ),
                     Row(children: [
                       TextButton(
                         onPressed: (){
                           Navigator.push(context, MaterialPageRoute(
                               builder: (context) =>screenIn1(
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
                               fontSize: 20.0,
                               color: Colors.black54
                           ),
                         ),),
                       Spacer(),
                     Text(
                       "${snapshot.data![index].name} ",
                          textAlign:TextAlign.end,
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black54
                          ),
                        ),


                     ],
                     ),
                        Center(
                          child:Text(
                          r"$" "${snapshot.data![index].prase}",
                          textAlign:TextAlign.center,
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.yellow.shade600
                          ),
                        ),
                       )
                      ]
                  )
                ),


               ],
               )
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
  //              builder: (context) => posted()));

  //        }
  //    )
    );
  }
  Future<List<PostSd>> deleteAlbum( id) async {
    final http.Response response = await http.delete(
      Uri.parse('https://sddkakn.onrender.com/userr/delet/$id'),
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

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:telegram/telegram.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

import '../mainall.dart';
import 'comm/displaysendget.dart';
class sddsc extends StatefulWidget {
  const sddsc({Key? key}) : super(key: key);

  @override
  State<sddsc> createState() => _sddscState();
}

class _sddscState extends State<sddsc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text('معلومات عنا',

          style: TextStyle(
            color: Colors.red.shade700,
          ),
        ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,),
        body:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Center(child:
              Padding(
                padding: const EdgeInsets.all(10),
                child:
                Container(
                  height: MediaQuery.of(context).size.width*0.25,
                  width: MediaQuery.of(context).size.width*0.6,
                  decoration: BoxDecoration(
                      image:DecorationImage(
                        image:AssetImage(  'images/22z.jpg',),
                        fit: BoxFit.fill,
                      ),)
                  ),),),
              Container(
                height: MediaQuery.of(context).size.height*0.1,
                width: MediaQuery.of(context).size.width*1,
               child: Padding(
                  padding: const EdgeInsets.all(5),
                  child:
                  Text('معلومات عنا ',
                    textAlign: TextAlign.end ,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),),              ),
              Container(

               child:
                  Text('مؤسسة سريعة النمو وديناميكيات متخصصة في استيراد وتوزيع وتسويق اللأدوية ومنتجات وأدوات الرعاية الطبية والصحية المتنوعة. نولي اهتمامًا خاصًا لمدى ملاءمة وموثوقية المعلومات المتعلقة بتوافر المنتجات الصيدلانية وأسعارها في نقاط البيع ذات الصلة.',
                    textAlign: TextAlign.end ,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,

                  ),),
              ),
              Container(

                child: Text('القيم الأساسية للشركة التي نلتزم بها: الإخلاص ، الدقة ، التفاعل ، ضمانات الجودة.',
                  textAlign: TextAlign.end ,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),),
              Container(
                height: MediaQuery.of(context).size.height*0.1,
                width: MediaQuery.of(context).size.width*1,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child:
                  Text('تخزين الادوية  ',
                    textAlign: TextAlign.end ,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),),              ),
              Container(

                child: Text('تخزين الأدوية في مستودعاتنا المرخصة. وفقًا للقواعد واللوائح الصحية لنقابة الصيدلانين في العراق  ، يتم التقسيم إلى مناطق (منطقة القبول ، وأخذ العينات ، وتخزين الحجر الصحي ، ومنطقة التخزين) ، ويتم الحفاظ على درجة الحرارة ورطوبة الهواء اعتمادًا على نوع المنتج الطبي.',
                    textAlign: TextAlign.end ,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.1,
                width: MediaQuery.of(context).size.width*1,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child:
                  Text('طموحنا ',
                    textAlign: TextAlign.end ,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),),              ),
              Container(

                  child: Text('نسعى جاهدين لمنحك كعميل صحة أفضل ورفاهية أكبر. نحن نعتبر أن مهمتنا هي مرافقتك على الطريق وجعل رحلتك جيدة قدر الإمكان. لكن ما يجعلك تشعر بالرضا',
                    textAlign: TextAlign.end ,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),),
              Container(
            color:Colors.grey[700] ,
                height: MediaQuery.of(context).size.height*0.5,
                width: MediaQuery.of(context).size.width*1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,

                  children: [
                  Text('اتصل بنا ',
                  textAlign: TextAlign.end ,
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 30,
                  )),
                TextButton(onPressed: (){
                  FlutterPhoneDirectCaller.callNumber('07802403955');

                },
                  child: Row(children: [
                    Icon(Icons.call,
                      color: Colors.red.shade700,
                    ),
                  Text('07802403955 ',
                    textAlign: TextAlign.end ,
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 20,
                    ),)
                  ],)
                  ,),

                   TextButton(onPressed: ()async{

                     final link = WhatsAppUnilink(
                       phoneNumber: '07802403955',
                       text: "Hey! I'm inquiring about the apartment listing",
                     );
                     await launchUrlString('$link');
                   },
                     child: Row(children: [
                       Icon(Icons.chat_bubble,
                         color: Colors.green,
                       ),
                       Text('واتساب',
                         textAlign: TextAlign.end ,
                         style: TextStyle(
                           color: Colors.grey[300],
                           fontSize: 20,
                         ),)

                     ],)),
                   TextButton(onPressed: (){
                     Telegram.send(
                         username:'mohmod457',
                         message:'Thanks for building Telegram Package :)'
                     );
                   },
                       child: Row(children: [
                         Icon(Icons.telegram,
                           color: Colors.blueAccent,
                         ),
                         Text('التلكرام',
                           textAlign: TextAlign.end ,
                           style: TextStyle(
                             color: Colors.grey[300],
                             fontSize: 20,
                           ),)

                       ],)),

                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => sdds()));
                    },
                        child: Row(children: [
                          Icon(Icons.chat,
                            color: Colors.red.shade700,
                          ),
                          Text('التواصل على الموقع',
                            textAlign: TextAlign.end ,
                            style: TextStyle(
                              color: Colors.grey[300],
                              fontSize: 20,
                            ),)

                        ],)),
                 SizedBox(     height: 10,),
                 Center(child:
                  Text('جميع حقوق النشر محفوظة لسنة 2023 ',
                  textAlign: TextAlign.end ,
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 16,
                  ),),),

                 ],
                ),
                ),
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
                  builder: (context) => ssse()));

            }
        )
    );
  }
}

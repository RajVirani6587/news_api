import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';

class news_apisecode extends StatefulWidget {
  const news_apisecode({Key? key}) : super(key: key);

  @override
  State<news_apisecode> createState() => _news_apisecodeState();
}

class _news_apisecodeState extends State<news_apisecode> {
  Api_Provider? apiproviderT;
  Api_Provider? apiproviderF;
  @override
  Widget build(BuildContext context) {
    apiproviderF = Provider.of<Api_Provider>(context, listen: false);
    apiproviderT = Provider.of<Api_Provider>(context, listen: true);
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Color(0xff363535),
        leading:IconButton(onPressed: (){
          Navigator.pop(context);
        },
         icon: Icon(Icons.arrow_back_outlined),),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Icon(Icons.favorite_border),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Icon(Icons.bookmark_outline),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Icon(Icons.share),
          ),
        ],
      ),
      body: Column(
         children: [

           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Container(margin: EdgeInsets.symmetric(vertical: 10),width: MediaQuery.of(context).size.width*0.9,child: Text("${apiproviderF!.Datapick!.title}",style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),)),
             ],
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               InkWell(onTap: (){},
                 child: ClipRRect(
                   borderRadius: BorderRadius.circular(20),
                   child: Container(
                     height: 350,
                     width: MediaQuery.of(context).size.width*0.9,
                     child: CachedNetworkImage(
                       fit: BoxFit.fill,
                       imageUrl: "${apiproviderF!.Datapick!.urlToImage}",
                       placeholder: (context,_)=>Image.asset("assets/image/pexels-cottonbro-3944454.jpg"),
                       errorWidget: (context,_,__)=>Image.asset("assets/image/pexels-cottonbro-3944454.jpg"),
                     ),
                   ),
                 ),
               ),
             ],
           ),
         ],
      ),
    ));
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_api/provider/provider.dart';
import 'package:provider/provider.dart';

import '../model/ApiNews.dart';

class newsApi_FirstScreen extends StatefulWidget {
  const newsApi_FirstScreen({Key? key}) : super(key: key);

  @override
  State<newsApi_FirstScreen> createState() => _newsApi_FirstScreenState();
}

class _newsApi_FirstScreenState extends State<newsApi_FirstScreen> {

  final blue = const Color(0xff69695f);
  final backgroundLightFont = const Color(0xFF090909);



  Api_Provider? apiproviderT;
  Api_Provider? apiproviderF;

  @override
  Widget build(BuildContext context) {
    apiproviderF = Provider.of<Api_Provider>(context, listen: false);
    apiproviderT = Provider.of<Api_Provider>(context, listen: true);
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: 10,),
          SizedBox(
            height: 30,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Button("apple"),
                Button("Google"),
                Button("Microsoft"),
                Button("Facebook"),
                Button("YouTube"),
                Button("Whatsapp"),
                Button("Flutter"),
                Button("android "),
                Button("pub.dev"),
                Button("india"),
              ],
            ),
          ),
          SizedBox(height: 20,),

          Expanded(
            child: FutureBuilder<ApiNews>(
              future: apiproviderF!.Apifactory("${apiproviderT!.searchdata}"),//
              builder: (context, snapshot)
              {
                if (snapshot.hasError)
                {
                  return Text("${snapshot.error}");
                } else if (snapshot.hasData)
                {
                  ApiNews apimodel = snapshot.data!;
                  return ListView.builder(
                      itemCount: apimodel.articles!.length,
                      itemBuilder: (context, index)
                      {
                        return InkWell(onTap: (){
                           apiproviderF!.Datapick = apimodel.articles![index];
                           Navigator.pushNamed(context, 'secode');
                          },
                          child: Column(
                            children: [
                              SizedBox(height: 8,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Column(
                                    children: [
                                      Container(padding: EdgeInsets.symmetric(horizontal: 8),height: 77,width: MediaQuery.of(context).size.width*0.45,child: Text("${apimodel.articles![index].title}",style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white),)),
                                      Container(padding: EdgeInsets.symmetric(horizontal: 8),height: 77,width: MediaQuery.of(context).size.width*0.45,child: Text("${apimodel.articles![index].description}",style: TextStyle(color: Colors.white60),)),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CachedNetworkImage(
                                      height: 140,
                                      width: MediaQuery.of(context).size.width*0.45,
                                      fit: BoxFit.cover,
                                      imageUrl: "${apimodel.articles![index].urlToImage}",
                                      placeholder: (context,_)=>Image.asset("assets/image/pexels-cottonbro-3944454.jpg"),
                                      errorWidget: (context,_,__)=>Image.asset("assets/image/pexels-cottonbro-3944454.jpg"),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 40,)
                            ],
                          ),
                        );
                      },
                    );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    ));
  }

  Widget Button(String text)
  {
    return InkWell(onTap: (){
      apiproviderF!.changeData(text);
    },
      child: Container(
        height: 30,
        width: 80,
        margin: EdgeInsets.symmetric(horizontal: 5),
        alignment: Alignment.center,
        child: Text("$text",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: text == apiproviderF!.searchdata ? blue : backgroundLightFont,

        ),
      ),
    );
  }
}

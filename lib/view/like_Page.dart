import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_api/provider/provider.dart';
import 'package:provider/provider.dart';

class Like_Page extends StatefulWidget {
  const Like_Page({Key? key}) : super(key: key);

  @override
  State<Like_Page> createState() => _Like_PageState();
}

class _Like_PageState extends State<Like_Page> {
  Api_Provider?cartProviderT;
  Api_Provider?cartProviderF;
  @override
  Widget build(BuildContext context) {
    cartProviderF = Provider.of<Api_Provider>(context, listen: false);
    cartProviderT = Provider.of<Api_Provider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor:Color(0xff363535),
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon:Icon(Icons.arrow_back)),
          centerTitle: true,
          title: Text("Like"),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Hear is all posts that you liked",style: TextStyle(color: Colors.white),),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: cartProviderT!.cart.length,
                  itemBuilder:(context,index){
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(15),
                          height: 400,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xff363535),
                          ),
                          child: Column(
                            children: [
                            ClipRRect(
                              borderRadius:BorderRadius.circular(20),
                                child: CachedNetworkImage(
                                     height: 175,
                                     width: double.infinity,
                                      fit: BoxFit.cover,
                                      imageUrl: "${cartProviderT!.cart[index].urlToImage}",
                                           placeholder: (context, _) => Image.asset(
                                              "assets/image/pexels-markus-spiske-97050.jpg"),
                                           errorWidget: (context, _, __) =>
                                                 Image.asset(
                                                  "assets/image/pexels-markus-spiske-97050.jpg"),
                                     ),
                                  ),
                              SizedBox(height: 10,),
                              Container(margin: EdgeInsets.all(8),
                                  width: MediaQuery.of(context).size.width*0.9,
                                  child: Text("${cartProviderT!.cart[index].title}",style: TextStyle(color: Colors.white),)),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
             ),
          ],
        ),
      ),
    );
  }
}

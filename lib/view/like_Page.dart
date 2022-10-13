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
        appBar: AppBar(
          title: Text("Like"),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Hear is all posts that you liked"),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: cartProviderF!.cart.length,
                  itemBuilder:(context,index){
                    return Column(
                      children: [
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

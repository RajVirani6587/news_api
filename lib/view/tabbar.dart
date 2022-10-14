
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_api/model/ApiNews.dart';
import 'package:news_api/provider/provider.dart';
import 'package:provider/provider.dart';

import 'firstscreen.dart';

class api_tabbar extends StatefulWidget {
  const api_tabbar({Key? key}) : super(key: key);

  @override
  State<api_tabbar> createState() => _api_tabbarState();
}

class _api_tabbarState extends State<api_tabbar> {
  ApiNews?apimodel;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
          length: 9, // length of tabs
           child: SafeArea(
             child: Scaffold(
               backgroundColor: Colors.black,
               appBar:AppBar(
                 backgroundColor: Color(0xff363535),
                 centerTitle: false,
                 title: Text("Daily 24/7 News"),
                 actions: [
                   PopupMenuButton(itemBuilder: (context){
                     return [
                       PopupMenuItem(child: InkWell(onTap: (){
                         Navigator.pushNamed(context,'like');
                       },child: Text("Like"))),

                       PopupMenuItem(child: InkWell(onTap: (){
                         Navigator.pushNamed(context,'save');
                       },child: Text("Save"))),

                      ];
                    },icon: Icon(Icons.more_vert),
                    ),

                 ],
                 bottom:TabBar(
                   isScrollable: true,
                   indicatorWeight: 3,
                   indicatorColor: Colors.white,
                   labelColor: Colors.white,
                   unselectedLabelColor: Colors.white54,
                   indicatorSize: TabBarIndicatorSize.tab,
                   labelStyle: TextStyle(
                       fontWeight: FontWeight.bold, fontSize: 16.0),
                   tabs: [
                     Tab(text: "TOP NEWS"),
                     Tab(text: "INDIA"),
                     Tab(text: "HEALTH"),
                     Tab(text: "BUSINESS"),
                     Tab(text: "ENTERTALNMENT"),
                     Tab(text: "SCIENCE"),
                     Tab(text: "SPORTS"),
                     Tab(text: "TECHNOLOGY"),
                     Tab(text: "ORIGINAL"),
                   ],
                 ),

               ),
              body: TabBarView(
                  children: [
                    newsApi_FirstScreen(),
                    newsApi_FirstScreen(),
                    newsApi_FirstScreen(),
                    newsApi_FirstScreen(),
                    newsApi_FirstScreen(),
                    newsApi_FirstScreen(),
                    newsApi_FirstScreen(),
                    newsApi_FirstScreen(),
                    newsApi_FirstScreen(),
                  ],
                ),
              ),

          ),
        );


  }
}
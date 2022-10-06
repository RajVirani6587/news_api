
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'firstscreen.dart';

class api_tabbar extends StatefulWidget {
  const api_tabbar({Key? key}) : super(key: key);

  @override
  State<api_tabbar> createState() => _api_tabbarState();
}

class _api_tabbarState extends State<api_tabbar> {

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
                   Icon(Icons.more_vert)
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
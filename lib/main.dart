
import 'package:flutter/material.dart';
import 'package:news_api/provider/newsbottomprovider.dart';
import 'package:news_api/provider/provider.dart';
import 'package:news_api/view/bottombar.dart';
import 'package:news_api/view/firstscreen.dart';
import 'package:news_api/view/tabbar.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
      MultiProvider(
        providers: [
          ListenableProvider<Api_Provider>(create: (context)=>Api_Provider()),
          ListenableProvider<bootam_Provider>(create: (context)=>bootam_Provider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: 'shop',
          routes: {
            '/':(context)=>bottomber_Screen(),
            'tab':(context)=>api_tabbar(),
            'shoptwo':(context)=>newsApi_FirstScreen(),
          },
        ),
      )
  );
}
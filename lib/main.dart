
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:news_api/provider/newsbottomprovider.dart';
import 'package:news_api/provider/provider.dart';
import 'package:news_api/view/bottombar.dart';
import 'package:news_api/view/firstscreen.dart';
import 'package:news_api/view/like_Page.dart';
import 'package:news_api/view/save_Page.dart';
import 'package:news_api/view/secnews_Screen.dart';
import 'package:news_api/view/tabbar.dart';
import 'package:news_api/view/webviewScreen.dart';
import 'package:provider/provider.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(
      MultiProvider(
        providers: [
          ListenableProvider<Api_Provider>(create: (context)=>Api_Provider()),
          ListenableProvider<bootam_Provider>(create: (context)=>bootam_Provider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/':(context)=>bottomber_Screen(),
            'tab':(context)=>api_tabbar(),
            'shoptwo':(context)=>newsApi_FirstScreen(),
            'secode':(context)=>news_apisecode(),
            'web':(context)=>WebView_Screen(),
            'like':(context)=>Like_Page(),
            'save':(context)=>Save_Page(),
          },
        ),
      )
  );
}
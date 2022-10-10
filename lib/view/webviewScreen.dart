import 'package:flutter/material.dart';
import 'package:news_api/provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView_Screen extends StatefulWidget {
  const WebView_Screen({Key? key}) : super(key: key);

  @override
  State<WebView_Screen> createState() => _WebView_ScreenState();
}

class _WebView_ScreenState extends State<WebView_Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: WebView(
        initialUrl: ("${Provider.of<Api_Provider>(context).Datapick!.url}"),
      ),
    ));
  }
}

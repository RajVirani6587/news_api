import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/ApiNews.dart';



class Api_Provider extends ChangeNotifier {

  Articles? Datapick;
  String newslike = "https://newsapi.org/v2/everything?q=Apple&from=${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}&sortBy=publishedAt&apiKey=870ee857647b4b2083a6d45768f26d3a";

  Future<ApiNews> Apifactory() async {
    var newsString = await http.get(Uri.parse(newslike));
    var newsjson = jsonDecode(newsString.body);
    return  ApiNews.fromJson(newsjson);
  }
}
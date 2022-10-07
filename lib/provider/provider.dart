import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/ApiNews.dart';



class Api_Provider extends ChangeNotifier {

  ApiNews? Datapick;
  String newslike = "https://newsapi.org/v2/everything?q=tesla&from=2022-09-06&sortBy=publishedAt&apiKey=870ee857647b4b2083a6d45768f26d3a";

  Future<ApiNews> Apifactory() async {
    var newsString = await http.get(Uri.parse(newslike));
    var newsjson = jsonDecode(newsString.body);
    return  ApiNews.fromJson(newsjson);
  }
}
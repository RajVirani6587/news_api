import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/ApiNews.dart';



class Api_Provider extends ChangeNotifier {

  Articles? Datapick;
  String searchdata ="news";

  List<Articles>cart = [];


  void  remove(int index) {
    cart.removeAt(index);
    notifyListeners();
  }

  void changeData(String newdata)
   {
     searchdata =newdata;
     notifyListeners();
   }

  Future<ApiNews> Apifactory(String data) async {
    String newslike = "https://newsapi.org/v2/everything?q=$data&from=${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}&sortBy=publishedAt&apiKey=27d78a2672154d95bb90dfca50447eac";
    var newsString = await http.get(Uri.parse(newslike));
    var newsjson = jsonDecode(newsString.body);
    return  ApiNews.fromJson(newsjson);
  }
}
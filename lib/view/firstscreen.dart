import 'package:flutter/material.dart';
import 'package:news_api/model/api_news.dart';
import 'package:news_api/provider/provider.dart';
import 'package:provider/provider.dart';

class newsApi_FirstScreen extends StatefulWidget {
  const newsApi_FirstScreen({Key? key}) : super(key: key);

  @override
  State<newsApi_FirstScreen> createState() => _newsApi_FirstScreenState();
}

class _newsApi_FirstScreenState extends State<newsApi_FirstScreen> {
  Api_Provider? apiproviderT;
  Api_Provider? apiproviderF;
  @override
  Widget build(BuildContext context) {
    apiproviderF = Provider.of<Api_Provider>(context,listen: false);
    apiproviderT = Provider.of<Api_Provider>(context,listen: true);
    return SafeArea(child: Scaffold(
      body: FutureBuilder<ApiNews>(
        future:apiproviderF!.Apifactory(),
        builder: (context,snapshot){
          if(snapshot.hasError)
            {
              return Text("${snapshot.error}");
            }
          else if(snapshot.hasData)
            {
              ApiNews apimodel = snapshot.data!;
              return ListView.builder(itemCount: apimodel.articles!.length,
                  itemBuilder: (context,index){
                return ListTile();
                  }
                  );

            }
          return Center(child: CircularProgressIndicator());
        },
      ),
    ));
  }
}

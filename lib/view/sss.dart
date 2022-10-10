
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key:
  key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  final orange = const Color(0xffff6b00);
  final backgroundLightFont = const Color(0xFFEEEEEE);
  double width=0, height=0;
  int gst = 3;

  double price = 0, finalPrice = 0;
  String priStr = "0";

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width ;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: backgroundLightFont,
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

                  children: [
                    Text("ORIGINAL PRICE"),
                    Text("$priStr Rs."),
                  ],
                ),
              ),
              Container(
                color: backgroundLightFont,
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text("GST"),
                    Row(
                      mainAxisAlignment:

                      MainAxisAlignment.spaceEvenly,
                      children: [
                        gstSelector(3),
                        gstSelector(5),
                        gstSelector(12),
                        gstSelector(18),
                        gstSelector(28),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                color: backgroundLightFont,
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("FINAL PRICE PRICE"),
                    Text("$finalPrice Rs."),
                  ],
                ),
              ),
              Container(
                color: backgroundLightFont,
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: const [
                    Text("CGST/SGST"),
                    Text("00"),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(

                    mainAxisAlignment:

                    MainAxisAlignment.spaceEvenly,
                    children: [
                      button("7"),
                      button("4"),
                      button("1"),
                      button("00"),
                    ],
                  ),
                  Column(
                    mainAxisAlignment:

                    MainAxisAlignment.spaceEvenly,
                    children: [
                      button("8"),
                      button("5"),
                      button("2"),
                      button("0"),
                    ],
                  ),
                  Column(
                    mainAxisAlignment:

                    MainAxisAlignment.spaceEvenly,
                    children: [
                      button("9"),
                      button("6"),
                      button("3"),
                      button("."),
                    ],
                  ),
                  Column(
                    mainAxisAlignment:

                    MainAxisAlignment.spaceEvenly,
                    children: [
                      button("AC"),
                      button("<="),
                    ],
                  ),
                ],
              )
            ],
          ),
        )
    );
  }


  Widget gstSelector(int n) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectGST(n);
        });
      },
      child: Container(
          padding: const EdgeInsets.only(left: 18, right: 18, top: 6, bottom: 6),

          color: n == gst ? orange : backgroundLightFont ,
          child: Text("$n%")
      ),
    );
  }


  Widget button(String buttonTxt) {
    return GestureDetector(
      onTap: () {
        setState(() {
          buttonTap(buttonTxt);
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          height: height/( spec(buttonTxt) ? 4 : 8 ) - 3,
          width: width/( spec(buttonTxt) ? 7 : 4 )
              - 3,
          color: spec(buttonTxt) ? orange : Colors.white,
          child: Center(
            child: Text(buttonTxt,
              style: const TextStyle(
                fontSize: 30,
              ),),
          ),
        ),
      ),
    );
  }
  bool spec(String txt) {
    return txt == "AC" || txt == "<=";
  }
  void selectGST(int n) {
    gst = n;
    calculate();
  }
  void buttonTap(String buttonTxt) {
    bool dotIn = false;
    switch (buttonTxt) {
      case "AC":
        priStr = "0";
        break;
      case "<=":
        priStr = priStr.length == 1 ? "0" :

        priStr.substring(0,priStr.length-1);

        break;
      case ".":

        for(int i=0; i<priStr.length; i++) {
          if(priStr[i] == ".") {
            dotIn = true;
            break;
          }
        }
        if (!dotIn) {
          priStr += buttonTxt;
        }
        break;
      default:
        if (priStr[0] == "0") {
          priStr = "";
        }
        priStr += buttonTxt;
    }
    calculate();
  }
  void calculate() {
    price = double.parse(priStr);
    finalPrice = price+(price*gst/100);
  }
}
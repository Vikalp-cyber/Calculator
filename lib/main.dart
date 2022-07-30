import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  int firstnum = 0;
  int secondnum = 0;
  String texttodisplay = "0";
  String res = "";
  String operatortoperform = "";
  void butnclicked(String butnval){
    if(butnval == "AC"){
      firstnum = 0;
      secondnum = 0;
      res = "";
      operatortoperform = "";
    }
    else if(butnval == "+" || butnval == "-" || butnval == "x" || butnval == "/"){
      firstnum = int.parse(texttodisplay);
      res = "";
      operatortoperform = butnval;
    }
    else if(butnval == "="){
      secondnum = int.parse(texttodisplay);
      if(operatortoperform == "+"){
        res = (firstnum + secondnum).toString();
      }
      if(operatortoperform == "-"){
        res = (firstnum - secondnum).toString();
      }
      if(operatortoperform == "x"){
        res = (firstnum * secondnum).toString();
      }
      if(operatortoperform == "/"){
        res = (firstnum / secondnum).toString();
      }
    }
    else{
      res = int.parse(texttodisplay+butnval).toString();
    }
    setState((){
      texttodisplay = res;
    });

  }




  Widget CustomButton(String butnval, Color butncolor){
    return  Expanded(
        child: RaisedButton(

          splashColor: Colors.black12,

          onPressed: (){
            butnclicked(butnval);
          },
          child: Text('$butnval',
            style: TextStyle(
                fontSize: 35,
                color: Colors.black
            ),),
          shape: CircleBorder(),
          color: butncolor,
          elevation: 3.0,

          padding: EdgeInsets.all(20),

        ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Calculator",

        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children:<Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20.0),
                alignment: Alignment.bottomRight,
                child: Text('$res',
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                CustomButton("9",Colors.white),
                CustomButton("8",Colors.white),
                CustomButton("7",Colors.white),
                CustomButton("+",Colors.orange)
              ],
            ),
            Row(
              children: <Widget>[
                CustomButton("6",Colors.white),
                CustomButton("5",Colors.white),
                CustomButton("4",Colors.white),
                CustomButton("-",Colors.orange)
              ],
            ),
            Row(
              children: <Widget>[
                CustomButton("3",Colors.white),
                CustomButton("2",Colors.white),
                CustomButton("1",Colors.white),
                CustomButton("x",Colors.orange)
              ],
            ),
            Row(
              children: <Widget>[
                CustomButton("AC",Colors.white),
                CustomButton("0",Colors.white),
                CustomButton("=",Colors.white),
                CustomButton("/",Colors.orange)
              ],
            )
          ],
        ),
      ),
    );
  }
}


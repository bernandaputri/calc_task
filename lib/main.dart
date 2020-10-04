import 'package:flutter/material.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Demo Calculator',
      debugShowCheckedModeBanner: false,
      home: new HalSatu(),
    );
  }
}

class HalSatu extends StatefulWidget {
  @override
  _HalSatuState createState() => new _HalSatuState();
}

class _HalSatuState extends State<HalSatu> {

  String hasil = "0";

  String _hasil = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText){

    if(buttonText == "C"){
      
      _hasil = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";

    } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "X"){

      num1 = double.parse(hasil);

      operand = buttonText;

      _hasil = "0";

    } else if(buttonText == "."){

      if(_hasil.contains(".")){
        print("Already conatains a decimals");
        return;

      } else {
        _hasil = _hasil + buttonText;
      }

    } else if (buttonText == "="){

      num2 = double.parse(hasil);

      if(operand == "+"){
        _hasil = (num1 + num2).toString();
      }
      if(operand == "-"){
        _hasil = (num1 - num2).toString();
      }
      if(operand == "X"){
        _hasil = (num1 * num2).toString();
      }
      if(operand == "/"){
        _hasil = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";

    } else {

      _hasil = _hasil + buttonText;

    }

    print(_hasil);

    setState(() {
      
      hasil = double.parse(_hasil).toStringAsFixed(2);

    });

  }
  
  Widget buildButton(String buttonText) {
    return new Expanded(
     child: Container(
       margin: EdgeInsets.all(10),
        child: SizedBox(
        width: 65,
        height: 65,
        child: new FlatButton(
          padding: new EdgeInsets.all(10.0),
          color: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0)
          ),
          textColor: Colors.white,
          child: new Text(buttonText,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            ),
          ),
          onPressed: () => 
            buttonPressed(buttonText),
      ),
      ),
     ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.grey[350],
        appBar: new AppBar(
          backgroundColor: Colors.black,
          title: new Text("Calculator"),
        ),
        body: new Container(
            child: new Column(
          children: <Widget>[
            new Container(
              alignment: Alignment.centerRight,
              padding: new EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 12.0
              ),
              child: new Text(
                hasil, 
                style: new TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
              ))),
            new Expanded(
              child: new Divider(),
            ),
            

            new Column(children: [
              new Row(children: [
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("/")
              ]),

              new Row(children: [
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("X")
              ]),

              new Row(children: [
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("-")
              ]),

              new Row(children: [
                buildButton("."),
                buildButton("0"),
                buildButton("C"),
                buildButton("+")
              ]),

              new Row(children: [
                buildButton("="),
              ])
            ])
          ],
        )));
  }
}
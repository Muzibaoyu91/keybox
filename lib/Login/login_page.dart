import 'package:flutter/material.dart';
import 'package:keybox/Common/background_view.dart';
import 'package:keybox/colors.dart';

class loginPage extends StatefulWidget {
  loginPage({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => loginPageState();
}

class loginPageState extends State<loginPage> {
  final TextEditingController _mainKeyCon = TextEditingController();
  
  Widget buildTextField(){
    return TextField(
      controller: _mainKeyCon,
      maxLines: 1,
      obscureText: true,
      style: TextStyle(fontSize: 20, color: Colors.black),
      decoration: InputDecoration(
          fillColor: background,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: new EdgeInsets.fromLTRB(20, 10, 20, 10)),
    );
  }

  @override
  void dispose() {
    _mainKeyCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextField _mainKeyTF = buildTextField();
    return Scaffold(
      appBar: null,
      body: BackgroundView(
        child:Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(30),
                child: _mainKeyTF,
              ),
            ],
          ),
        )
      ),
    );
  }
}

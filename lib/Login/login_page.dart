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

  Widget buildIconImg() {
    Image _icon = Image(
      image: AssetImage('assets/images/key_icon_5.png'),
      fit: BoxFit.cover,
    );

    // return Container(
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(40),
    //      boxShadow: [
    //       BoxShadow(color: Colors.blueGrey, offset: Offset(2, 4), blurRadius: 4)
    //     ]
    //   ),
    //   child:SizedBox(child: _icon,width: 80, height: 80,) ,
    // );

    Container _container = Container(
      constraints: BoxConstraints.expand(
        width: 80,
        height: 80,
      ),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.9),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: mainGreen ,width: 6),
        boxShadow: [
          BoxShadow(color: Colors.black54, offset: Offset(3, 3), blurRadius: 4)
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(50)
        ),
        child: SizedBox(
          width: 100,
          height: 100,
          child: _icon,
        ),
      ),
    );

    return _container;
  }

  Container buildTextField() {
    return Container(
      child: TextField(
        controller: _mainKeyCon,
        maxLines: 1,
        obscureText: true,
        style: TextStyle(fontSize: 20, color: Colors.black),
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            contentPadding: new EdgeInsets.fromLTRB(20, 10, 20, 10)),
      ),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
        BoxShadow(color: Colors.black38, offset: Offset(3, 3), blurRadius: 4)
      ]),
    );
  }

  InkWell buildSubmitBtn() {
    Widget _btn = Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: RadialGradient(
            colors: [mainYellow, Colors.orange[300]],
            center: Alignment.topLeft,
            radius: 4),
        boxShadow: [
          BoxShadow(color: Colors.black38, offset: Offset(3, 3), blurRadius: 4)
        ],
      ),
      alignment: Alignment.center,
      child: Text('登 录', style: TextStyle(color: Colors.white, fontSize: 18)),
    );

    return InkWell(
      onTap: () {
        print('点击了登录');
      },
      child: _btn,
    );
  }

  @override
  void dispose() {
    _mainKeyCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Widget _iconImg = buildIconImg();
    final Container _mainKeyTF = buildTextField();
    final InkWell _submitBtn = buildSubmitBtn();
    return Scaffold(
      appBar: null,
      body: BackgroundView(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 80),
              child: _iconImg,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 20, 30, 25),
              child: _mainKeyTF,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 80),
              child: _submitBtn,
            )
          ],
        ),
      )),
    );
  }
}

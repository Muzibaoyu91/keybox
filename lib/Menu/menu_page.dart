import 'package:keybox/colors.dart';
import 'package:flutter/material.dart';
import 'package:keybox/Common/background_view.dart';
import 'package:keybox/Common/collapsible.dart';
import 'package:keybox/bloc_provider.dart';
import 'package:keybox/Common/keyModel.dart';

class MainMenuPage extends StatefulWidget {
  MainMenuPage({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  bool _isSearching = false; //是否在搜索

  Future<bool> _popSearch() {
    if (_isSearching) {
      return Future(() => false);
    } else {
      Navigator.of(context).pop(true);
      return Future(() => true);
    }
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> tail = [];

    List<KeyModel> _dataSource = [];

    if(_isSearching){

    }else{
    }

    return Scaffold(
      appBar: null,
      body: BackgroundView(
        child:SingleChildScrollView(
          padding:
                    EdgeInsets.only(top: 30.0, left: 20, right: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Collapsible(
                isCollapsed: _isSearching,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "钥匙盒子",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: darkText.withOpacity(darkText.opacity * 0.75),
                          fontSize: 34,
                          fontFamily: "RobotoMedium"),
                    ),
                    Text(
                      'DataSource = $_dataSource'
                    ),
                    RaisedButton(
                      child: Text('click'),
                      onPressed: (){
                        print('点击了');
                        setState(() {
                          KeyModel model = KeyModel()..userName = 'Baoy';
                          _dataSource.add(model);
                        });
                      },
                    )
                  ],
                ),
              )
            ],
          )
        )
      ),
    );
  }
}

import 'package:keybox/colors.dart';
import 'package:flutter/material.dart';
import 'package:keybox/Common/background_view.dart';

class MainMenuPage extends StatefulWidget{
  MainMenuPage({Key key}) : super(key:key);
  @override
    State<StatefulWidget> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  bool _isSearching = false;//是否在搜索

  Future<bool> _popSearch(){
    if(_isSearching){
      return Future(() => false);
    }else{
      Navigator.of(context).pop(true);
      return Future(() => true);
    }
  }

  @override
    Widget build(BuildContext context) {
      return WillPopScope(
        onWillPop: _popSearch,
        child: BackgroundView(
          // child: Text('Hello!'),
        ),
      );
    }
}
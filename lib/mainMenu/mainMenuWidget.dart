import 'package:keybox/colors.dart';
import 'package:flutter/material.dart';

class MainMenuWidget extends StatefulWidget{
  MainMenuWidget({Key key}) : super(key:key);
  @override
    State<StatefulWidget> createState() => _MainMenuWidgetState();
}

class _MainMenuWidgetState extends State<MainMenuWidget> {
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
        child: Container(
        ),
      );
    }
}
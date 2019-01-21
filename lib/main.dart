import 'package:flutter/material.dart';
import 'package:keybox/coreData.dart';
import 'package:keybox/colors.dart';
import 'package:keybox/mainMenu/mainMenuWidget.dart';

class MyApp extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      return CoreDataWidget(
        child: MaterialApp(
          title: 'K-Box',
          theme: ThemeData(
            backgroundColor: background,scaffoldBackgroundColor: background),
            home: MenuPage(),
        ),
      );
    }
}

class MenuPage extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      return Scaffold(appBar: null, body: MainMenuWidget());
    }
}

void main() => runApp(MyApp());
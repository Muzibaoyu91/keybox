import 'package:flutter/material.dart';
import 'package:keybox/colors.dart';
import 'package:keybox/bloc_provider.dart';
import 'package:keybox/Menu/menu_page.dart';
import 'package:keybox/Login/login_page.dart';

class MyApp extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      return BlocProvider(
        child: MaterialApp(
          title: 'K-Box',
          theme: ThemeData(
            primaryColor: Colors.amber,
            backgroundColor: background,
            scaffoldBackgroundColor: background,
            ),
            home: loginPage(),
        ),
      );
    }
}

void main() => runApp(MyApp());
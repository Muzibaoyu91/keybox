import 'package:flutter/widgets.dart';

class BlocProvider extends InheritedWidget{
  BlocProvider({
    this.mainKeyList,
    Widget child
  }):super(child : child);

  List mainKeyList = [];

  //定义一个便捷方法，方便子树中的widget获取共享数据  
  static BlocProvider of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(BlocProvider);
  }

  //该回调决定当mainKeyList发生变化时，是否通知子树中依赖mainKeyList的Widget  
  @override
  bool updateShouldNotify(BlocProvider old) {
    //如果返回false，则子树中依赖(build函数中有调用)本widget
    //的子widget的`state.didChangeDependencies`会被调用
    return old.mainKeyList != mainKeyList;
  }
}
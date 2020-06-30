import 'package:flutter/material.dart';

import 'login_bloc.dart';

class Provider extends InheritedWidget {

  static Provider _instance;

  factory Provider({Key key, Widget child}){
    
    if(_instance == null){
      _instance = new Provider._(key: key , child: child);
    }
    return _instance;
  }

  final loginBloc = LoginBloc();

  Provider._({Key key, Widget child})
      :super(key:key,child:child);
  // Provider({Key key, Widget child})
  //   :super(key:key,child:child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of (BuildContext context ){
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }


}
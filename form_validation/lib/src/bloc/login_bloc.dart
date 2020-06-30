import 'dart:async';

import 'package:form_validation/src/bloc/validators.dart';

class LoginBloc with Validators{

  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  //Obtener datos del stream
  Stream<String> get emailStream => _emailController.stream.transform(emailValidator); 
  Stream<String> get passwordStream => _passwordController.stream.transform(passwordValidator); 


  //Insertar valores
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  dispose(){
    _emailController?.close();
    _passwordController?.close();
  }

}

// tream<bool> get formValidStream =>
//        Rx.combineLatest2(emailStream, passwStream, (e, p) => true);
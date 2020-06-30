import 'dart:async';

import 'package:form_validation/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators{

  //Si queremos trabajar con Rxdart no podemos usar StreamController, ya que no los reconoce
  //para eso usamos BehaviorSubject
  // final _emailController = StreamController<String>.broadcast();
  // final _passwordController = StreamController<String>.broadcast();


  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  
  

  //Obtener datos del stream
  Stream<String> get emailStream => _emailController.stream.transform(emailValidator); 
  Stream<String> get passwordStream => _passwordController.stream.transform(passwordValidator); 

  Stream<bool> get formValidEmail => 
    Rx.combineLatest2(emailStream, passwordStream, (a, b) => true);


  //Insertar valores
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;


  //Obtener ultimo valor ingresado a los streams 
  String get email => _emailController.value;
  String get password => _passwordController.value;

  dispose(){
    _emailController?.close();
    _passwordController?.close();
  }

}

// tream<bool> get formValidStream =>
//        Rx.combineLatest2(emailStream, passwStream, (e, p) => true);
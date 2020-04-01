import 'dart:async';
import 'package:petanic/src/validators/login_validator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:petanic/src/resources/auth_repository.dart';
import 'package:petanic/src/models/auth_response.dart';

class AuthBloc extends Object with Validators {
  final _repository = Repository();
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final PublishSubject<LoginState> _loginStateSubject = new PublishSubject();
  // Add data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid =>
      Rx.combineLatest2(email, password, (e, p) => true);
  Stream<LoginState> get loginStateStream => _loginStateSubject.stream;

  // Change Data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;
  void changeLoginState({LoginState state}) =>
      _loginStateSubject.sink.add(state);

  submit() {
    final validEmail = _email.value;
    final validPassword = _password.value;

    print('Email is $validEmail');
    print('Password is $validPassword');
    login(validEmail, validPassword);
  }

  login(email, password) async {
    //changeLoginState(state: LoginState( status: LoginStatus.LOGGING, message: "logging") );

    var response = await _repository.login(email, password);
    print(response);
    if (response == true) {
      changeLoginState(
          state: LoginState(
              status: LoginStatus.LOGIN_SUCCESS));
    }else{
       changeLoginState(
          state: LoginState(
              status: LoginStatus.LOGIN_ERROR));
    }
  }

  dispose() {
    _email.close();
    _password.close();
    _loginStateSubject.close();
  }
}

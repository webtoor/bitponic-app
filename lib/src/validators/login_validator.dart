/* class Validation {

  String validatePassword(String value) { 
    if (value.length < 4) { 
      return 'Password minimal 4 karakter'; 
    }
    return null; 
  }

  String validateEmail(String value) {
    if (!value.contains('@')) { 
      return 'Format email tidak valid'; 
    }
    return null;
  }
} */

import 'dart:async';

class Validators {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
      sink.add(email);
    } else {
      sink.addError('Format email tidak valid');
    }
  });

  final validatePassword =
      StreamTransformer<String, String>.fromHandlers(handleData: (password, sink) {
    if (password.length > 3) {
      sink.add(password);
    } else {
      sink.addError('Password minimal 4 karakter');
    }
  });
}

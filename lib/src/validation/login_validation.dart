class Validation {

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
}

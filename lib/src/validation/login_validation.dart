class Validation {

  String validatePassword(String value) { 
    if (value.length < 4) { 
      return 'Password Minimal 4 Karakter'; 
    }
    return null; 
  }

  String validateEmail(String value) {
    if (!value.contains('@')) { 
      return 'Email tidak valid'; 
    }
    return null;
  }
}

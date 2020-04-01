/// NON_LOGIN: means that login is not happening
/// LOGGIN: means that login is happening
/// LOGIN_ERROR: means that something is wrong with login
/// LOGIN_SUCCESS: the login process was a success.
enum LoginStatus { NON_LOGIN, LOGGING, LOGIN_SUCCESS, LOGIN_ERROR }

class LoginState {
  final LoginStatus status;
  final String message;

  LoginState({this.status, this.message});
}
import 'package:bitponic/src/resources/api_provider.dart';

class Repository{
  final apiProvider = ApiProvider();

  Future login(String email, password) => apiProvider.login(email, password);
}
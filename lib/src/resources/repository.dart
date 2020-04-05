import 'package:bitponic/src/resources/api_provider.dart';
import 'package:bitponic/src/models/user_project.dart';

class Repository{
  final apiProvider = ApiProvider();

  Future login(String email, password) => apiProvider.login(email, password);
  Future<List<UserProject>> fetchUserProject() => apiProvider.getUserProject();

}
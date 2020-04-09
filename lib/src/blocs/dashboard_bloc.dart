/* import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:bitponic/src/resources/repository.dart';
import 'package:bitponic/src/models/user_project.dart';

class DashboardBloc {
  final _repository = Repository();
  final _todoFetcher = PublishSubject<UserProject>();

  Stream<UserProject> get singleUserProject => _todoFetcher.stream;

 

  getUserProject() async {
  await _repository.fetchUserProject();

  }

   dispose() {
    _todoFetcher.close();
  }
}

 */
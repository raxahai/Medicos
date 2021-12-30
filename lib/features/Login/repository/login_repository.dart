import 'package:test_me/core/errors/exceptions.dart';
import 'package:test_me/features/Login/service/local_data_service.dart';

abstract class LoginRepository {
  Future<bool> login(String username);
}

class LoginRepositoryImpl implements LoginRepository {
  final LoginLocalDataService localDataSource;

  LoginRepositoryImpl({required this.localDataSource});
  @override
  Future<bool> login(String username) async {
    try {
      bool isStored = await localDataSource.cacheEmail(username);
      return isStored;
    } on CacheException {
      return false;
    }
  }
}

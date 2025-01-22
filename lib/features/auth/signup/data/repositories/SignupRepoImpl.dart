import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

import '../../../../../core/remote/internet_checker.dart';
import '../../domain/entities/SignupEntity.dart';
import '../../domain/repositories/signup_repo.dart';
import '../data_sources/signup_dao.dart';

@Injectable(as: SignupRepo)
class SignupRepoImpl extends SignupRepo {
  SignupDao signupDao;
  @factoryMethod
  SignupRepoImpl(this.signupDao);
  @override
  Future<Either<SignupEntity, String>> createAccount(
      {required String name,
      required String email,
      required String password,
      required String phone}) async {
    bool isConnected = await InternetChecker.checkNetwork();
    if (isConnected) {
      var result = await signupDao.createAccount(
          name: name, email: email, password: password, phone: phone);
      return result.fold(
        (signupResponse) {
          return left(signupResponse.toSignupEntity());
        },
        (error) {
          return Right(error);
        },
      );
    } else {
      return Right("No Internet conncection");
    }
  }
}

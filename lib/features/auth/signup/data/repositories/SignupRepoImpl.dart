import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/remote/internet_checker.dart';
import 'package:e_commerce/features/auth/signup/data/data_sources/signup_dao.dart';
import 'package:e_commerce/features/auth/signup/domain/entities/SignupEntity.dart';
import 'package:e_commerce/features/auth/signup/domain/repositories/signup_repo.dart';
import 'package:injectable/injectable.dart';

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

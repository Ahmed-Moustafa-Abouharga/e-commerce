import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/remote/internet_checker.dart';
import 'package:e_commerce/core/resources/strings_manager.dart';
import 'package:e_commerce/features/auth/signin/data/data_sources/signin_dao.dart';

import 'package:e_commerce/features/auth/signin/domain/repositories/signin_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../signup/domain/entities/SignupEntity.dart';
@Injectable(as: SigninRepo)
class SigninApiRepoImpl extends SigninRepo{
  SigninDao signinDao ;
  @factoryMethod
  SigninApiRepoImpl(this.signinDao) ;
  @override
  Future<Either<SignupEntity, String>> login({required String email, required String password})async {
    bool isConnected =await InternetChecker.checkNetwork();
    if(isConnected)
    {
      var result =  await signinDao.login(email: email, password: password) ;
      return result.fold((signinResponse) {
        return left(signinResponse.toSignupEntity()) ;
      }, (error)
      {
        return right(error) ;
      },) ;
    }
    else
      {
        return Right(StringsMangaer.noInternet) ;
      }

  }

}
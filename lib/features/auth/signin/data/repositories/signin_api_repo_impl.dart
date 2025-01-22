import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

import '../../../../../core/remote/internet_checker.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../signup/domain/entities/SignupEntity.dart';
import '../../domain/repositories/signin_repo.dart';
import '../data_sources/signin_dao.dart';
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
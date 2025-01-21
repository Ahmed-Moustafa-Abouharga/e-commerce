import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/remote/api_manager.dart';
import 'package:e_commerce/core/remote/endpoints.dart';
import 'package:e_commerce/features/auth/signup/data/data_sources/signup_dao.dart';
import 'package:e_commerce/features/auth/signup/data/models/SignupResponse.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignupDao)
class SignupDaoApiImpl extends SignupDao {
  ApiManager apiManager;
  @factoryMethod
  SignupDaoApiImpl(this.apiManager);
  @override
  Future<Either<SignupResponse, String>> createAccount(
      {required String name,
      required String email,
      required String password,
      required String phone}) async {
    // TODO: implement createAccount
    try{
      var response = await apiManager.postRequest(
        endPoint: Endpoints.signUpEndPoint,
        body: {
          "name": name,
          "email": email,
          "password": password,
          "rePassword": password,
          "phone": phone
        },
      );
      var signupResponse = SignupResponse.fromJson(response.data);
      if(signupResponse.statusMsg!=null)
        {
          return Right(signupResponse.message??"") ;
        }
      else{
        return left(signupResponse) ; 
      }
    }
    catch(error)
    {
      return Right(error.toString());
    }
  }
}

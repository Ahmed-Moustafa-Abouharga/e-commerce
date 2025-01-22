import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/auth/signin/data/data_sources/signin_dao.dart';


import 'package:injectable/injectable.dart';

import '../../../../../core/remote/api_manager.dart';
import '../../../../../core/remote/endpoints.dart';
import '../../../signup/data/models/SignupResponse.dart';
@Injectable(as: SigninDao)
class SigninApiDaoImpl extends SigninDao{
  ApiManager apiManager; 
  @factoryMethod
  SigninApiDaoImpl(this.apiManager) ; 
  @override
  Future<Either<SignupResponse, String>> login(
      {required String email, required String password})async {
   try {
      var response =
          await apiManager.postRequest(endPoint: Endpoints.signinEndPoint,body:{
            "email":email,
            "password" :password
          });
      var signinResponse = SignupResponse.fromJson(response.data) ;
      if(signinResponse.statusMsg !=null)
        {
          return Right(signinResponse.message!) ;
        }
      else {
        return left(signinResponse) ;
      }
    }
    catch(error)
    {
      return Right(error.toString()) ;
    }
  }
  
}
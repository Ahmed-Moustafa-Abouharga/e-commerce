import 'package:dartz/dartz.dart';

import '../../../signup/data/models/SignupResponse.dart';

abstract class SigninDao{
  Future<Either<SignupResponse,String>> login({required String email, required String password}) ;
}
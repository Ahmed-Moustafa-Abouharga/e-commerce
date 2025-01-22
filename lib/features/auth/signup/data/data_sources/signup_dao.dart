import 'package:dartz/dartz.dart';

import '../models/SignupResponse.dart';

abstract class SignupDao{
Future<Either<SignupResponse,String>>  createAccount({
  required  String name,
  required  String email,
  required  String password,
  required  String phone,
  }) ;

}
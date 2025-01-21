import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/auth/signup/data/models/SignupResponse.dart';

abstract class SignupDao{
Future<Either<SignupResponse,String>>  createAccount({
  required  String name,
  required  String email,
  required  String password,
  required  String phone,
  }) ;

}
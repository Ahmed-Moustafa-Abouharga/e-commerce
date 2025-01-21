import 'package:dartz/dartz.dart';


import '../../../signup/domain/entities/SignupEntity.dart';

abstract class SigninRepo{
  Future<Either<SignupEntity,String>> login({required String email, required String password}) ;
}
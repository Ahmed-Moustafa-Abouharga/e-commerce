import 'package:dartz/dartz.dart';

import '../entities/SignupEntity.dart';

abstract class SignupRepo {

  Future<Either<SignupEntity, String>> createAccount({
    required String name,
    required String email,
    required String password,
    required String phone,
  });
}

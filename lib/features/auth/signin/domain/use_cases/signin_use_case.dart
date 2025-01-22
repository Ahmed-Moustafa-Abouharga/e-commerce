import 'package:dartz/dartz.dart';


import 'package:injectable/injectable.dart';

import '../../../signup/domain/entities/SignupEntity.dart';
import '../repositories/signin_repo.dart';

@injectable
class SigninUseCase {
  SigninRepo signinRepo;
  @factoryMethod
  SigninUseCase(this.signinRepo);
  Future<Either<SignupEntity, String>> call({
    required String email,
    required String password,
  }) =>
      signinRepo.login(
        email: email,
        password: password,
      );
}

import 'package:dartz/dartz.dart';

import 'package:e_commerce/features/auth/signin/domain/repositories/signin_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../signup/domain/entities/SignupEntity.dart';

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

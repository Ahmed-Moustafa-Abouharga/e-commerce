import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/auth/signup/domain/entities/SignupEntity.dart';
import 'package:e_commerce/features/auth/signup/domain/repositories/signup_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignupUseCase {
  SignupRepo signupRepo;
  @factoryMethod
  SignupUseCase(this.signupRepo);
  Future<Either<SignupEntity, String>> call(
          {required String name,
          required String email,
          required String password,
          required String phone}) =>
      signupRepo.createAccount(
        name: name,
        email: email,
        password: password,
        phone: phone,
      );
}

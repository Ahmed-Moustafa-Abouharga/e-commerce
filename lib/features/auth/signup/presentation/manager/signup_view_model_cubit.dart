import 'package:bloc/bloc.dart';

import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/SignupEntity.dart';
import '../../domain/use_cases/signup_use_case.dart';

part 'signup_view_model_state.dart';

@injectable
class SignupViewModelCubit extends Cubit<SignupViewModelState> {
  SignupUseCase signupUseCase;
  @factoryMethod
  SignupViewModelCubit(this.signupUseCase) : super(SignupViewModelInitial());


  signUp({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    emit(LoadingState()) ;
    var result = await signupUseCase.call(
        name: name, email: email, password: password, phone: phone);
    result.fold(
      (signupEntity) {
        emit(SuccessState(signupEntity)) ;
      },
      (error) {
        emit(ErrorState(error)) ;
      },
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../signup/domain/entities/SignupEntity.dart';
import '../../domain/use_cases/signin_use_case.dart';

part 'signin_view_model_state.dart';
@injectable
class SigninViewModelCubit extends Cubit<SigninViewModelState> {
  @factoryMethod
  SigninViewModelCubit(this.singinUseCase) : super(SigninViewModelInitial());
  SigninUseCase singinUseCase;
  login({required String email, required String password})async
  {
    emit(LoadingState()) ;
 var result =   await singinUseCase.call(email: email, password: password) ;
 result.fold((signinEntity) {
   emit(SuccessState(signinEntity)) ;
 }, (error) {
   emit(ErrorState(error)) ;
 },) ;
  }
}

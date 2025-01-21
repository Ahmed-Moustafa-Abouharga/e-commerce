part of 'signin_view_model_cubit.dart';

@immutable
sealed class SigninViewModelState {}

final class SigninViewModelInitial extends SigninViewModelState {}
final class LoadingState extends SigninViewModelState {}
final class ErrorState extends SigninViewModelState {
   final String errorMsg;

  ErrorState(this.errorMsg);

}
final class SuccessState extends SigninViewModelState {
  SignupEntity signupEntity;
  SuccessState(this.signupEntity) ;
}

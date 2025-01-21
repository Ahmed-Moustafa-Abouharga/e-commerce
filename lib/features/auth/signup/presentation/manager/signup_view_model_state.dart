part of 'signup_view_model_cubit.dart';

@immutable
sealed class SignupViewModelState {}

final class SignupViewModelInitial extends SignupViewModelState {}

class LoadingState extends SignupViewModelState{}
class SuccessState extends SignupViewModelState{
  final SignupEntity signupEntity ;
  SuccessState(this.signupEntity) ;
}
class ErrorState extends SignupViewModelState{
  final String error;
  ErrorState(this.error) ;
}

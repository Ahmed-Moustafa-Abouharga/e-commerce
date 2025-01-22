
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/DI/di.dart';
import '../../../../../core/cache/shared_prefs_handler.dart';
import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/constants_manager.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../../../core/resources/validator.dart';
import '../../../../../core/routes_manager/routes.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../../core/widgets/custom_input.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../manager/signin_view_model_cubit.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }
@override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<SigninViewModelCubit>(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        REdgeInsets.symmetric(horizontal: 96, vertical: 88),
                    child: Image.asset(ImageAssets.routeLogo),
                  ),
                  Text(
                    StringsMangaer.welcomeSignIn,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    StringsMangaer.signInWithYourEmail,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  const CustomInput(title: StringsMangaer.userName),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomTextField(
                    validate: AppValidator.validateEmail,
                    textController: emailController,
                    hintText: StringsMangaer.enterUserName, borderRadius: 15.r,
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  const CustomInput(
                    title: StringsMangaer.password,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomTextField(
                    validate: AppValidator.validatePassword,
                    textController: passwordController,
                    hintText: StringsMangaer.enterPassword,
                    suffix: Icons.visibility_off_outlined, borderRadius: 15.r,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        StringsMangaer.forgetPassword,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 56.h,
                  ),
                  BlocConsumer<SigninViewModelCubit, SigninViewModelState>(
                   listener: (context, state) {
                     if(state is ErrorState)
                       {
                         AppConstants.showToast(state.errorMsg) ;
                       }
                     if(state is SuccessState)
                       {
                         SharedPrefsHandler.saveToken(state.signupEntity.token!) ;
                         AppConstants.showToast("Logged in successfully") ;
                         Navigator.pushReplacementNamed(context, Routes.mainRoute) ;
                       }
                   },
                    builder: (context, state) {
                     return CustomElevatedButton(
                    isLoadign: state is LoadingState,
                    title: StringsMangaer.login,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<SigninViewModelCubit>(context).login(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      }
                    },
                  );
  },
),
                  SizedBox(
                    height: 32.h,
                  ),
                  Padding(
                    padding: REdgeInsets.symmetric(horizontal: 22),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, Routes.signUpRoute);
                        },
                        child: Text(
                          StringsMangaer.createAccount,
                          style: Theme.of(context).textTheme.headlineSmall,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

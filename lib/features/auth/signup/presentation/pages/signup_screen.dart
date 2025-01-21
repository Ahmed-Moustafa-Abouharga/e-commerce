import 'package:e_commerce/core/DI/di.dart';
import 'package:e_commerce/core/cache/shared_prefs_handler.dart';
import 'package:e_commerce/core/resources/constants_manager.dart';
import 'package:e_commerce/core/resources/strings_manager.dart';
import 'package:e_commerce/core/resources/validator.dart';
import 'package:e_commerce/core/widgets/custom_elevated_button.dart';
import 'package:e_commerce/core/widgets/custom_input.dart';
import 'package:e_commerce/core/widgets/custom_text_field.dart';
import 'package:e_commerce/features/auth/signup/presentation/manager/signup_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/routes_manager/routes.dart';

class SignupView extends StatefulWidget {
  SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  late TextEditingController nameController;

  late TextEditingController emailController;

  late TextEditingController passwordController;
  late TextEditingController phoneController;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();

    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<SignupViewModelCubit>(),
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
                    padding: REdgeInsets.only(
                        bottom: 46, top: 85, right: 80, left: 81),
                    child: Image.asset(ImageAssets.routeLogo),
                  ),
                  const CustomInput(title: StringsMangaer.fullName),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomTextField(
                    hintText: StringsMangaer.enterFullName,
                    textController: nameController,
                    validate:AppValidator.validateFullName, borderRadius: 15.r,
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  const CustomInput(title: StringsMangaer.mobileNumber),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomTextField(
                    hintText: StringsMangaer.enterMobileNo,
                    textController: phoneController,
                    validate: AppValidator.validatePhone, borderRadius: 15.r,
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  const CustomInput(title: StringsMangaer.emailAddress),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomTextField(
                    hintText: StringsMangaer.enterEmailAddress,
                    textController: emailController,
                    validate: AppValidator.validateEmail, borderRadius: 15.r,
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  const CustomInput(title: StringsMangaer.password),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomTextField(
                    hintText: StringsMangaer.enterPassword,
                    textController: passwordController,
                    validate: AppValidator.validatePassword, borderRadius: 15.r,
                  ),
                  SizedBox(
                    height: 56.h,
                  ),
                  BlocConsumer<SignupViewModelCubit, SignupViewModelState>(
                    listener:
                        (BuildContext context, SignupViewModelState state) {
                      if (state is ErrorState) {
                        AppConstants.showToast(state.error);
                      }
                      if (state is SuccessState) {
                        SharedPrefsHandler.saveToken(state.signupEntity.token!);
                        AppConstants.showToast("Account created successfully");
                        Navigator.pushReplacementNamed(
                            context, Routes.mainRoute);
                      }
                    },
                    builder:
                        (BuildContext context, SignupViewModelState state) {
                      return CustomElevatedButton(
                        title: StringsMangaer.signUp,
                        isLoadign: state is LoadingState,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<SignupViewModelCubit>(context)
                                .signUp(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    phone: phoneController.text);
                          }
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

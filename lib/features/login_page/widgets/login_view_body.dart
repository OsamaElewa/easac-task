
import 'package:easacc_task/features/login_page/widgets/sign_in_divider.dart';
import 'package:easacc_task/features/login_page/widgets/social_media_buttons.dart';
import 'package:easacc_task/features/login_page/widgets/terms_and_conditions_text.dart';
import 'package:easacc_task/features/login_page/widgets/text_form_field_section.dart';
import 'package:easacc_task/features/login_page/widgets/welcome_back_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../config/routes/app_routes.dart';
import '../../../core/functions/show_snack_bar.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/widgets/gradient_button.dart';
import '../logic/login_cubit.dart';
import '../logic/login_state.dart';
import 'already_have_an_account.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState || state is SocialLoginSuccessState || state is SocialGoogleLoginSuccessState) {
          Navigator.pushReplacementNamed(context, Routes.homeView);
          showSuccessSnackBar(
              context: context, message: 'Login Successful');
        } else if (state is SocialLoginFailureState) {
          print(state.error);
          showErrorSnackBar(context: context, message: state.error);
        }else if(state is LoginFailureState){
          print(state.error);
          showErrorSnackBar(context: context, message: state.error);
        }else if(state is SocialGoogleLoginFailureState){
          print(state.error);
          showErrorSnackBar(context: context, message: state.error);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: 60.h),
          child:  Column(
            children: [
              const WelcomeBackSection(),
              verticalSpace(36),
              const TextFormFieldSection(),
              verticalSpace(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GradientButton(
                    radius: 16,
                    onPressed: () {
                      if (LoginCubit.get(context)
                          .formKey
                          .currentState!
                          .validate()) {
                        LoginCubit.get(context).userrLogin(email: LoginCubit.get(context).emailController.text, password: LoginCubit.get(context).passwordController.text);
                      }
                    }, title: Text(AppStrings.loginText,style: AppStyles.font16WhiteRegular,)),
              ),
              verticalSpace(54),
              const SignInDivider(),
              verticalSpace(41),
              const SocialMediaButton(),
              verticalSpace(32),
              const TermsAndConditionsText(),
              verticalSpace(24),
              const AlreadyHaveAnAccount()
            ],
          ),
        );
      },
    );
  }
}

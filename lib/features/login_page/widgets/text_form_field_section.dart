
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../logic/login_cubit.dart';
import '../logic/login_state.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/app_styles.dart';

class TextFormFieldSection extends StatelessWidget {
  const TextFormFieldSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit,LoginState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: LoginCubit.get(context).formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: LoginCubit.get(context).emailController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: const BorderSide(
                          color: AppColors.primary,
                          width: 1.3
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: const BorderSide(
                          color: AppColors.lighterGrey,
                          width: 1.3
                      ),
                    ),
                    hintText: 'enter your email',
                    label: const Text('Email'),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    bool validEmail = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
                    ).hasMatch(value);
                    if(!validEmail){
                      return 'Enter valid email';
                    }
                    return null;
                  },
                ),
                verticalSpace(16),
                TextFormField(
                  controller: LoginCubit.get(context).passwordController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: const BorderSide(
                          color: AppColors.primary,
                          width: 1.3
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: const BorderSide(
                          color: AppColors.lighterGrey,
                          width: 1.3
                      ),
                    ),
                    hintText: 'enter your password',
                    label: const Text('password'),
                    suffixIcon: InkWell(
                      onTap: () => LoginCubit.get(context).changePasswordVisibility(),
                      child: Icon(
                          LoginCubit.get(context).isVisible?
                          Icons.visibility_off
                              :
                          Icons.visibility
                      ),
                    ),

                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: LoginCubit.get(context).isVisible,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

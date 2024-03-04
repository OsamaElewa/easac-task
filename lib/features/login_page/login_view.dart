import 'package:easacc_task/features/login_page/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/login_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        body: LoginViewBody(),
      )
    );
  }
}

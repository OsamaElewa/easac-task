import 'package:easacc_task/core/utils/app_assets.dart';
import 'package:easacc_task/features/login_page/widgets/social_media_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/helpers/spacing.dart';
import '../logic/login_cubit.dart';
import '../logic/login_state.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => LoginCubit.get(context).userGoogleLogin(),
                  child: SocialMediaIcon(iconString: SvgPicture.asset(AppAssets.googleLogo))),
              horizontalSpace(10),
              GestureDetector(
                  onTap: () => LoginCubit.get(context).userLogin(),
                  child: SocialMediaIcon(iconString: SvgPicture.asset(AppAssets.facebookLogo))),
              horizontalSpace(10),
              SocialMediaIcon(iconString: SvgPicture.asset(AppAssets.appleLogo,)),
            ],
          ),
        );
      },
    );
  }
}

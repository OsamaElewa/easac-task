
import 'package:easacc_task/core/utils/app_constants.dart';
import 'package:easacc_task/features/settings_view/settings_view.dart';
import 'package:easacc_task/features/web_view_screen/web_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/animations/page_fade_transition.dart';
import '../../core/utils/app_strings.dart';
import '../../features/home_page/home_view.dart';
import '../../features/login_page/login_view.dart';


class Routes {
  static const String slashView = '/';
  static const String onBoardingView = '/onBoarding_view';
  static const String registerView = '/login_view';
  static const String loginView = '/login_view';
  static const String homeView = '/home_view';
  static const String settingsView = '/settings_view';
  static const String webView = '/web_view';

}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case Routes.loginView:
        return PageFadeTransition(
          page: const LoginView(),
        );

      case Routes.homeView:
        return PageFadeTransition(
          page: const HomeView(),
        );

      case Routes.settingsView:
        return PageFadeTransition(
          page: const SettingsView(),
        );
      case Routes.webView:
        return PageFadeTransition(
          page: WebViewScreen(articalurl: AppConstants.url),
        );
    }
    return undefinedRoute();
  }

  static Route undefinedRoute() {
    return MaterialPageRoute(
      builder: ((context) => const Scaffold(
            body: Center(
              child: Text(AppStrings.noRouteFound),
            ),
          )),
    );
  }
}

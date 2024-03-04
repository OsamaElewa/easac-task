import 'package:easacc_task/config/local/cache_helper.dart';
import 'package:easacc_task/core/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config/routes/app_routes.dart';
import '../../core/functions/show_snack_bar.dart';
import 'logic/home_cubit.dart';
import 'logic/home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final websiteUrl =Uri.parse(AppConstants.url);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, Routes.settingsView),
                child: Icon(
                  Icons.settings,color: Colors.black,size: 40,)),
          )
        ],
      ),
      body: BlocBuilder<HomeCubit,HomeState>(
        builder: (BuildContext context, state) {
          return  Center(
            child: ElevatedButton(onPressed: () {
              if (AppConstants.url.isNotEmpty) {
                //  launchUrl(websiteUrl,
                //     mode: LaunchMode.inAppWebView,
                //     webViewConfiguration: const WebViewConfiguration(enableJavaScript: false),
                // );
                Navigator.pushNamed(context, Routes.webView);
              }else{
                showErrorSnackBar(context: context, message: 'please set url first');
              }
            }, child: const Text('launch url')),
          );
        }
      ),
    );
  }
}

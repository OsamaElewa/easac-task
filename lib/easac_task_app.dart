import 'package:easacc_task/features/home_page/logic/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'config/routes/app_routes.dart';

class EasacTaskApp extends StatelessWidget {
  const EasacTaskApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => HomeCubit(),)
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRoutes.generateRoute,
            initialRoute: Routes.loginView,
          ),
        );
      },
    );
  }
}
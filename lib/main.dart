import 'package:bloc/bloc.dart';
import 'package:easacc_task/easac_task_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'config/local/cache_helper.dart';
import 'core/bloc_observer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer=MyBlocObserver();
  await CacheHelper.init();
  await Firebase.initializeApp();
  runApp(const EasacTaskApp());
}



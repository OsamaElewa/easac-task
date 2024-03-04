import 'package:easacc_task/features/home_page/logic/home_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  TextEditingController urlController = TextEditingController();
  var formKey = GlobalKey<FormState>();


  Future scanDevices() async {
   await FlutterBluePlus.startScan(timeout: const Duration(seconds: 10));
   FlutterBluePlus.adapterState.listen((state) {
     if (state == BluetoothAdapterState.off) {
       FlutterBluePlus.stopScan();
       emit(HomeStopScanState());
     }
   });
    //FlutterBluePlus.stopScan();
  }

  Stream<List<ScanResult>> get scanResults =>FlutterBluePlus.scanResults;


}

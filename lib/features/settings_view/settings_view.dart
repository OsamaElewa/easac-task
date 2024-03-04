import 'package:easacc_task/config/local/cache_helper.dart';
import 'package:easacc_task/core/functions/show_snack_bar.dart';
import 'package:easacc_task/core/utils/app_constants.dart';
import 'package:easacc_task/features/home_page/logic/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import '../home_page/logic/home_cubit.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body:  BlocConsumer<HomeCubit,HomeState>(
        listener: (context, state) {
          if(state is HomeStopScanState){
            showErrorSnackBar(context: context, message: 'please check your bluetooth');
          }
        },
        builder: (BuildContext context, state) {
          return Form(
            key: HomeCubit.get(context).formKey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: HomeCubit.get(context).urlController,
                    decoration: const InputDecoration(
                      hintText: 'set url',
                      border: OutlineInputBorder(),
                      labelText: 'url',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter url';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                    if (HomeCubit.get(context).formKey.currentState!.validate()) {
                      AppConstants.url = HomeCubit.get(context).urlController.text;
                      showSuccessSnackBar(context: context, message: 'the process is done successfully');
                      Navigator.pop(context);
                    }
                  }, child: const Text('set url')),
                  const SizedBox(height: 10,),
                  ElevatedButton(onPressed: () {
                    HomeCubit.get(context).scanDevices();
                  }, child: const Text('scan devices')),
                  const SizedBox(height: 10,),
                  StreamBuilder<List<ScanResult>>(
                      stream: HomeCubit.get(context).scanResults,
                      builder: (context, snapshot) {
                        if(snapshot.hasData){
                          return Expanded(
                            child: ListView.builder(
                                itemBuilder: (context, index) {
                                  final data = snapshot.data![index];
                                  return Card(
                                    elevation: 2,
                                    child: ListTile(
                                      title: Text(data.device.platformName,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                                      subtitle: Text(data.device.remoteId.str),
                                      trailing: Text(data.rssi.toString()),
                                    ),
                                  );
                                },
                                //separatorBuilder: (context, index) => const SizedBox(height: 10,),
                                itemCount: snapshot.data!.length,
                            ),
                          );
                        }else{
                          return Text('no devices found',style: TextStyle(color: Colors.red,fontSize: 25),);
                        }
                      },)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

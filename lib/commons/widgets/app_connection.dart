// import 'dart:developer';

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:e_books/core/config/theme/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AppConnection {
//   static void init() {
//     Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
//       if (result == ConnectivityResult.none) {
//         log(result.toString());
//         if (Get.isSnackbarOpen == false) {
//           showSnackbar();
//         }
//       } else {
//         if (Get.isSnackbarOpen == true) Get.back();
//       }
//     });
//   }

//   static Future<bool> getstatus() async {
//     final check = Connectivity().checkConnectivity();
//     if (await check == ConnectivityResult.none) {
//       return false;
//     } else {
//       return true;
//     }
//   }

//   static void showSnackbar({bool isDismissible = false}) {
//     Get.snackbar(
//       'Connection',
//       'No Internet Connection, Please Turn on Mobile Data Network or Wifi',
//       colorText: AppColors.whiteMain,
//       duration: const Duration(days: 1),
//       isDismissible: isDismissible,
//       backgroundColor: AppColors.darkMain,
//     );
//   }

//   static Future<void> checkConnection({required Function(bool) onConnect}) async {
//     if (await getstatus()) {
//       onConnect.call(true);
//     } else {
//       onConnect.call(false);
//     }
//   }

//   void listen({required Function(bool) callback, required String from}) {
//     Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
//       log('LISTEN CONNECTION FROM $from');
//       if (result == ConnectivityResult.none) {
//         callback.call(false);
//       } else {
//         callback.call(true);
//       }
//     });
//   }
// }

// import 'dart:developer';
// import 'dart:io';

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:e_books/core/config/theme/app_colors.dart';
// import 'package:get/get.dart';

// class AppConnection {
//   static void init() async {
//     Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result) async {
//       if (Platform.isIOS) {
//         final x = await getstatus();
//         if (!x) {
//           if (Get.isSnackbarOpen == false) {
//             showSnackbar();
//           }
//         } else {
//           if (Get.isSnackbarOpen == true) Get.back();
//         }
//       }
//       // else if (result.contains(ConnectivityResult.none)) {
//       //   log(result.toString());
//       //   if (Get.isSnackbarOpen == false) {
//       //     showSnackbar();
//       //   }
//       // } else {
//       //   if (Get.isSnackbarOpen == true) Get.back();
//       // }
//     });
//   }

//   static Future<bool> getstatus() async {
//     final check = await Connectivity().checkConnectivity();
//     if (check.any((e) => e == ConnectivityResult.none)) {
//       return true;
//     } else {
//       return false;
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

//   // static Future<void> checkConnection({required Function(bool) onConnect}) async {
//   //   if (await getstatus()) {
//   //     onConnect.call(true);
//   //   } else {
//   //     onConnect.call(false);
//   //   }
//   // }

//   // void listen({required Function(bool) callback, required String from}) {
//   //   Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result) {
//   //     log('LISTEN CONNECTION FROM $from');
//   //     if (result.contains(ConnectivityResult.none)) {
//   //       callback.call(false);
//   //     } else {
//   //       callback.call(true);
//   //     }
//   //   });
//   // }
// }

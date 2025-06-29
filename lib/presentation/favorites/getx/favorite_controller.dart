// import 'package:e_books/core/dependency_injection/services_locator.dart';
// import 'package:e_books/domain/entities/book.dart';
// import 'package:e_books/domain/repositories/favorite.dart';
// import 'package:get/get.dart';

// class FavoriteController extends GetxController with StateMixin<dynamic> {
//   @override
//   void onInit() {
//     getData();
//     super.onInit();
//   }

//   void getData() {
//     final data = sl<FavoriteRepository>().getBooks();
//     try {
//       for (BookEntity item in data.values.toList()) {
//         print(item.id);
//       }
//       print('list $data');
//     } catch (e) {
//       print('ERROR fetchBookmark $e');
//     }
//   }
// }

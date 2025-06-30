// import 'package:e_books/commons/extentions/media_query_ext.dart';
// import 'package:e_books/commons/widgets/book.dart';
// import 'package:e_books/commons/widgets/shimmers.dart';
// import 'package:e_books/commons/widgets/spacing.dart';
// import 'package:e_books/commons/widgets/state_check.dart';
// import 'package:e_books/data/repositories/favorite.dart';
// import 'package:e_books/presentation/home/getx/home_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class SliderBook extends GetView<HomeController> {
//   const SliderBook({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: Get.width,
//       padding: EdgeInsets.symmetric(horizontal: 16),
//       child: list(), //
//     );
//   }

//   Widget list() {
//     return ValueListenableBuilder(
//       valueListenable: FavoriteRepositoryImpl().getBooks().listenable(),
//       builder: (context, value, child) {
//         var books = value.values.toList();
//         if (books.isEmpty) {
//           return SizedBox();
//         }
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Spacing.vertical(32),
//             Text('My Bookshelf', style: context.bodyLarge),
//             Spacing.vertical(16),
//             SizedBox(
//               width: Get.width,
//               height: Get.width * .775,
//               child: ListView.separated(
//                 shrinkWrap: true,
//                 scrollDirection: Axis.horizontal,
//                 itemCount: books.length,
//                 itemBuilder: (context, index) {
//                   final item = books[index];
//                   return Book.book(
//                     bookEntity: item,
//                     context: context,
//                     margin: EdgeInsets.only(
//                       // right: 16,
//                       bottom: 16,
//                       top: 16, //
//                     ),
//                   );
//                 },
//                 separatorBuilder: (context, index) {
//                   return Spacing.horizontal(16);
//                 },
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Widget bookslider() {
//     return controller.obx(
//       (state) {
//         final data = controller.listBooks;
//         return SizedBox(
//           width: Get.width,
//           height: Get.width * .775,
//           child: ListView.separated(
//             shrinkWrap: true,
//             scrollDirection: Axis.horizontal,
//             itemCount: 6,
//             itemBuilder: (context, index) {
//               final item = data[index];
//               return Book.book(
//                 bookEntity: item,
//                 context: context,
//                 margin: EdgeInsets.only(
//                   // right: 16,
//                   bottom: 16,
//                   top: 16, //
//                 ),
//               );
//             },
//             separatorBuilder: (context, index) {
//               return Spacing.horizontal(16);
//             },
//           ),
//         );
//       },
//       onLoading: Row(
//         children: [
//           AppShimmers.image(height: Get.height * .275, width: (Get.width / 2) - 32),
//           Spacing.horizontal(16),
//           AppShimmers.image(height: Get.height * .275, width: (Get.width / 2) - 32), //
//         ],
//       ),
//       onError: (error) => StateCheck.error(error: error),
//       onEmpty: SizedBox(
//         width: Get.width,
//         child: StateCheck.empty(), //
//       ),
//     );
//   }
// }

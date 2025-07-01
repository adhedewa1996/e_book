import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_books/core/dependency_injection/services_locator.dart';
import 'package:e_books/core/network/app_client.dart';
import 'package:e_books/data/model/search.dart';

// ignore: one_member_abstracts
abstract class BookServices {
  Future<Either<dynamic, Map<String, dynamic>>> getBooks({required String page});
  Future<Either<dynamic, Map<String, dynamic>>> detailBook({required String id});
  Future<Either<dynamic, Map<String, dynamic>>> search({required SearchModel search});
}

class BookServicesImpl extends BookServices {
  @override
  Future<Either<dynamic, Map<String, dynamic>>> getBooks({required String page}) async {
    try {
      final response = await sl<AppClient>().get('/books?page=$page');
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data['message'] ?? 'Error');
    }
  }

  @override
  Future<Either<dynamic, Map<String, dynamic>>> detailBook({required String id}) async {
    try {
      final response = await sl<AppClient>().get('/books/$id');
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data['message'] ?? 'Error');
    }
  }

  @override
  Future<Either<dynamic, Map<String, dynamic>>> search({required SearchModel search}) async {
    try {
      final response = await sl<AppClient>().get('/books?page=${search.page}&search=${search.keyword}');
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data['message'] ?? 'Error');
    }
  }
}

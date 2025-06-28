import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_books/core/dependency_injection/services_locator.dart';
import 'package:e_books/core/network/app_client.dart';
import 'package:e_books/data/model/search.dart';
import 'package:flutter/material.dart';

// ignore: one_member_abstracts
abstract class BookServices {
  Future<Either> search({required SearchModel search});
  Future<Either> getBooks({required String page});
  Future<Either> detailBook({required String id});
}

class BookServicesImpl extends BookServices {
  @override
  Future<Either> getBooks({required String page}) async {
    try {
      final response = await sl<AppClient>().get('/books/?page=$page');
      debugPrint(response.data.toString());
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> detailBook({required String id}) async {
    try {
      final response = await sl<AppClient>().get('/books/$id');
      debugPrint(response.data.toString());
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> search({required SearchModel search}) async {
    try {
      final response = await sl<AppClient>().get('/books/?page=${search.page}&search=${search.keyword}');
      debugPrint(response.data.toString());
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}

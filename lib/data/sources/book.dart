import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_books/core/dependency_injection/services_locator.dart';
import 'package:e_books/core/network/app_client.dart';
import 'package:flutter/material.dart';

// ignore: one_member_abstracts
abstract class BookServices {
  Future<Either> search();
  Future<Either> getBooks();
  Future<Either> detailBook(String id);
}

class BookServicesImpl extends BookServices {
  @override
  Future<Either> getBooks() async {
    try {
      final response = await sl<AppClient>().get('/books/?page=1');
      debugPrint(response.data.toString());
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> detailBook(String id) async {
    try {
      final response = await sl<AppClient>().get('/books/$id');
      debugPrint(response.data.toString());
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> search() {
    // TODO: implement search
    throw UnimplementedError();
  }
}

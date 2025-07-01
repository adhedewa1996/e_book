import 'dart:convert';

import 'package:e_books/data/model/get_book/detail_book.dart';
import 'package:flutter/material.dart';

@immutable
class GetBook {
  final int? count;
  final String? next;
  final dynamic previous;
  final List<DetailBook>? results;

  const GetBook({this.count, this.next, this.previous, this.results});

  @override
  String toString() {
    return 'GetBook(count: $count, next: $next, previous: $previous, results: $results)';
  }

  factory GetBook.fromMap(Map<String, dynamic> data) => GetBook(
    count: data['count'] as int?,
    next: data['next'] as String?,
    previous: data['previous'] as dynamic,
    results: (data['results'] as List<dynamic>?)?.map((e) => DetailBook.fromMap(e as Map<String, dynamic>)).toList(),
  );

  Map<String, dynamic> toMap() => {'count': count, 'next': next, 'previous': previous, 'results': results?.map((e) => e.toMap()).toList()};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GetBook].
  factory GetBook.fromJson(String data) {
    return GetBook.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GetBook] to a JSON string.
  String toJson() => json.encode(toMap());

  GetBook copyWith({int? count, String? next, dynamic previous, List<DetailBook>? results}) {
    return GetBook(count: count ?? this.count, next: next ?? this.next, previous: previous ?? this.previous, results: results ?? this.results);
  }
}

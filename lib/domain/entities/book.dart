import 'package:e_books/data/model/detail_book/detail_book.dart';
import 'package:e_books/data/model/get_book/result.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'book.g.dart';

@HiveType(typeId: 0)
class BookEntity extends HiveObject {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? author;
  @HiveField(3)
  final String? summary;
  @HiveField(4)
  final String? cover;
  @HiveField(5)
  final bool isLiked;
  @HiveField(6)
  final int? downloadCount;

  BookEntity({
    required this.id,
    required this.title,
    required this.author,
    required this.summary,
    required this.cover,
    required this.isLiked,
    required this.downloadCount, //
  });
}

class BookAndPageEntity {
  final List<BookEntity> bookEntity;
  final String page;

  BookAndPageEntity({required this.bookEntity, required this.page});
}

extension BookHelper on Result {
  BookEntity toEntity() {
    return BookEntity(
      id: id,
      title: title,
      author: authors!.isEmpty ? '~' : authors?.first.name ?? '~',
      summary: summaries!.isEmpty ? '~' : summaries?.first ?? '~',
      cover: formats?.imageJpeg ?? '',
      isLiked: false,
      downloadCount: downloadCount, //
    );
  }
}

extension DetailBookHelper on DetailBook {
  BookEntity toEntity() {
    return BookEntity(
      id: id,
      title: title,
      author: authors?.first.name,
      summary: summaries?.first,
      cover: formats?.imageJpeg,
      isLiked: false,
      downloadCount: downloadCount, //
    );
  }
}

import 'package:e_books/data/model/detail_book/detail_book.dart';
import 'package:e_books/data/model/get_book/result.dart';

class BookEntity {
  final int? id;
  final String? title;
  final String? author;
  final String? summary;
  final String? cover;
  final bool isLiked;
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

extension BookHelper on Result {
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

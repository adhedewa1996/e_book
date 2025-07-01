import 'package:e_books/data/model/get_book/detail_book.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'book.g.dart';

@HiveType(typeId: 0)
class BookEntity extends Equatable {
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

  const BookEntity({
    this.id,
    this.title,
    this.author,
    this.summary,
    this.cover,
    this.isLiked = false,
    this.downloadCount, //
  });

  @override
  List<Object?> get props => [id, title, author, summary, cover, isLiked, downloadCount];
}

class BookAndPageEntity extends Equatable {
  final List<BookEntity> bookEntity;
  final String page;

  const BookAndPageEntity({
    required this.bookEntity,
    required this.page, //
  });

  @override
  @override
  List<Object?> get props => [bookEntity, page];
}

extension BookHelper on DetailBook {
  BookEntity toEntity() {
    return BookEntity(
      id: id,
      title: title,
      author: (authors ?? []).isEmpty ? '~' : authors?.first.name ?? '~',
      summary: (summaries ?? []).isEmpty ? '~' : summaries?.first ?? '~',
      cover: formats?.imageJpeg ?? '',
      isLiked: false,
      downloadCount: downloadCount, //
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';

import 'author.dart';
import 'formats.dart';

@immutable
class DetailBook {
  final int? id;
  final String? title;
  final List<Author>? authors;
  final List<dynamic>? summaries;
  final List<dynamic>? translators;
  final List<dynamic>? subjects;
  final List<dynamic>? bookshelves;
  final List<dynamic>? languages;
  final bool? copyright;
  final String? mediaType;
  final Formats? formats;
  final int? downloadCount;

  const DetailBook({
    this.id,
    this.title,
    this.authors,
    this.summaries,
    this.translators,
    this.subjects,
    this.bookshelves,
    this.languages,
    this.copyright,
    this.mediaType,
    this.formats,
    this.downloadCount,
  });

  @override
  String toString() {
    return 'DetailBook(id: $id, title: $title, authors: $authors, summaries: $summaries, translators: $translators, subjects: $subjects, bookshelves: $bookshelves, languages: $languages, copyright: $copyright, mediaType: $mediaType, formats: $formats, downloadCount: $downloadCount)';
  }

  factory DetailBook.fromMap(Map<String, dynamic> data) => DetailBook(
    id: data['id'] as int?,
    title: data['title'] as String?,
    authors: (data['authors'] == null ? null : data['authors'] as List<dynamic>?)?.map((e) => Author.fromMap(e as Map<String, dynamic>)).toList(),
    summaries: data['summaries'] == null ? null : data['summaries'] as List<dynamic>?,
    translators: data['translators'] == null ? null : data['translators'] as List<dynamic>?,
    subjects: data['subjects'] == null ? null : data['subjects'] as List<dynamic>?,
    bookshelves: data['bookshelves'] == null ? null : data['bookshelves'] as List<dynamic>?,
    languages: data['languages'] == null ? null : data['languages'] as List<dynamic>?,
    copyright: data['copyright'] == null ? null : data['copyright'] as bool?,
    mediaType: data['media_type'] == null ? null : data['media_type'] as String?,
    formats: data['formats'] == null ? null : Formats.fromMap(data['formats'] as Map<String, dynamic>),
    downloadCount: data['download_count'] as int?,
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'authors': authors?.map((e) => e.toMap()).toList(),
    'summaries': summaries,
    'translators': translators,
    'subjects': subjects,
    'bookshelves': bookshelves,
    'languages': languages,
    'copyright': copyright,
    'media_type': mediaType,
    'formats': formats?.toMap(),
    'download_count': downloadCount,
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DetailBook].
  factory DetailBook.fromJson(String data) {
    return DetailBook.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DetailBook] to a JSON string.
  String toJson() => json.encode(toMap());

  DetailBook copyWith({
    int? id,
    String? title,
    List<Author>? authors,
    List<String>? summaries,
    List<dynamic>? translators,
    List<String>? subjects,
    List<String>? bookshelves,
    List<String>? languages,
    bool? copyright,
    String? mediaType,
    Formats? formats,
    int? downloadCount,
  }) {
    return DetailBook(
      id: id ?? this.id,
      title: title ?? this.title,
      authors: authors ?? this.authors,
      summaries: summaries ?? this.summaries,
      translators: translators ?? this.translators,
      subjects: subjects ?? this.subjects,
      bookshelves: bookshelves ?? this.bookshelves,
      languages: languages ?? this.languages,
      copyright: copyright ?? this.copyright,
      mediaType: mediaType ?? this.mediaType,
      formats: formats ?? this.formats,
      downloadCount: downloadCount ?? this.downloadCount,
    );
  }
}

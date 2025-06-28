import 'dart:convert';

import 'package:flutter/material.dart';

@immutable
class Formats {
  final String? textHtml;
  final String? applicationEpubZip;
  final String? applicationXMobipocketEbook;
  final String? textPlainCharsetUsAscii;
  final String? applicationRdfXml;
  final String? imageJpeg;
  final String? applicationOctetStream;

  const Formats({
    this.textHtml,
    this.applicationEpubZip,
    this.applicationXMobipocketEbook,
    this.textPlainCharsetUsAscii,
    this.applicationRdfXml,
    this.imageJpeg,
    this.applicationOctetStream,
  });

  @override
  String toString() {
    return 'Formats(textHtml: $textHtml, applicationEpubZip: $applicationEpubZip, applicationXMobipocketEbook: $applicationXMobipocketEbook, textPlainCharsetUsAscii: $textPlainCharsetUsAscii, applicationRdfXml: $applicationRdfXml, imageJpeg: $imageJpeg, applicationOctetStream: $applicationOctetStream)';
  }

  factory Formats.fromMap(Map<String, dynamic> data) => Formats(
    textHtml: data['text/html'] as String?,
    applicationEpubZip: data['application/epub+zip'] as String?,
    applicationXMobipocketEbook:
        data['application/x-mobipocket-ebook'] as String?,
    textPlainCharsetUsAscii: data['text/plain; charset=us-ascii'] as String?,
    applicationRdfXml: data['application/rdf+xml'] as String?,
    imageJpeg: data['image/jpeg'] as String?,
    applicationOctetStream: data['application/octet-stream'] as String?,
  );

  Map<String, dynamic> toMap() => {
    'text/html': textHtml,
    'application/epub+zip': applicationEpubZip,
    'application/x-mobipocket-ebook': applicationXMobipocketEbook,
    'text/plain; charset=us-ascii': textPlainCharsetUsAscii,
    'application/rdf+xml': applicationRdfXml,
    'image/jpeg': imageJpeg,
    'application/octet-stream': applicationOctetStream,
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Formats].
  factory Formats.fromJson(String data) {
    return Formats.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Formats] to a JSON string.
  String toJson() => json.encode(toMap());

  Formats copyWith({
    String? textHtml,
    String? applicationEpubZip,
    String? applicationXMobipocketEbook,
    String? textPlainCharsetUsAscii,
    String? applicationRdfXml,
    String? imageJpeg,
    String? applicationOctetStream,
  }) {
    return Formats(
      textHtml: textHtml ?? this.textHtml,
      applicationEpubZip: applicationEpubZip ?? this.applicationEpubZip,
      applicationXMobipocketEbook:
          applicationXMobipocketEbook ?? this.applicationXMobipocketEbook,
      textPlainCharsetUsAscii:
          textPlainCharsetUsAscii ?? this.textPlainCharsetUsAscii,
      applicationRdfXml: applicationRdfXml ?? this.applicationRdfXml,
      imageJpeg: imageJpeg ?? this.imageJpeg,
      applicationOctetStream:
          applicationOctetStream ?? this.applicationOctetStream,
    );
  }
}

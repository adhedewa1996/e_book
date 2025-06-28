import 'dart:convert';

import 'package:flutter/material.dart';

@immutable
class Author {
  final String? name;
  final int? birthYear;
  final int? deathYear;

  const Author({this.name, this.birthYear, this.deathYear});

  @override
  String toString() {
    return 'Author(name: $name, birthYear: $birthYear, deathYear: $deathYear)';
  }

  factory Author.fromMap(Map<String, dynamic> data) => Author(
    name: data['name'] as String?,
    birthYear: data['birth_year'] as int?,
    deathYear: data['death_year'] as int?,
  );

  Map<String, dynamic> toMap() => {
    'name': name,
    'birth_year': birthYear,
    'death_year': deathYear,
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Author].
  factory Author.fromJson(String data) {
    return Author.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Author] to a JSON string.
  String toJson() => json.encode(toMap());

  Author copyWith({String? name, int? birthYear, int? deathYear}) {
    return Author(
      name: name ?? this.name,
      birthYear: birthYear ?? this.birthYear,
      deathYear: deathYear ?? this.deathYear,
    );
  }
}

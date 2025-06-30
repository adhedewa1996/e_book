class StoryEntity {
  final String title;
  final List<Chapter> chapter;

  StoryEntity({required this.title, required this.chapter});
}

class Chapter {
  final String title;
  final List<Content> contents;
  final List<Review> reviews;

  Chapter({required this.title, required this.contents, required this.reviews});
}

class Content {
  final String text;
  final List<Review> reviews;

  Content({required this.text, required this.reviews});
}

class Review {
  final String name;
  final String comment;
  final int star;

  Review({required this.name, required this.comment, required this.star});
}

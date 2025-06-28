class StoryEntity {
  final String title;
  final List<Chapter> chapter;

  StoryEntity({required this.title, required this.chapter});
}

class Chapter {
  final String title;
  final List<String> content;

  Chapter({required this.title, required this.content});
}

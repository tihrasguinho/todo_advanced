class NewTodoEntity {
  final String title;
  final String subtitle;

  NewTodoEntity({
    required this.title,
    required this.subtitle,
  });

  bool get isTitleOk => title.length >= 6;

  bool get isSubtitleOk => subtitle.length >= 6;
}

class TodoEntity {
  String id;
  String owner;
  String title;
  String subtitle;
  bool done;
  int time;

  TodoEntity({
    required this.id,
    required this.owner,
    required this.title,
    required this.subtitle,
    required this.done,
    required this.time,
  });
}

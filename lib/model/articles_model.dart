class ArticlesModel {
  const ArticlesModel(
      {required this.id,
      required this.title,
      required this.summary,
      required this.imageUrl});

  final int id;
  final String title;
  final String summary;
  final String imageUrl;
}

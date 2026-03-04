class Article {
  final String id;
  final String title;
  final String introtext;
  final String? fulltext;
  final String catid;
  final String categoryTitle;
  final String createdById;
  final String creatorName;
  final String? creatorimage;
  final String publishUp;
  final List<String> images;
  final String? notesImagesBody;

  //Article.vacio();
  Article({
    required this.id,
    required this.title,
    required this.introtext,
    required this.fulltext,
    required this.catid,
    required this.categoryTitle,
    required this.createdById,
    required this.creatorName, 
    required this.creatorimage,
    required this.publishUp,
    required this.images,
    required this.notesImagesBody
    });
}
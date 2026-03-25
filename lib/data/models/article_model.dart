import 'package:vom_app/data/models/article_images.dart';
import 'package:vom_app/domain/entities/article.dart';

class ArticleModel extends Article {
  ArticleModel({required super.id, required super.title, required super.introtext, required super.fulltext, required super.catid, required super.categoryTitle, required super.createdById, required super.creatorName, required super.creatorimage, required super.publishUp, required super.image, required super.notesImagesBody});
  factory ArticleModel.fromjson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json["id"]?.toString() ?? "Sin id",
      title: json["title"] ?? "Sin titulo", 
      introtext: json["introtext"] ?? "Sin texto de introduccion", 
      fulltext: json["fulltext"],
      catid: json["catid"]?.toString() ?? "Sin catid", 
      categoryTitle: json["category_title"] ?? "Sin id de categoria", 
      createdById: json["created_by"]?.toString() ?? "Sin id de creador", 
      creatorName: json["creator_name"] ?? "VOM Noticias", 
      creatorimage: json["notes_image"],
      publishUp: json["publish_up"]?.toString() ?? "", 
      image: ArticleImages().cleanImages(json["images"]),
      notesImagesBody: json["notes_image_body"] ?? ""
    );
  }
}
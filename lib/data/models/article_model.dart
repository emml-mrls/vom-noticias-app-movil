import 'package:vom_app/domain/entities/article.dart';

class ArticleModel extends Article {
  ArticleModel({required super.id, required super.title, required super.introtext, required super.fulltext, required super.catid, required super.categoryTitle, required super.createdById, required super.creatorName, required super.creatorimage, required super.publishUp, required super.images, required super.notesImagesBody});
  factory ArticleModel.fromjson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json["id"]?.toString() ?? "Sin id",
      title: json["title"] ?? "Sin titulo", 
      introtext: json["inttrotext"] ?? "Sin texto de introduccion", 
      fulltext: json["fulltext"],
      catid: json["catid"]?.toString() ?? "Sin catid", 
      categoryTitle: json["categoryTitle"] ?? "Sin id de categoria", 
      createdById: json["createdBy"]?.toString() ?? "Sin id de creador", 
      creatorName: json["creatorName"] ?? "VOM Noticias", 
      creatorimage: json["notes"],
      publishUp: json["publishUp"]?.toString() ?? "", 
      images: (json["images"] as List?)?.map((e) => e.toString()).toList() ?? [],
      notesImagesBody: json["notes_image_body"] ?? ""
    );
  }
}
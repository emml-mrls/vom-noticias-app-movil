import 'package:vom_app/domain/entities/article.dart';

class ArticleModel extends Article {
  ArticleModel({required String id, required String title, required String introtext, final String? fulltext, required String catid, required String categoryTitle, required String createdById, required String creatorName, String? creatorimage, required String publishUp, required List<String> images, String? notesImagesBody}) 
    : super(id: id, title: title, introtext:introtext, fulltext:fulltext, catid: catid, categoryTitle: categoryTitle, createdById: createdById, creatorName: creatorName, creatorimage:creatorimage, publishUp: publishUp, images: images, notesImagesBody: notesImagesBody);
  
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
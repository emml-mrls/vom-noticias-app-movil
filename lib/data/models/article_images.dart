import 'dart:convert';

class ArticleImages {
  String cleanImages(String? images){
    
    if(images != null && images.isNotEmpty) {
      var json = jsonDecode(images);
      return json["image_intro"];
    }
    return "";
  }
}
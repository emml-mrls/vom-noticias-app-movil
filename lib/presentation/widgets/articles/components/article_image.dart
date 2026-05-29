import 'package:flutter/material.dart';

class ArticleImage extends StatelessWidget {
  final String imageIntro;
const ArticleImage({super.key, required this.imageIntro});

  @override
  Widget build(BuildContext context){
    return imageIntro != "" ? Image.network("https://vomnoticias.com/$imageIntro") : Icon(Icons.error);
  }
}
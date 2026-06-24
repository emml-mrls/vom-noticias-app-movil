import 'package:flutter/material.dart';

class IconsArticleCategories extends StatelessWidget {
  IconsArticleCategories({super.key, required this.id});
  final int id;
  final Map<int, String> images = {
    18: 'assets/IMAGENES_CAT_VOM_MORELOS.png',
    15: 'assets/IMAGENES_CAT_VOM_NACIONALES.png',
    14: 'assets/IMAGENES_CAT_VOM_INTERNACIONALES.png',
    16: 'assets/IMAGENES_CAT_VOM_DEPORTES.png'
  };

  @override
  Widget build(BuildContext context){
    return Image.asset(
      images[id] ?? 'assets/palomita_blanca.png',
      fit: BoxFit.contain,
    );
  }
}
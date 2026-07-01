import 'package:flutter/material.dart';
import 'package:vom_app/presentation/widgets/branding/brand_mark.dart';
class CreatorImage extends StatelessWidget {
  final String? creatorimage;
  const CreatorImage({super.key, this.creatorimage});

  @override
  Widget build(BuildContext context){
    return creatorimage == "" ? 
    Image.network(
      "https://vomnoticias.com/$creatorimage"
    ): 
    BrandMark();
  }
}
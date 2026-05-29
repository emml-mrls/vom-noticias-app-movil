import 'package:flutter/material.dart';
import 'package:vom_app/domain/entities/article.dart';
import 'package:vom_app/presentation/widgets/articles/components/article_image.dart';
import 'package:vom_app/presentation/widgets/articles/components/creator_image.dart';

class CardHomeContent extends StatelessWidget {
  final Article article;
  const CardHomeContent({super.key, required this.article});

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        // CATEGORIA
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          child: Text(
            article.categoryTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        // CREADOR INFO 
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 4, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // IMAGEN
              ClipOval(
                child: SizedBox(
                  width: 76,
                  height: 76,
                  child: CreatorImage(creatorimage: article.creatorimage)
                ),
              ),
              SizedBox(width: 8),
              // NOMBRE
              Text(
                article.creatorName,
                style: Theme.of(context).textTheme.titleMedium 
              ), 
            ],
          ),
        ),
        // IMAGEN DE ARTICULO
        Padding(
          padding: EdgeInsets.all(12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: ArticleImage(imageIntro: article.image),
          ),
        ),
        // TITULO DE NOTA
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          child: Text(
            article.title,
            style: Theme.of(context).textTheme.titleLarge
          ),  
        ),
        // TITULO DE INTRODUCCION
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Text(
            article.introtext,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
        )
      ],
    );
  }
}
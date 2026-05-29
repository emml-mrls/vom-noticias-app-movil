import 'package:flutter/material.dart';
import 'package:vom_app/domain/entities/article.dart';
import 'package:vom_app/presentation/view_models/models/card_variant.dart';
import 'package:vom_app/presentation/widgets/articles/card_home_content.dart';

class ArticleCard extends StatelessWidget {
  final Article article;  
  final CardVariant variant;
  const ArticleCard({super.key, required this.article, required this.variant});

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const SizedBox(height: 20),
          GestureDetector(
            // PENDIENTE: Agregar acción de toque
            onTap: (){},
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9.5, vertical: 3),
                child: switch (variant) {
                  Latest() => CardHomeContent(article: article),
                  ByCategory() => Center(),
                  Detail() => Center()
                }
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vom_app/presentation/view_models/models/article_state.dart';
import 'package:vom_app/domain/repositories/i_article_repository.dart';
import 'package:vom_app/presentation/view_models/article_list_view_model.dart';
import 'package:vom_app/presentation/view_models/models/feed_block.dart';
import 'package:vom_app/presentation/widgets/adds/adds.dart';
import 'package:vom_app/presentation/widgets/articles/article_card.dart';
import 'package:vom_app/presentation/widgets/errors/error_view.dart';
import 'package:vom_app/presentation/widgets/adds/footer_radio.dart';

class ArticleListScreen extends StatelessWidget {
  const ArticleListScreen({super.key});

  @override
  Widget build(BuildContext context){
    final repository = Provider.of<IArticleRepository>(context, listen: false);
    return ChangeNotifierProvider(
      create: (_) => ArticleListViewModel(repository)..fetchArticles(null),
      child: SafeArea(
        child: _ArticleListBody(),
      )
    );

  }
}

class _ArticleListBody extends StatelessWidget {
  const _ArticleListBody();

  @override
  Widget build(BuildContext context){
    return Consumer<ArticleListViewModel>(
      builder: (context, articleList, child){
        return switch (articleList.allArticles) {
          ArticleInitial() => const Center(child: CircularProgressIndicator()),
          ArticleLoading() => const Center(child: CircularProgressIndicator()),
          // AGREGAR FUNCION DE REINTENTAR
          ArticleError(error: var mssg, icon: var icon) => ErrorView(mssg: mssg, onRetry: (){}, icon: icon),
          ArticleSuccess(article: var articles) => ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index){
              return switch (articles[index]) {
                ArticleBlock(article: var article, variant: var variant) => ArticleCard(article: article, variant: variant),
                AdBlock() => const WebAddImagen(),
                FooterBlock() => FooterRadio()
              };
            })
        };
      }
  );
  }
}
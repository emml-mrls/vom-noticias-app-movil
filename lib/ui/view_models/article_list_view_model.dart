import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:vom_app/core/error/failure.dart';
import 'package:vom_app/core/states/article_state.dart';
import 'package:vom_app/domain/entities/article.dart';
import 'package:vom_app/domain/repositories/i_article_repository.dart';
import 'package:vom_app/ui/view_models/models/card_variant.dart';
import 'package:vom_app/ui/view_models/models/feed_block.dart';

class ArticleListViewModel extends ChangeNotifier {
  final IArticleRepository _repository;
  ArticleState<List<FeedBlock>> _allArticles = ArticleInitial();
  ArticleState<List<FeedBlock>> get allArticles => _allArticles;

  ArticleListViewModel(this._repository): super();


  Future<void> fetchArticles(int? catid) async{
    _allArticles = ArticleLoading();
    notifyListeners();
    Either<Failure, List<Article>> result = catid != null ? await _repository.getByCat(catid) : await _repository.getAll();     
    result.fold(
      (error) => _allArticles = ArticleError(error: error.message, icon: error.icon),
      (articles) {
        CardVariant variant = catid != null ? ByCategory() :Latest();
        _allArticles = ArticleSuccess(article: _buildDisplayList(articles, variant));
      } 
    );
    notifyListeners();
  }

  List<FeedBlock> _buildDisplayList(List<Article> articles, CardVariant variant){
    if (articles.isEmpty){
      return [];
    }
    final List<FeedBlock> items = [];

    for (var i = 0; i < articles.length; i++) {
      items.add(ArticleBlock(articles[i], variant));

      if ((i + 1) % 2 == 0) {
        items.add(AdBlock());
      }
    }
    items.add(FooterBlock());
    return items;
  }
}
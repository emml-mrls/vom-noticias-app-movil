import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:vom_app/core/error/failure.dart';
import 'package:vom_app/core/states/article_state.dart';
import 'package:vom_app/domain/entities/article.dart';
import 'package:vom_app/domain/repositories/i_article_repository.dart';
import 'package:vom_app/ui/view_models/models/list_article_items.dart';

class ArticleListViewModel extends ChangeNotifier {
  final IArticleRepository _repository;
  ArticleState<List<ListArticleItems>> _allArticles = ArticleInitial();
  ArticleState<List<ListArticleItems>> get allArticles => _allArticles;

  ArticleListViewModel(this._repository): super();


  Future<void> fetchArticles(int? catid) async{
    _allArticles = ArticleLoading();
    notifyListeners();
    Either<Failure, List<Article>> result = catid != null ? await _repository.getByCat(catid) : await _repository.getAll(); 
    result.fold(
      (error) => _allArticles = ArticleError(error: error.message, icon: error.icon),
      (articles) => _allArticles = ArticleSuccess(article: _buildDisplayList(articles))
    );
    notifyListeners();
  }

  List<ListArticleItems> _buildDisplayList(List<Article> articles){
    if (articles.isEmpty){
      return [];
    }
    final List<ListArticleItems> items = [];

    for (var i = 0; i < articles.length; i++) {
      items.add(ArticleItem(articles[i]));

      if ((i + 1) % 2 == 0) {
        items.add(AddItem());
      }
    }
    items.add(FooterItem());
    return items;
  }
}
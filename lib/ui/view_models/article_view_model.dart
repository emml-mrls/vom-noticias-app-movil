import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:vom_app/core/error/failure.dart';
import 'package:vom_app/domain/entities/article.dart';
import 'package:vom_app/domain/repositories/i_article_repository.dart';
import 'package:vom_app/core/states/article_state.dart';

class ArticleViewModel extends ChangeNotifier {
  final IArticleRepository _repository;
  
  ArticleState<Article> _article = ArticleInitial();
  ArticleState<Article> get article => _article;
  ArticleViewModel(this._repository) : super();


  Future<void> fethcArticle(int id) async {
    _article = ArticleLoading();
    notifyListeners();
    Either<Failure, Article> result = await _repository.getArticle(id);
    result.fold(
      (error) => _article = ArticleError(error: error.message, icon: error.icon), 
      (article) => _article = ArticleSuccess(article: article)
    );
    notifyListeners();
  }
}
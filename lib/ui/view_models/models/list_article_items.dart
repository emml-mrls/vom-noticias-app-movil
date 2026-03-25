import 'package:vom_app/domain/entities/article.dart';

sealed class ListArticleItems {}

final class ArticleItem extends ListArticleItems {
  final Article article;
  ArticleItem(this.article);
}

final class AddItem extends ListArticleItems {}

final class FooterItem extends ListArticleItems {}
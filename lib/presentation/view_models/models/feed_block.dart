import 'package:vom_app/domain/entities/article.dart';
import 'package:vom_app/presentation/view_models/models/card_variant.dart';

sealed class FeedBlock {}

final class ArticleBlock extends FeedBlock {
  final Article article;
  final CardVariant variant;
  ArticleBlock(this.article, this.variant);
}

final class AdBlock extends FeedBlock {}

final class FooterBlock extends FeedBlock {}
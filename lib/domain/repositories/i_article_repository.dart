import 'package:dartz/dartz.dart';
import 'package:vom_app/core/error/failure.dart';
import 'package:vom_app/domain/entities/article.dart';

abstract class IArticleRepository {
  Future<Either<Failure,List<Article>>> getAll();
  Future<Either<Failure,List<Article>>> getByCat(int catid);
  Future<Either<Failure,List<Article>>> getLatest({int limit = 5, int offset = 0});
  Future<Either<Failure, Article>> getArticle(int id);
}
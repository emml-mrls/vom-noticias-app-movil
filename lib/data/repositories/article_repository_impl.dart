import 'package:dartz/dartz.dart';
import 'package:vom_app/core/error/exceptions.dart';
import 'package:vom_app/core/error/failure.dart';
import 'package:vom_app/data/datasources/article_api_data_source.dart';
import 'package:vom_app/domain/entities/article.dart';
import 'package:vom_app/domain/repositories/i_article_repository.dart';

class ArticleRepositoryImpl extends IArticleRepository{
  final ArticleApiDataSource _articleApiDataSource;
  ArticleRepositoryImpl({required ArticleApiDataSource articleApiDataSource}) : _articleApiDataSource = articleApiDataSource;

  Future<Either<Failure, T>> _checkErrors<T> (Future<T> Function() request) async{
    try {
      return Right(await request());
    }
    on NetworkException {
      return const Left(NetworkFailure());
    }
    on ParseException {
      return const Left(ParseFailure());
    }
    on ServerException {
      return const Left(ServerFailure());
    }
    catch (e) {
      return const Left(UnknownFailure());
    }
  }

  @override
  Future <Either<Failure,List<Article>>> getAll() async {
    return _checkErrors(()async {
      final apiData = await _articleApiDataSource.getAll();
      return apiData.map<Article>((n) => n.toEntity()).toList();
    });
  }
  @override
 Future<Either<Failure,List<Article>>> getLatest({int limit = 5, int offset = 5}) async {
    return const Right([]);
  }

  @override
  Future <Either<Failure,List<Article>>> getByCat(int catid) async {
    return _checkErrors(() async {
      final apiData = await _articleApiDataSource.getByCat(catid);
      return apiData.map<Article>((n) => n.toEntity()).toList();
    });
  }

  @override
  Future <Either<Failure, Article>> getArticle(int id) async {
    return _checkErrors(() async {
      final apiData = await _articleApiDataSource.getArticle(id);
      return apiData.toEntity();
    });
  }
}
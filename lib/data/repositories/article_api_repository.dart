import 'package:dartz/dartz.dart';
import 'package:vom_app/core/error/exceptions.dart';
import 'package:vom_app/core/error/failure.dart';
import 'package:vom_app/core/network/i_network_info.dart';
import 'package:vom_app/data/models/article_model.dart';
import 'package:vom_app/domain/entities/article.dart';
import 'package:vom_app/domain/repositories/i_article_repository.dart';
import 'package:vom_app/data/services/article_api_service.dart';

class ArticleApiRepository implements IArticleRepository {
  final ArticleApiService _apiService;
  final INetworkInfo _networkInfo;
  final String urlbase = 'https://vomnoticias.com/administrator/emml/services/index.php?key=intelinsidecore';

  ArticleApiRepository({required ArticleApiService apiService, required INetworkInfo networkInfo}) : _apiService = apiService, _networkInfo = networkInfo;

  List<T> algo<T> (List<T> ts) {
    return ts;
  }

  Future<Either<Failure, T>> _checkErrors<T> (Future<T> Function() request) async{
    if (await _networkInfo.isConnected) return const Left(NetworkFailure());
    try {
      return Right(await request());
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
      final data = await _apiService.fetchData(Uri.parse("$urlbase&tipo=0"));
      return (data[0] as List).map((n) => ArticleModel.fromjson(n)).toList();
    });        
  }
  @override
 Future<Either<Failure,List<Article>>> getLatest({int limit = 5, int offset = 5}) async {
    return const Right([]);
  }

  @override
  Future <Either<Failure,List<Article>>> getByCat(int catid) async {
    return _checkErrors(() async {
      final data = await _apiService.fetchData(Uri.parse("$urlbase&tipo=1&categoryId=$catid"));
    return (data[0] as List).map((n) => ArticleModel.fromjson(n)).toList();
    });    
  }

  @override
  Future <Either<Failure, Article>> getArticle(int id) async {
    return _checkErrors(() async {
      final data = await _apiService.fetchData(Uri.parse("$urlbase&tipo=1&articleId=$id"));   
      return ArticleModel.fromjson(data[0][0]);
    });
  }
}
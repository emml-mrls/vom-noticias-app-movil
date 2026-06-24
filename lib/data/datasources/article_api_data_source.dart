import 'package:vom_app/core/error/exceptions.dart';
import 'package:vom_app/core/network/i_network_info.dart';
import 'package:vom_app/core/services/api_service.dart';
import 'package:vom_app/data/models/article_model.dart';

class ArticleApiDataSource {
  final ApiService _apiService;
  final INetworkInfo _networkInfo;
  final String urlbase = 'https://vomnoticias.com/administrator/emml/services/index.php?key=intelinsidecore';
  ArticleApiDataSource({required ApiService apiService, required INetworkInfo networkInfo}) : _apiService = apiService, _networkInfo = networkInfo;

  Future<T> _checkNetwork<T> (Future<T> Function() request) async {
    if (!await _networkInfo.isConnected) throw NetworkException();
    return request();
  }

  Future<List<ArticleModel>> getAll() async {
    return _checkNetwork(() async{
      const endpoint = '&tipo=0';
      final url = urlbase + endpoint;
      final data = await _apiService.fetchData(Uri.parse(url));

      return data.map<ArticleModel>((n) => ArticleModel.fromjson(n[0])).toList();
    });
  }

  Future<List<ArticleModel>> getByCat(int catid) async {
    return _checkNetwork(() async{
      final endpoint = "&tipo=2&categoryId=$catid";
      final url = urlbase + endpoint;
      final data = await _apiService.fetchData(Uri.parse(url));

      return data[0].map<ArticleModel>((n) => ArticleModel.fromjson(n)).toList();
    });
  }
  
  Future<ArticleModel> getArticle(int id) async{
    return _checkNetwork(() async {
      final endpoint = "&tipo=1&articleId=$id";
      final url = urlbase + endpoint;
      final data = await _apiService.fetchData(Uri.parse(url));

      return ArticleModel.fromjson(data[0][0]);
    });  
  }

}
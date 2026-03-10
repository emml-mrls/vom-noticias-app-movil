import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vom_app/core/error/exceptions.dart';

class ArticleApiService {
  final http.Client client;
  ArticleApiService({required this.client});
  
  Future<dynamic> fetchData (Uri url) async{
    final response = await client.get(url);

    if (response.statusCode == 200) {
      try {
        return jsonDecode(response.body);
      } catch (e) {
        throw const ParseException();
      }
    }
    else {
      throw ServerException(response.statusCode);
    }
  }
}
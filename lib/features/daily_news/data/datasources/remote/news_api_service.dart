import 'package:dio/dio.dart';
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/features/daily_news/data/models/article.dart';
import 'package:retrofit/http.dart';
part 'news_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService ;

  @GET('/top-headlines')
  Future<List<ArticleModel>> getNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query("q") String? query,
  });
}
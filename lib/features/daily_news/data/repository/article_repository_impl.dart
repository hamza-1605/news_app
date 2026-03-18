import 'package:dio/dio.dart';
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/features/daily_news/data/datasources/local/database/app_database.dart';
import 'package:news_app/features/daily_news/data/datasources/remote/news_api_service.dart';
import 'package:news_app/features/daily_news/data/mappers/article_mapper.dart';
import 'package:news_app/features/daily_news/data/models/article.dart';
import 'package:news_app/features/daily_news/domain/entities/article_entity.dart'; 
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository{
  final NewsApiService _newsApiService;
  final AppDatabase appDb;
  ArticleRepositoryImpl(this._newsApiService, this.appDb);

  // ---------------------------------  Remote News  ---------------------------------
  // Get News
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async{
    try {
      final articles = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        sources: newsSources,
      );

      if(articles.isEmpty){
        return DataFailed( DioException(
          requestOptions: RequestOptions( path: '/top-headlines' ),
          error: 'No articles found',
          type: DioExceptionType.badResponse, 
        ));
      }

      return DataSuccess(articles);  
    } 
    on DioException catch (dioError) {
      return DataFailed(dioError);
    } 
    catch (e) {
      return DataFailed(
        DioException(
          requestOptions: RequestOptions(path: '/top-headlines'),
          error: e.toString(),
          type: DioExceptionType.unknown,
        ),
      );
    }
  }


  // ---------------------------------  Local News  ---------------------------------
  // Get News locally
  @override
  Future<List<ArticleEntity>> getSavedArticles() async{
    final dataRows = await appDb.getAllArticles();

    return dataRows.map( (row) => row.toEntity() ).toList() ;
  }

  // Add News locally
  @override
  Future<void> addArticle( ArticleEntity article ) async {
    await appDb.insertArticle( article.toCompanion() );
  }

  // Delete News locally
  @override
  Future<void> removeArticle( int id ) async{
    await appDb.deleteArticle( id );
  }

}
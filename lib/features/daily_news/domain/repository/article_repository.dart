import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/features/daily_news/domain/entities/article_entity.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles({ required String query });

  Future<List<ArticleEntity>> getSavedArticles();

  Future<void> addArticle(ArticleEntity article);

  Future<void> removeArticleByUrl(String url);

  Future<bool> isArticleSaved(String url);
}
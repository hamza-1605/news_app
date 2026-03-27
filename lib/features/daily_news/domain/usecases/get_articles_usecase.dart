import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/core/usecases/usecase.dart';
import 'package:news_app/features/daily_news/domain/entities/article_entity.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';

class GetArticlesUsecase implements Usecase<DataState<List<ArticleEntity>>, String>{
  final ArticleRepository articleRepository;
  GetArticlesUsecase(this.articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({String? params}) {
    return articleRepository.getNewsArticles( query: params! );
  }
}
import 'package:news_app/core/usecases/usecase.dart';
import 'package:news_app/features/daily_news/domain/entities/article_entity.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';

class GetSavedArticlesUsecase implements Usecase< List<ArticleEntity>, void >{
  final ArticleRepository articleRepository;
  GetSavedArticlesUsecase(this.articleRepository);

  @override
  Future<List<ArticleEntity>> call({void params}) {
    return articleRepository.getSavedArticles();
  }
}
import 'package:news_app/core/usecases/usecase.dart';
import 'package:news_app/features/daily_news/domain/entities/article_entity.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';

class AddArticleUsecase implements Usecase< void, ArticleEntity>{
  final ArticleRepository articleRepository;
  AddArticleUsecase(this.articleRepository);

  @override
  Future<void> call({ArticleEntity? params}) {
    return articleRepository.addArticle(params!);
  }
}
import 'package:news_app/core/usecases/usecase.dart';
import 'package:news_app/features/daily_news/domain/entities/article_entity.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';

class DeleteArticleUsecase implements Usecase<void, ArticleEntity> {
  final ArticleRepository articleRepository;
  DeleteArticleUsecase(this.articleRepository);

  @override
  Future<void> call({ArticleEntity? params}) {
    return articleRepository.removeArticle(params!);
  }
}
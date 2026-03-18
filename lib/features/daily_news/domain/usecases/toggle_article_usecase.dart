import 'package:news_app/core/usecases/usecase.dart';
import 'package:news_app/features/daily_news/domain/entities/article_entity.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';

class ToggleArticleUsecase implements Usecase< void, ArticleEntity>{
  final ArticleRepository repository;
  ToggleArticleUsecase(this.repository);

  @override
  Future<void> call({ArticleEntity? params}) async {
    if (params == null) {
      throw Exception("Article is null");
    }

    final isSaved = await repository.isArticleSaved(params.url!);

    if (isSaved) {
      await repository.removeArticleByUrl(params.url!);
    } else {
      await repository.addArticle(params);
    }
  }
}
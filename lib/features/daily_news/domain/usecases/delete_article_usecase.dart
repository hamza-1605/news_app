import 'package:news_app/core/usecases/usecase.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';

class DeleteArticleUsecase implements Usecase<void, int> {
  final ArticleRepository articleRepository;
  DeleteArticleUsecase(this.articleRepository);

  @override
  Future<void> call({int? params}) {
    return articleRepository.removeArticle(params!);
  }
}
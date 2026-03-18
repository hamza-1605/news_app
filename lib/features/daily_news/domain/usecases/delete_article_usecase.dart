import 'package:news_app/core/usecases/usecase.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';

class DeleteArticleUsecase implements Usecase<void, String> {
  final ArticleRepository articleRepository;
  DeleteArticleUsecase(this.articleRepository);

  @override
  Future<void> call({String? params}) {
    if (params == null) throw Exception("Url is null");
    return articleRepository.removeArticleByUrl(params);
  }
}
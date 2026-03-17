import 'package:equatable/equatable.dart';
import 'package:news_app/features/daily_news/domain/entities/article_entity.dart';

abstract class LocalArticlesEvent extends Equatable{
  final ArticleEntity? articleEntity;
  const LocalArticlesEvent({this.articleEntity});

  @override
  List<Object> get props => [articleEntity!]; 
}

class GetSavedArticles extends LocalArticlesEvent{
  const GetSavedArticles();
}
class AddArticle extends LocalArticlesEvent{
  const AddArticle( ArticleEntity articleEntity ) : super(articleEntity: articleEntity) ;
}
class DeleteArticle extends LocalArticlesEvent{
  const DeleteArticle(ArticleEntity articleEntity) : super(articleEntity: articleEntity) ;
}
import 'package:equatable/equatable.dart';
import 'package:news_app/features/daily_news/domain/entities/article_entity.dart';

abstract class LocalArticlesEvent extends Equatable{
  const LocalArticlesEvent();

  @override
  List<Object?> get props => []; 
}

class GetSavedArticles extends LocalArticlesEvent{
  const GetSavedArticles();
}


class AddArticle extends LocalArticlesEvent{
  final ArticleEntity? article;
  const AddArticle( this.article );

  @override
  List<Object?> get props => [article];
}


class DeleteArticle extends LocalArticlesEvent{
  final String? url;
  const DeleteArticle( this.url ) ;

  @override
  List<Object?> get props => [url];
}


class ToggleArticle extends LocalArticlesEvent {
  final ArticleEntity article;
  const ToggleArticle(this.article);

  @override
  List<Object?> get props => [article];
}
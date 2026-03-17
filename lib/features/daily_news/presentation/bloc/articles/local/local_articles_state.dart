import 'package:equatable/equatable.dart';
import 'package:news_app/features/daily_news/domain/entities/article_entity.dart';

abstract class LocalArticlesState extends Equatable{
  final List<ArticleEntity>? articleEntity;
  const LocalArticlesState({this.articleEntity});

  @override
  List<Object> get props => [articleEntity!]; 
}


class LocalArticlesLoading extends LocalArticlesState{
  const LocalArticlesLoading();
}

class LocalArticlesDone extends LocalArticlesState{
  const LocalArticlesDone( List<ArticleEntity> articles ) : super( articleEntity: articles ) ;
}
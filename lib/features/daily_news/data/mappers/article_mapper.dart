
import 'package:drift/drift.dart';
import 'package:news_app/features/daily_news/data/datasources/local/database/app_database.dart';
import 'package:news_app/features/daily_news/data/models/article.dart';
import 'package:news_app/features/daily_news/domain/entities/article_entity.dart';

extension ArticleEntityMapper on ArticleEntity{

  ArticlesCompanion toCompanion(){
    return ArticlesCompanion.insert(
      author: Value(author),
      content: Value(content),
      description: Value(description),
      publishedAt: Value(publishedAt),
      title: Value(title),
      url: Value(url),
      urlToImage: Value(urlToImage),
    );
  }
}


extension DriftArticleMapper on Article{

  ArticleEntity toEntity(){
    return ArticleEntity(
      id: id,
      author: author,
      content: content,
      description: description,
      publishedAt: publishedAt,
      title: title,
      url: url,
      urlToImage: urlToImage,
    );
  }
}

extension ArticleModelMapper on ArticleModel {
  
  ArticleEntity modeltoEntity() {
    return ArticleEntity(
      id: id,
      author: author,
      content: content,
      description: description,
      publishedAt: publishedAt,
      title: title,
      url: url,
      urlToImage: urlToImage,
    );
  }
}
import 'package:news_app/features/daily_news/domain/entities/article_entity.dart';

// ignore: must_be_immutable
class ArticleModel extends ArticleEntity{
  const ArticleModel({
    super.id,
    super.author,
    super.content,
    super.description,
    super.publishedAt,
    super.title,
    super.url,
    super.urlToImage,
  });


  factory ArticleModel.fromJson( Map<String, dynamic> json ){
    return ArticleModel(
      author : json["author"], 
      content : json["content"] ?? "", 
      description : json["description"] ?? "", 
      publishedAt : json["publishedAt"] ?? "", 
      title : json["title"] ?? "", 
      url : json["url"] ?? "", 
      urlToImage : json["urlToImage"] ?? "", 
    );
  }

}
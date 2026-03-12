import 'package:news_app/daily_news/domain/entities/article_entity.dart';

// ignore: must_be_immutable
class ArticleModel extends ArticleEntity{
  const ArticleModel({
    int? id,
    String? author,
    String? content,
    String? description,
    String? publishedAt,
    String? title,
    String? url,
    String? urlToImage,
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
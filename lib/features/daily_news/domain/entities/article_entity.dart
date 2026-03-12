import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable{
  final int ? id;
  final String ? author;
  final String ? content;
  final String ? description;
  final String ? publishedAt;
  final String ? title;
  final String ? url;
  final String ? urlToImage;

  const ArticleEntity({
    this.id,
    this.author,
    this.content,
    this.description,
    this.publishedAt,
    this.title,
    this.url,
    this.urlToImage
  });


  @override
  List<Object?> get props {
    return [
      id,
      author,
      content,
      description,
      publishedAt,
      title,
      url,
      urlToImage,
    ];
  }
}
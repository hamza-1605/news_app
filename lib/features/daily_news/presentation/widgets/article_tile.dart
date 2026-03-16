import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/features/daily_news/domain/entities/article_entity.dart';
import '../pages/article_page.dart';

class ArticleTile extends StatelessWidget {
  final ArticleEntity article;

  const ArticleTile({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    String formattedDate = "";
    String formattedTime = "";

    if(article.publishedAt != null){
      DateTime date = DateTime.parse( article.publishedAt! );
      formattedDate = DateFormat.Hm().format(date);
      formattedTime = DateFormat.yMMMEd().format(date);
    }

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ArticlePage(article: article),
          ),
        );
      },

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Article Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: article.urlToImage != null
                  ? Image.network(
                      article.urlToImage!,
                      width: 120,
                      height: 150,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      width: 120,
                      height: 150,
                      color: Colors.grey.shade300,
                      child: const Icon(Icons.image),
                    ),
            ),

            const SizedBox(width: 12),

            /// Article Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title
                  Text(
                    article.title ?? "No Title",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  /// Description
                  Text(
                    article.description ?? "*No description available*",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Author 
                  if (article.author != null)
                    Text(
                      article.author!,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade500,
                      ),
                    ),

                  // Date
                  if (article.publishedAt != null)
                    Text(
                      '$formattedTime, $formattedDate',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade500,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
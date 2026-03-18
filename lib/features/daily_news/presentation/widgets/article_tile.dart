import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../pages/home/article_page.dart';
import 'package:news_app/features/daily_news/domain/entities/article_entity.dart';

class ArticleTile extends StatelessWidget {
  final ArticleEntity article;

  const ArticleTile({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    String formattedDate = "";
    String formattedTime = "";

    if(article.publishedAt != null){
      try {
        DateTime date = DateTime.parse(article.publishedAt!);
        formattedTime = DateFormat.Hm().format(date);
        formattedDate = DateFormat.yMMMEd().format(date);
      } catch (e) {
        formattedTime = "";
        formattedDate = "";
      }
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
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: article.urlToImage != null
                ? Image.network(
                    article.urlToImage!,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress){
                      if(loadingProgress == null) return child;
                      return SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Center(
                          child: CircularProgressIndicator(
                            constraints: BoxConstraints(
                              maxHeight: 40,
                              maxWidth: 40,
                              minHeight: 40,
                              minWidth: 40,
                            ),
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) => Container(
                        height: 200,
                        width: double.infinity,
                        color: Colors.grey.shade300,
                        child: const Icon(Icons.broken_image),
                      ),
                    )
                : Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.image),
                  ),
            ),
         
            const SizedBox(height: 12),
            // Title
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
                
            const SizedBox(height: 6),

            // Date
            if (article.publishedAt != null)
              Text(
                '$formattedDate − $formattedTime',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade500,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
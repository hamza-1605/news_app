import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:news_app/features/daily_news/domain/entities/article_entity.dart';
import 'package:news_app/features/daily_news/presentation/bloc/articles/local/local_articles_bloc.dart';
import 'package:news_app/features/daily_news/presentation/bloc/articles/local/local_articles_event.dart';
import '../pages/home/article_page.dart';

class SavedArticleTile extends StatelessWidget {
  final ArticleEntity article;

  const SavedArticleTile({super.key, required this.article});

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
          )
        );
      },

      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Column(
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
                    
                // // Author 
                // if (article.author != null)
                //   Text(
                //     article.author!,
                //     overflow: TextOverflow.ellipsis,
                //     style: TextStyle(
                //       fontSize: 12,
                //       color: Colors.grey.shade500,
                //     ),
                //   ),
                    
                // Date
                if (article.publishedAt != null)
                  Text(
                    '$formattedTime − $formattedDate',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade500,
                    ),
                  ),
              ],
            ),

            FilledButton(
              onPressed: () => handleRemoveBookmark(context),
              child: Icon(Icons.bookmark_remove)
            ),
          ],
        ),
      ),
    );
  }
  
  
  void handleRemoveBookmark(BuildContext context){
    if (article.id == null) {
      print("ID is null ❌");
      return;
    }

    context.read<LocalArticlesBloc>().add(DeleteArticle(article.id!));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Article Removed Successfully!"),
        backgroundColor: Colors.black,
      ),
    );
  }
}
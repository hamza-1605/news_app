import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:news_app/core/utils/utility_functions.dart';
import 'package:news_app/features/daily_news/domain/entities/article_entity.dart';
import 'package:news_app/features/daily_news/presentation/bloc/articles/local/local_articles_bloc.dart';
import 'package:news_app/features/daily_news/presentation/bloc/articles/local/local_articles_event.dart';
import 'package:news_app/features/daily_news/presentation/bloc/articles/local/local_articles_state.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key, required this.article});
  final ArticleEntity article;

  @override
  Widget build(BuildContext context) {
    String formattedDate = "";
    String formattedTime = "";

    if(article.publishedAt != null){
      DateTime date = DateTime.parse( article.publishedAt! );
      formattedDate = DateFormat.Hm().format(date);
      formattedTime = DateFormat.yMMMEd().format(date);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("News"),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Article Image
            if (article.urlToImage != null)
              Image.network(
                article.urlToImage!,
                width: double.infinity,
                // height: 220,
                fit: BoxFit.contain,
              ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// Title
                  Text(
                    article.title ?? "No Title",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// Author + Date
                  if (article.author != null)
                    Text(
                      article.author!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),


                  if (article.publishedAt != null)
                    Text(
                      '$formattedTime, $formattedDate',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),

                  const SizedBox(height: 20),
                  
                  /// Description
                  if (article.description != null)
                    Text(
                      article.description!,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.4,
                      ),
                    ),

                  const SizedBox(height: 20),

                  /// Content
                  if (article.content != null)
                    Text(
                      article.content!,
                      style: const TextStyle(
                        fontSize: 15,
                        height: 1.6,
                      ),
                    ),

                  const SizedBox(height: 30),

                  /// Read More Button
                  if (article.url != null)
                    Center(
                      child: ElevatedButton(
                        onPressed: () => launchURL(article.url ?? ""),
                        child: const Text("Read Full Article"),
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      ),

      floatingActionButton: 
        BlocBuilder<LocalArticlesBloc, LocalArticlesState>(
          builder: (context, state) {
            bool isSaved = false;

            if (state is LocalArticlesDone) {
              isSaved = state.articleEntity!.any(
                (a) => a.url == article.url,
              );
            }

            return FloatingActionButton(
              onPressed: () => handleToggleBookmark(context, isSaved),
              child: Icon(
                isSaved ? Icons.bookmark : Icons.bookmark_border,
              ),
            );
          },
        ),
    );
  }



  void handleToggleBookmark(BuildContext context, bool isSaved) {
    BlocProvider.of<LocalArticlesBloc>(context).add(ToggleArticle(article));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isSaved
              ? "Article Removed"
              : "Article Saved Successfully!",
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
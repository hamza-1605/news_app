import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/daily_news/presentation/bloc/articles/remote/remote_articles_bloc.dart';
import 'package:news_app/features/daily_news/presentation/bloc/articles/remote/remote_articles_event.dart';
import 'package:news_app/features/daily_news/presentation/bloc/articles/remote/remote_articles_state.dart';
import 'package:news_app/features/daily_news/presentation/widgets/article_tile.dart';

class BlocBody extends StatelessWidget {
  const BlocBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteArticlesBloc, RemoteArticlesState>(
      builder: (context, state) {
        
        if(state is RemoteArticlesLoading){
          return const Center(child: CircularProgressIndicator());
        }
        
        // Error
        if(state is RemoteArticlesError){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Failed to load news."),
                const Text("Check your Internet connection and try again."),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    context.read<RemoteArticlesBloc>().add(GetArticles( query: "Cricket"));
                  },
                  child: const Text("Retry"),
                ),
              ],
            ),);
        }
        
        if(state is RemoteArticlesDone){
          final articles = state.articles ?? [];
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return ArticleTile(article: state.articles![index]);
            },
          );
        }
        
        return SizedBox();
      },
    );
  }
}
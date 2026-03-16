import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/daily_news/presentation/bloc/articles/remote/remote_articles_bloc.dart';
import 'package:news_app/features/daily_news/presentation/bloc/articles/remote/remote_articles_state.dart';
import 'package:news_app/features/daily_news/presentation/widgets/article_tile.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text("Daily News") ),

      body: buildBody(),
    );
  }



  BlocBuilder buildBody(){
    return BlocBuilder<RemoteArticlesBloc, RemoteArticlesState>(
      builder: (context, state) {
        if(state is RemoteArticlesLoading){
          return const Center(child: CircularProgressIndicator());
        }
        
        if(state is RemoteArticlesError){
          return Center(child: IconButton(onPressed: (){}, icon: Icon(Icons.refresh)));
        }
        
        if(state is RemoteArticlesDone){
          return ListView.builder(
            itemCount: state.articles!.length,
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
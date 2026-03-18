import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/daily_news/presentation/bloc/articles/local/local_articles_bloc.dart';
import 'package:news_app/features/daily_news/presentation/bloc/articles/local/local_articles_state.dart';
import 'package:news_app/features/daily_news/presentation/widgets/article_tile.dart';

class SavedNews extends StatelessWidget {
  const SavedNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: const Text("Saved News"),
      ),
    
      body: buildBody(),
    );
  }



  BlocBuilder buildBody(){
    return BlocBuilder<LocalArticlesBloc, LocalArticlesState>(
      builder: (context, state) {
        if(state is LocalArticlesLoading){
          return const Center(child: CircularProgressIndicator());
        }
        
        if(state is LocalArticlesDone){
          if(state.articleEntity!.isNotEmpty){
            return ListView.builder(
              itemCount: state.articleEntity!.length,
              itemBuilder: (context, index) {
                return ArticleTile(article: state.articleEntity![index]);
              },
            );
          } else{
            return Center( child: Text("No Saved News Found.") );
          }
        }
        
        return Center( child: Text("Nooooooooooooooooooooooooo.") );
      },
    ); 
  }
}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/daily_news/domain/usecases/add_article_usecase.dart';
import 'package:news_app/features/daily_news/domain/usecases/delete_article_usecase.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_saved_articles_usecase.dart';
import 'package:news_app/features/daily_news/presentation/bloc/articles/local/local_articles_event.dart';
import 'package:news_app/features/daily_news/presentation/bloc/articles/local/local_articles_state.dart';

class LocalArticlesBloc extends Bloc<LocalArticlesEvent, LocalArticlesState>{
  final GetSavedArticlesUsecase getSavedArticlesUsecase;
  final AddArticleUsecase addArticleUsecase;
  final DeleteArticleUsecase deleteArticleUsecase;

   LocalArticlesBloc(
    this.getSavedArticlesUsecase, 
    this.addArticleUsecase, 
    this.deleteArticleUsecase
  ) : super( const LocalArticlesLoading() ){
    on <GetSavedArticles> (onGetSavedArticles);
    on <AddArticle> (onAddArticle);
    on <DeleteArticle> (onDeleteArticle);
  }


  void onGetSavedArticles(GetSavedArticles event, Emitter<LocalArticlesState> emit) async{
    final articles = await getSavedArticlesUsecase();
    emit( LocalArticlesDone(articles) );
  }

  void onAddArticle(AddArticle addArticle, Emitter<LocalArticlesState> emit) async{
    await addArticleUsecase(params: addArticle.articleEntity);

    final articles = await getSavedArticlesUsecase();
    emit( LocalArticlesDone(articles) );
  }

  void onDeleteArticle(DeleteArticle deleteArticle, Emitter<LocalArticlesState> emit) async{
    await deleteArticleUsecase(params: deleteArticle.articleEntity);

    final articles = await getSavedArticlesUsecase();
    emit( LocalArticlesDone(articles) );
  }
}
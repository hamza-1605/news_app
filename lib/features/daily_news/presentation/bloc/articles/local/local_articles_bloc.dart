import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/daily_news/domain/usecases/add_article_usecase.dart';
import 'package:news_app/features/daily_news/domain/usecases/delete_article_usecase.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_saved_articles_usecase.dart';
import 'package:news_app/features/daily_news/domain/usecases/toggle_article_usecase.dart';
import 'package:news_app/features/daily_news/presentation/bloc/articles/local/local_articles_event.dart';
import 'package:news_app/features/daily_news/presentation/bloc/articles/local/local_articles_state.dart';

class LocalArticlesBloc extends Bloc<LocalArticlesEvent, LocalArticlesState>{
  final GetSavedArticlesUsecase getSavedArticlesUsecase;
  final AddArticleUsecase addArticleUsecase;
  final DeleteArticleUsecase deleteArticleUsecase;
  final ToggleArticleUsecase toggleArticleUsecase;

   LocalArticlesBloc(
    this.getSavedArticlesUsecase, 
    this.addArticleUsecase, 
    this.deleteArticleUsecase,
    this.toggleArticleUsecase
  ) : super( const LocalArticlesLoading() ){
    on <GetSavedArticles> (onGetSavedArticles);
    on <AddArticle> (onAddArticle);
    on <DeleteArticle> (onDeleteArticle);
    on <ToggleArticle> (onToggleArticle);
  }


  void onGetSavedArticles(GetSavedArticles event, Emitter<LocalArticlesState> emit) async{
    final articles = await getSavedArticlesUsecase();
    emit( LocalArticlesDone(articles) );
  }


  void onAddArticle(AddArticle addArticle, Emitter<LocalArticlesState> emit) async{
    await addArticleUsecase(params: addArticle.article);

    final articles = await getSavedArticlesUsecase();
    emit( LocalArticlesDone(articles) );
  }


  void onDeleteArticle(DeleteArticle deleteArticle, Emitter<LocalArticlesState> emit) async{
    await deleteArticleUsecase(params: deleteArticle.url);

    final articles = await getSavedArticlesUsecase();
    emit( LocalArticlesDone(articles) );
  }


  void onToggleArticle(ToggleArticle event, Emitter<LocalArticlesState> emit) async{
    await toggleArticleUsecase(params: event.article);

    final articles = await getSavedArticlesUsecase();
    emit(LocalArticlesDone(articles));
  }
}
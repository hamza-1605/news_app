import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_articles_usecase.dart';
import 'package:news_app/features/daily_news/presentation/bloc/articles/remote/remote_articles_event.dart';
import 'package:news_app/features/daily_news/presentation/bloc/articles/remote/remote_articles_state.dart';

class RemoteArticlesBloc extends Bloc<RemoteArticlesEvent, RemoteArticlesState> {
  final GetArticlesUsecase getArticlesUsecase;

  RemoteArticlesBloc(this.getArticlesUsecase) : super( RemoteArticlesLoading() ){
    on <GetArticles> (onGetArticles); 
  }
  
  
  void onGetArticles(GetArticles event, Emitter<RemoteArticlesState> emit) async{
    final dataState = await getArticlesUsecase.call(params: event.query);

    if( dataState is DataSuccess && dataState.data!.isNotEmpty ){
      emit(
        RemoteArticlesDone( dataState.data! )
      );
    }
    else if( dataState is DataFailed ){
      emit(
        RemoteArticlesError( dataState.error! )
      );
    }
  }


}
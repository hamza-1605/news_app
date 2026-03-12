import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/features/daily_news/data/datasources/remote/news_api_service.dart';
import 'package:news_app/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_articles_usecase.dart';
import 'package:news_app/features/daily_news/presentation/bloc/articles/remote/remote_articles_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async{
  // Dio
  sl.registerSingleton<Dio>( Dio() );
  // News API Service
  sl.registerSingleton<NewsApiService>( NewsApiService( sl() ));

  // Article repository ==> Contract
  sl.registerSingleton<ArticleRepository>(
    ArticleRepositoryImpl( sl() )
  );

  // Get Articles Usecase
  sl.registerSingleton<GetArticlesUsecase>( 
    GetArticlesUsecase( sl() )
  );


  // Articles BLOC 
  sl.registerFactory<RemoteArticlesBloc>(
    () => RemoteArticlesBloc( sl() )
  );

}
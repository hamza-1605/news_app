import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/features/daily_news/data/datasources/local/database/app_database.dart';
import 'package:news_app/features/daily_news/data/datasources/remote/news_api_service.dart';
import 'package:news_app/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:news_app/features/daily_news/domain/usecases/add_article_usecase.dart';
import 'package:news_app/features/daily_news/domain/usecases/delete_article_usecase.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_articles_usecase.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_saved_articles_usecase.dart';
import 'package:news_app/features/daily_news/presentation/bloc/articles/local/local_articles_bloc.dart';
import 'package:news_app/features/daily_news/presentation/bloc/articles/remote/remote_articles_bloc.dart';

final sl = GetIt.instance;        // Service Locator

Future<void> initializeDependencies() async{
  // Dio
  sl.registerSingleton<Dio>( Dio() );

  // Drift Database
  sl.registerSingleton<AppDatabase>( AppDatabase() );

  // News API Service
  sl.registerSingleton<NewsApiService>( NewsApiService( sl() ));

// Article repository ==> Contract          (ArticleRepo because GetArticles Usecase uses ArticleRepo); also we can't instantiate an abstract class, so we made a Contract by using its implementation class
  sl.registerSingleton<ArticleRepository>(
    ArticleRepositoryImpl( sl() , sl() )
  );

  // Get Remote Articles Usecase
  sl.registerSingleton<GetArticlesUsecase>( 
    GetArticlesUsecase( sl() )
  );

  // --------------------- Local DB Usecase -------------------------------------
  sl.registerSingleton<GetSavedArticlesUsecase>(
    GetSavedArticlesUsecase( sl() )
  );
  sl.registerSingleton<AddArticleUsecase>(
    AddArticleUsecase( sl() )
  );
  sl.registerSingleton<DeleteArticleUsecase>(
    DeleteArticleUsecase( sl() )
  );


  // Remote Articles BLOC              registorFactory because the state will be updated, so new instance should be generated.
  sl.registerFactory<RemoteArticlesBloc>(
    () => RemoteArticlesBloc( sl() )
  );

  // Local Articles BLOC
  sl.registerFactory<LocalArticlesBloc>(
    () => LocalArticlesBloc( sl(), sl(), sl() )
  );

}
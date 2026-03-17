import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/config/themes/app_theme.dart';
import 'package:news_app/features/daily_news/data/datasources/local/database/app_database.dart';
import 'package:news_app/features/daily_news/presentation/bloc/articles/remote/remote_articles_bloc.dart';
import 'package:news_app/features/daily_news/presentation/bloc/articles/remote/remote_articles_event.dart';
import 'package:news_app/features/daily_news/presentation/pages/home/daily_news.dart';
// import 'package:news_app/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:news_app/injection_container.dart';

late AppDatabase appDb;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  appDb = AppDatabase();
  // await initializeDependencies();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (context) => sl()..add( GetArticles() ),
      child: MaterialApp(
        title: 'Daily News App',
        theme: appTheme(),
        home: DailyNews(),
      ),
    );
  }
}
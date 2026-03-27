import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/daily_news/presentation/bloc/articles/remote/remote_articles_bloc.dart';
import 'package:news_app/features/daily_news/presentation/bloc/articles/remote/remote_articles_event.dart';
import 'package:news_app/features/daily_news/presentation/pages/home/saved_news.dart';
import 'package:news_app/features/daily_news/presentation/widgets/bloc_body.dart';

class DailyNews extends StatefulWidget {
  const DailyNews({super.key});

  @override
  State<DailyNews> createState() => _DailyNewsState();
}

class _DailyNewsState extends State<DailyNews> {
  final List<String> categories = const [
    "Cricket",
    "Pakistan",
    "Iran",
    "US",
    "Islam",
    "Technology",
    "Sports",
    "World",
    "WWE",
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: AppBar( 
          centerTitle: false,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            children: [
              Image.asset('assets/images/daily_news_logo.png', width: 40),
              const Text("Daily News"),
            ],
          ),
      
          actions: [
            InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SavedNews())),
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(Icons.bookmark, size: 30.0),
              ),
            )
          ],

          bottom: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.center ,
            tabs: categories.map( (e) => Tab(text: e) ).toList(),
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });

              context.read<RemoteArticlesBloc>().add(
                GetArticles(query: categories[index]),
              );
            },
          ),
        ),
      
      
        body: BlocBody(
          key: ValueKey(categories[currentIndex]),
        ),
      
      ),
    );
  }
}
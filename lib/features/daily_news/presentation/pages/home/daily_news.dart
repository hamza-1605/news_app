import 'package:flutter/material.dart';
import 'package:news_app/features/daily_news/presentation/pages/home/saved_news.dart';
import 'package:news_app/features/daily_news/presentation/widgets/bloc_body.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),


      body: BlocBody(),

    );
  }
}
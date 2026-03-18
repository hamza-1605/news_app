import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:news_app/features/daily_news/data/datasources/local/tables/articles.dart';

part 'app_database.g.dart';


@DriftDatabase(tables: [Articles])
class AppDatabase extends _$AppDatabase{
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Article>> getAllArticles(){
    return select(articles).get();
  } 
  
  Future<int> insertArticle(ArticlesCompanion article){
    return into(articles).insert(
      article,
      mode: InsertMode.insertOrIgnore, // ✅ prevents crash  
    );
  }

  Future<int> deleteArticle(String url){
    return (delete(articles)..where( (tbl) => tbl.url.equals(url) )).go();
  }

  Future<bool> isArticleSaved(String url) async {
    final result = await 
      (select(articles)..where( (tbl) => tbl.url.equals(url) )).get();

    return result.isNotEmpty;
  }
}


LazyDatabase _openConnection(){
  return LazyDatabase( () async{
    final dir = await getApplicationDocumentsDirectory();
    final file = File( p.join( dir.path, 'news_app_db'));
    return NativeDatabase(file);
  });
}
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
    return into(articles).insert(article);
  }
  Future<int> deleteArticle(int id){
    return (delete(articles)..where( (tbl) => tbl.id.equals(id) )).go();
  }
}


LazyDatabase _openConnection(){
  return LazyDatabase( () async{
    final dir = await getApplicationDocumentsDirectory();
    final file = File( p.join( dir.path, 'news_app_db'));
    return NativeDatabase(file);
  });
}
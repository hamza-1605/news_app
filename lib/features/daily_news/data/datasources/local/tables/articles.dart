import 'package:drift/drift.dart';

// Schema for Drift DB
class Articles extends Table{
  IntColumn get id => integer().autoIncrement()();

  TextColumn get author => text().nullable()();
  TextColumn get content => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get publishedAt => text().nullable()();
  TextColumn get title => text().nullable()();
  TextColumn get url => text()();
  TextColumn get urlToImage => text().nullable()();
  
  @override
  List<Set<Column>> get uniqueKeys => [
    {url}, // ✅ prevents duplicates
  ];
}
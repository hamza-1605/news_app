// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ArticlesTableTable extends ArticlesTable
    with TableInfo<$ArticlesTableTable, ArticlesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArticlesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
    'author',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _publishedAtMeta = const VerificationMeta(
    'publishedAt',
  );
  @override
  late final GeneratedColumn<String> publishedAt = GeneratedColumn<String>(
    'published_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _urlToImageMeta = const VerificationMeta(
    'urlToImage',
  );
  @override
  late final GeneratedColumn<String> urlToImage = GeneratedColumn<String>(
    'url_to_image',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    author,
    content,
    description,
    publishedAt,
    title,
    url,
    urlToImage,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'articles_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ArticlesTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('author')) {
      context.handle(
        _authorMeta,
        author.isAcceptableOrUnknown(data['author']!, _authorMeta),
      );
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('published_at')) {
      context.handle(
        _publishedAtMeta,
        publishedAt.isAcceptableOrUnknown(
          data['published_at']!,
          _publishedAtMeta,
        ),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    }
    if (data.containsKey('url_to_image')) {
      context.handle(
        _urlToImageMeta,
        urlToImage.isAcceptableOrUnknown(
          data['url_to_image']!,
          _urlToImageMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ArticlesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ArticlesTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      author: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}author'],
      ),
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      publishedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}published_at'],
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      ),
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      ),
      urlToImage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url_to_image'],
      ),
    );
  }

  @override
  $ArticlesTableTable createAlias(String alias) {
    return $ArticlesTableTable(attachedDatabase, alias);
  }
}

class ArticlesTableData extends DataClass
    implements Insertable<ArticlesTableData> {
  final int id;
  final String? author;
  final String? content;
  final String? description;
  final String? publishedAt;
  final String? title;
  final String? url;
  final String? urlToImage;
  const ArticlesTableData({
    required this.id,
    this.author,
    this.content,
    this.description,
    this.publishedAt,
    this.title,
    this.url,
    this.urlToImage,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || author != null) {
      map['author'] = Variable<String>(author);
    }
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String>(content);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || publishedAt != null) {
      map['published_at'] = Variable<String>(publishedAt);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    if (!nullToAbsent || urlToImage != null) {
      map['url_to_image'] = Variable<String>(urlToImage);
    }
    return map;
  }

  ArticlesTableCompanion toCompanion(bool nullToAbsent) {
    return ArticlesTableCompanion(
      id: Value(id),
      author: author == null && nullToAbsent
          ? const Value.absent()
          : Value(author),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      publishedAt: publishedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(publishedAt),
      title: title == null && nullToAbsent
          ? const Value.absent()
          : Value(title),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      urlToImage: urlToImage == null && nullToAbsent
          ? const Value.absent()
          : Value(urlToImage),
    );
  }

  factory ArticlesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ArticlesTableData(
      id: serializer.fromJson<int>(json['id']),
      author: serializer.fromJson<String?>(json['author']),
      content: serializer.fromJson<String?>(json['content']),
      description: serializer.fromJson<String?>(json['description']),
      publishedAt: serializer.fromJson<String?>(json['publishedAt']),
      title: serializer.fromJson<String?>(json['title']),
      url: serializer.fromJson<String?>(json['url']),
      urlToImage: serializer.fromJson<String?>(json['urlToImage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'author': serializer.toJson<String?>(author),
      'content': serializer.toJson<String?>(content),
      'description': serializer.toJson<String?>(description),
      'publishedAt': serializer.toJson<String?>(publishedAt),
      'title': serializer.toJson<String?>(title),
      'url': serializer.toJson<String?>(url),
      'urlToImage': serializer.toJson<String?>(urlToImage),
    };
  }

  ArticlesTableData copyWith({
    int? id,
    Value<String?> author = const Value.absent(),
    Value<String?> content = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<String?> publishedAt = const Value.absent(),
    Value<String?> title = const Value.absent(),
    Value<String?> url = const Value.absent(),
    Value<String?> urlToImage = const Value.absent(),
  }) => ArticlesTableData(
    id: id ?? this.id,
    author: author.present ? author.value : this.author,
    content: content.present ? content.value : this.content,
    description: description.present ? description.value : this.description,
    publishedAt: publishedAt.present ? publishedAt.value : this.publishedAt,
    title: title.present ? title.value : this.title,
    url: url.present ? url.value : this.url,
    urlToImage: urlToImage.present ? urlToImage.value : this.urlToImage,
  );
  ArticlesTableData copyWithCompanion(ArticlesTableCompanion data) {
    return ArticlesTableData(
      id: data.id.present ? data.id.value : this.id,
      author: data.author.present ? data.author.value : this.author,
      content: data.content.present ? data.content.value : this.content,
      description: data.description.present
          ? data.description.value
          : this.description,
      publishedAt: data.publishedAt.present
          ? data.publishedAt.value
          : this.publishedAt,
      title: data.title.present ? data.title.value : this.title,
      url: data.url.present ? data.url.value : this.url,
      urlToImage: data.urlToImage.present
          ? data.urlToImage.value
          : this.urlToImage,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ArticlesTableData(')
          ..write('id: $id, ')
          ..write('author: $author, ')
          ..write('content: $content, ')
          ..write('description: $description, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('title: $title, ')
          ..write('url: $url, ')
          ..write('urlToImage: $urlToImage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    author,
    content,
    description,
    publishedAt,
    title,
    url,
    urlToImage,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ArticlesTableData &&
          other.id == this.id &&
          other.author == this.author &&
          other.content == this.content &&
          other.description == this.description &&
          other.publishedAt == this.publishedAt &&
          other.title == this.title &&
          other.url == this.url &&
          other.urlToImage == this.urlToImage);
}

class ArticlesTableCompanion extends UpdateCompanion<ArticlesTableData> {
  final Value<int> id;
  final Value<String?> author;
  final Value<String?> content;
  final Value<String?> description;
  final Value<String?> publishedAt;
  final Value<String?> title;
  final Value<String?> url;
  final Value<String?> urlToImage;
  const ArticlesTableCompanion({
    this.id = const Value.absent(),
    this.author = const Value.absent(),
    this.content = const Value.absent(),
    this.description = const Value.absent(),
    this.publishedAt = const Value.absent(),
    this.title = const Value.absent(),
    this.url = const Value.absent(),
    this.urlToImage = const Value.absent(),
  });
  ArticlesTableCompanion.insert({
    this.id = const Value.absent(),
    this.author = const Value.absent(),
    this.content = const Value.absent(),
    this.description = const Value.absent(),
    this.publishedAt = const Value.absent(),
    this.title = const Value.absent(),
    this.url = const Value.absent(),
    this.urlToImage = const Value.absent(),
  });
  static Insertable<ArticlesTableData> custom({
    Expression<int>? id,
    Expression<String>? author,
    Expression<String>? content,
    Expression<String>? description,
    Expression<String>? publishedAt,
    Expression<String>? title,
    Expression<String>? url,
    Expression<String>? urlToImage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (author != null) 'author': author,
      if (content != null) 'content': content,
      if (description != null) 'description': description,
      if (publishedAt != null) 'published_at': publishedAt,
      if (title != null) 'title': title,
      if (url != null) 'url': url,
      if (urlToImage != null) 'url_to_image': urlToImage,
    });
  }

  ArticlesTableCompanion copyWith({
    Value<int>? id,
    Value<String?>? author,
    Value<String?>? content,
    Value<String?>? description,
    Value<String?>? publishedAt,
    Value<String?>? title,
    Value<String?>? url,
    Value<String?>? urlToImage,
  }) {
    return ArticlesTableCompanion(
      id: id ?? this.id,
      author: author ?? this.author,
      content: content ?? this.content,
      description: description ?? this.description,
      publishedAt: publishedAt ?? this.publishedAt,
      title: title ?? this.title,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (publishedAt.present) {
      map['published_at'] = Variable<String>(publishedAt.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (urlToImage.present) {
      map['url_to_image'] = Variable<String>(urlToImage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArticlesTableCompanion(')
          ..write('id: $id, ')
          ..write('author: $author, ')
          ..write('content: $content, ')
          ..write('description: $description, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('title: $title, ')
          ..write('url: $url, ')
          ..write('urlToImage: $urlToImage')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ArticlesTableTable articlesTable = $ArticlesTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [articlesTable];
}

typedef $$ArticlesTableTableCreateCompanionBuilder =
    ArticlesTableCompanion Function({
      Value<int> id,
      Value<String?> author,
      Value<String?> content,
      Value<String?> description,
      Value<String?> publishedAt,
      Value<String?> title,
      Value<String?> url,
      Value<String?> urlToImage,
    });
typedef $$ArticlesTableTableUpdateCompanionBuilder =
    ArticlesTableCompanion Function({
      Value<int> id,
      Value<String?> author,
      Value<String?> content,
      Value<String?> description,
      Value<String?> publishedAt,
      Value<String?> title,
      Value<String?> url,
      Value<String?> urlToImage,
    });

class $$ArticlesTableTableFilterComposer
    extends Composer<_$AppDatabase, $ArticlesTableTable> {
  $$ArticlesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get publishedAt => $composableBuilder(
    column: $table.publishedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get urlToImage => $composableBuilder(
    column: $table.urlToImage,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ArticlesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ArticlesTableTable> {
  $$ArticlesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get publishedAt => $composableBuilder(
    column: $table.publishedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get urlToImage => $composableBuilder(
    column: $table.urlToImage,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ArticlesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ArticlesTableTable> {
  $$ArticlesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get author =>
      $composableBuilder(column: $table.author, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get publishedAt => $composableBuilder(
    column: $table.publishedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get urlToImage => $composableBuilder(
    column: $table.urlToImage,
    builder: (column) => column,
  );
}

class $$ArticlesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ArticlesTableTable,
          ArticlesTableData,
          $$ArticlesTableTableFilterComposer,
          $$ArticlesTableTableOrderingComposer,
          $$ArticlesTableTableAnnotationComposer,
          $$ArticlesTableTableCreateCompanionBuilder,
          $$ArticlesTableTableUpdateCompanionBuilder,
          (
            ArticlesTableData,
            BaseReferences<
              _$AppDatabase,
              $ArticlesTableTable,
              ArticlesTableData
            >,
          ),
          ArticlesTableData,
          PrefetchHooks Function()
        > {
  $$ArticlesTableTableTableManager(_$AppDatabase db, $ArticlesTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ArticlesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ArticlesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ArticlesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> author = const Value.absent(),
                Value<String?> content = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> publishedAt = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<String?> url = const Value.absent(),
                Value<String?> urlToImage = const Value.absent(),
              }) => ArticlesTableCompanion(
                id: id,
                author: author,
                content: content,
                description: description,
                publishedAt: publishedAt,
                title: title,
                url: url,
                urlToImage: urlToImage,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> author = const Value.absent(),
                Value<String?> content = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> publishedAt = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<String?> url = const Value.absent(),
                Value<String?> urlToImage = const Value.absent(),
              }) => ArticlesTableCompanion.insert(
                id: id,
                author: author,
                content: content,
                description: description,
                publishedAt: publishedAt,
                title: title,
                url: url,
                urlToImage: urlToImage,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ArticlesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ArticlesTableTable,
      ArticlesTableData,
      $$ArticlesTableTableFilterComposer,
      $$ArticlesTableTableOrderingComposer,
      $$ArticlesTableTableAnnotationComposer,
      $$ArticlesTableTableCreateCompanionBuilder,
      $$ArticlesTableTableUpdateCompanionBuilder,
      (
        ArticlesTableData,
        BaseReferences<_$AppDatabase, $ArticlesTableTable, ArticlesTableData>,
      ),
      ArticlesTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ArticlesTableTableTableManager get articlesTable =>
      $$ArticlesTableTableTableManager(_db, _db.articlesTable);
}

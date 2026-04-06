import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'database.g.dart';

class Players extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  IntColumn get xp => integer().withDefault(const Constant(0))();
  IntColumn get level => integer().withDefault(const Constant(1))();
  TextColumn get stashBalance => text()(); // Store as string for Decimal
  TextColumn get unlockedLoot => text().nullable()(); // JSON list
  DateTimeColumn get lastLogin => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class QuestLocations extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get theme => text()(); // Enum string
  TextColumn get currentBalance => text()(); // Decimal
  TextColumn get allocatedBudget => text()(); // Decimal
  BoolColumn get isUnderSiege => boolean().withDefault(const Constant(false))();
  RealColumn get x => real()();
  RealColumn get y => real()();

  @override
  Set<Column> get primaryKey => {id};
}

class Transactions extends Table {
  TextColumn get id => text()();
  TextColumn get locationId => text().references(QuestLocations, #id)();
  TextColumn get amount => text()(); // Decimal
  TextColumn get type => text()(); // Enum string
  DateTimeColumn get timestamp => dateTime()();
  TextColumn get description => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class Loots extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get category => text()(); // Enum string
  TextColumn get rarity => text()(); // Enum string
  TextColumn get visualAssetPath => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class PayCycles extends Table {
  TextColumn get id => text()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime()();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  TextColumn get totalHarvested => text().withDefault(const Constant('0'))();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [Players, QuestLocations, Transactions, Loots, PayCycles])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? e]) : super(e ?? _openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'vault_quest.sqlite'));

    // if (Platform.isAndroid) {
    //   await applyWorkaroundToOpenSqlite3OnOldAndroidDevices();
    // }

    final cachebase = await getTemporaryDirectory();
    sqlite3.tempDirectory = cachebase.path;

    return NativeDatabase.createInBackground(file);
  });
}

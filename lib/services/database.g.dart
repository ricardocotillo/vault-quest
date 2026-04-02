// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $PlayersTable extends Players with TableInfo<$PlayersTable, Player> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlayersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _xpMeta = const VerificationMeta('xp');
  @override
  late final GeneratedColumn<int> xp = GeneratedColumn<int>(
    'xp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
    'level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _stashBalanceMeta = const VerificationMeta(
    'stashBalance',
  );
  @override
  late final GeneratedColumn<String> stashBalance = GeneratedColumn<String>(
    'stash_balance',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unlockedLootMeta = const VerificationMeta(
    'unlockedLoot',
  );
  @override
  late final GeneratedColumn<String> unlockedLoot = GeneratedColumn<String>(
    'unlocked_loot',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastLoginMeta = const VerificationMeta(
    'lastLogin',
  );
  @override
  late final GeneratedColumn<DateTime> lastLogin = GeneratedColumn<DateTime>(
    'last_login',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    xp,
    level,
    stashBalance,
    unlockedLoot,
    lastLogin,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'players';
  @override
  VerificationContext validateIntegrity(
    Insertable<Player> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('xp')) {
      context.handle(_xpMeta, xp.isAcceptableOrUnknown(data['xp']!, _xpMeta));
    }
    if (data.containsKey('level')) {
      context.handle(
        _levelMeta,
        level.isAcceptableOrUnknown(data['level']!, _levelMeta),
      );
    }
    if (data.containsKey('stash_balance')) {
      context.handle(
        _stashBalanceMeta,
        stashBalance.isAcceptableOrUnknown(
          data['stash_balance']!,
          _stashBalanceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_stashBalanceMeta);
    }
    if (data.containsKey('unlocked_loot')) {
      context.handle(
        _unlockedLootMeta,
        unlockedLoot.isAcceptableOrUnknown(
          data['unlocked_loot']!,
          _unlockedLootMeta,
        ),
      );
    }
    if (data.containsKey('last_login')) {
      context.handle(
        _lastLoginMeta,
        lastLogin.isAcceptableOrUnknown(data['last_login']!, _lastLoginMeta),
      );
    } else if (isInserting) {
      context.missing(_lastLoginMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Player map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Player(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      xp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}xp'],
      )!,
      level: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}level'],
      )!,
      stashBalance: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stash_balance'],
      )!,
      unlockedLoot: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unlocked_loot'],
      ),
      lastLogin: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_login'],
      )!,
    );
  }

  @override
  $PlayersTable createAlias(String alias) {
    return $PlayersTable(attachedDatabase, alias);
  }
}

class Player extends DataClass implements Insertable<Player> {
  final String id;
  final String name;
  final int xp;
  final int level;
  final String stashBalance;
  final String? unlockedLoot;
  final DateTime lastLogin;
  const Player({
    required this.id,
    required this.name,
    required this.xp,
    required this.level,
    required this.stashBalance,
    this.unlockedLoot,
    required this.lastLogin,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['xp'] = Variable<int>(xp);
    map['level'] = Variable<int>(level);
    map['stash_balance'] = Variable<String>(stashBalance);
    if (!nullToAbsent || unlockedLoot != null) {
      map['unlocked_loot'] = Variable<String>(unlockedLoot);
    }
    map['last_login'] = Variable<DateTime>(lastLogin);
    return map;
  }

  PlayersCompanion toCompanion(bool nullToAbsent) {
    return PlayersCompanion(
      id: Value(id),
      name: Value(name),
      xp: Value(xp),
      level: Value(level),
      stashBalance: Value(stashBalance),
      unlockedLoot: unlockedLoot == null && nullToAbsent
          ? const Value.absent()
          : Value(unlockedLoot),
      lastLogin: Value(lastLogin),
    );
  }

  factory Player.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Player(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      xp: serializer.fromJson<int>(json['xp']),
      level: serializer.fromJson<int>(json['level']),
      stashBalance: serializer.fromJson<String>(json['stashBalance']),
      unlockedLoot: serializer.fromJson<String?>(json['unlockedLoot']),
      lastLogin: serializer.fromJson<DateTime>(json['lastLogin']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'xp': serializer.toJson<int>(xp),
      'level': serializer.toJson<int>(level),
      'stashBalance': serializer.toJson<String>(stashBalance),
      'unlockedLoot': serializer.toJson<String?>(unlockedLoot),
      'lastLogin': serializer.toJson<DateTime>(lastLogin),
    };
  }

  Player copyWith({
    String? id,
    String? name,
    int? xp,
    int? level,
    String? stashBalance,
    Value<String?> unlockedLoot = const Value.absent(),
    DateTime? lastLogin,
  }) => Player(
    id: id ?? this.id,
    name: name ?? this.name,
    xp: xp ?? this.xp,
    level: level ?? this.level,
    stashBalance: stashBalance ?? this.stashBalance,
    unlockedLoot: unlockedLoot.present ? unlockedLoot.value : this.unlockedLoot,
    lastLogin: lastLogin ?? this.lastLogin,
  );
  Player copyWithCompanion(PlayersCompanion data) {
    return Player(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      xp: data.xp.present ? data.xp.value : this.xp,
      level: data.level.present ? data.level.value : this.level,
      stashBalance: data.stashBalance.present
          ? data.stashBalance.value
          : this.stashBalance,
      unlockedLoot: data.unlockedLoot.present
          ? data.unlockedLoot.value
          : this.unlockedLoot,
      lastLogin: data.lastLogin.present ? data.lastLogin.value : this.lastLogin,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Player(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('xp: $xp, ')
          ..write('level: $level, ')
          ..write('stashBalance: $stashBalance, ')
          ..write('unlockedLoot: $unlockedLoot, ')
          ..write('lastLogin: $lastLogin')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, xp, level, stashBalance, unlockedLoot, lastLogin);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Player &&
          other.id == this.id &&
          other.name == this.name &&
          other.xp == this.xp &&
          other.level == this.level &&
          other.stashBalance == this.stashBalance &&
          other.unlockedLoot == this.unlockedLoot &&
          other.lastLogin == this.lastLogin);
}

class PlayersCompanion extends UpdateCompanion<Player> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> xp;
  final Value<int> level;
  final Value<String> stashBalance;
  final Value<String?> unlockedLoot;
  final Value<DateTime> lastLogin;
  final Value<int> rowid;
  const PlayersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.xp = const Value.absent(),
    this.level = const Value.absent(),
    this.stashBalance = const Value.absent(),
    this.unlockedLoot = const Value.absent(),
    this.lastLogin = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlayersCompanion.insert({
    required String id,
    required String name,
    this.xp = const Value.absent(),
    this.level = const Value.absent(),
    required String stashBalance,
    this.unlockedLoot = const Value.absent(),
    required DateTime lastLogin,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       stashBalance = Value(stashBalance),
       lastLogin = Value(lastLogin);
  static Insertable<Player> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? xp,
    Expression<int>? level,
    Expression<String>? stashBalance,
    Expression<String>? unlockedLoot,
    Expression<DateTime>? lastLogin,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (xp != null) 'xp': xp,
      if (level != null) 'level': level,
      if (stashBalance != null) 'stash_balance': stashBalance,
      if (unlockedLoot != null) 'unlocked_loot': unlockedLoot,
      if (lastLogin != null) 'last_login': lastLogin,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlayersCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<int>? xp,
    Value<int>? level,
    Value<String>? stashBalance,
    Value<String?>? unlockedLoot,
    Value<DateTime>? lastLogin,
    Value<int>? rowid,
  }) {
    return PlayersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      xp: xp ?? this.xp,
      level: level ?? this.level,
      stashBalance: stashBalance ?? this.stashBalance,
      unlockedLoot: unlockedLoot ?? this.unlockedLoot,
      lastLogin: lastLogin ?? this.lastLogin,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (xp.present) {
      map['xp'] = Variable<int>(xp.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    if (stashBalance.present) {
      map['stash_balance'] = Variable<String>(stashBalance.value);
    }
    if (unlockedLoot.present) {
      map['unlocked_loot'] = Variable<String>(unlockedLoot.value);
    }
    if (lastLogin.present) {
      map['last_login'] = Variable<DateTime>(lastLogin.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlayersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('xp: $xp, ')
          ..write('level: $level, ')
          ..write('stashBalance: $stashBalance, ')
          ..write('unlockedLoot: $unlockedLoot, ')
          ..write('lastLogin: $lastLogin, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $QuestLocationsTable extends QuestLocations
    with TableInfo<$QuestLocationsTable, QuestLocation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuestLocationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _themeMeta = const VerificationMeta('theme');
  @override
  late final GeneratedColumn<String> theme = GeneratedColumn<String>(
    'theme',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currentBalanceMeta = const VerificationMeta(
    'currentBalance',
  );
  @override
  late final GeneratedColumn<String> currentBalance = GeneratedColumn<String>(
    'current_balance',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _allocatedBudgetMeta = const VerificationMeta(
    'allocatedBudget',
  );
  @override
  late final GeneratedColumn<String> allocatedBudget = GeneratedColumn<String>(
    'allocated_budget',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isUnderSiegeMeta = const VerificationMeta(
    'isUnderSiege',
  );
  @override
  late final GeneratedColumn<bool> isUnderSiege = GeneratedColumn<bool>(
    'is_under_siege',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_under_siege" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _xMeta = const VerificationMeta('x');
  @override
  late final GeneratedColumn<double> x = GeneratedColumn<double>(
    'x',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _yMeta = const VerificationMeta('y');
  @override
  late final GeneratedColumn<double> y = GeneratedColumn<double>(
    'y',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    theme,
    currentBalance,
    allocatedBudget,
    isUnderSiege,
    x,
    y,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quest_locations';
  @override
  VerificationContext validateIntegrity(
    Insertable<QuestLocation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('theme')) {
      context.handle(
        _themeMeta,
        theme.isAcceptableOrUnknown(data['theme']!, _themeMeta),
      );
    } else if (isInserting) {
      context.missing(_themeMeta);
    }
    if (data.containsKey('current_balance')) {
      context.handle(
        _currentBalanceMeta,
        currentBalance.isAcceptableOrUnknown(
          data['current_balance']!,
          _currentBalanceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currentBalanceMeta);
    }
    if (data.containsKey('allocated_budget')) {
      context.handle(
        _allocatedBudgetMeta,
        allocatedBudget.isAcceptableOrUnknown(
          data['allocated_budget']!,
          _allocatedBudgetMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_allocatedBudgetMeta);
    }
    if (data.containsKey('is_under_siege')) {
      context.handle(
        _isUnderSiegeMeta,
        isUnderSiege.isAcceptableOrUnknown(
          data['is_under_siege']!,
          _isUnderSiegeMeta,
        ),
      );
    }
    if (data.containsKey('x')) {
      context.handle(_xMeta, x.isAcceptableOrUnknown(data['x']!, _xMeta));
    } else if (isInserting) {
      context.missing(_xMeta);
    }
    if (data.containsKey('y')) {
      context.handle(_yMeta, y.isAcceptableOrUnknown(data['y']!, _yMeta));
    } else if (isInserting) {
      context.missing(_yMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuestLocation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuestLocation(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      theme: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}theme'],
      )!,
      currentBalance: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}current_balance'],
      )!,
      allocatedBudget: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}allocated_budget'],
      )!,
      isUnderSiege: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_under_siege'],
      )!,
      x: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}x'],
      )!,
      y: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}y'],
      )!,
    );
  }

  @override
  $QuestLocationsTable createAlias(String alias) {
    return $QuestLocationsTable(attachedDatabase, alias);
  }
}

class QuestLocation extends DataClass implements Insertable<QuestLocation> {
  final String id;
  final String name;
  final String theme;
  final String currentBalance;
  final String allocatedBudget;
  final bool isUnderSiege;
  final double x;
  final double y;
  const QuestLocation({
    required this.id,
    required this.name,
    required this.theme,
    required this.currentBalance,
    required this.allocatedBudget,
    required this.isUnderSiege,
    required this.x,
    required this.y,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['theme'] = Variable<String>(theme);
    map['current_balance'] = Variable<String>(currentBalance);
    map['allocated_budget'] = Variable<String>(allocatedBudget);
    map['is_under_siege'] = Variable<bool>(isUnderSiege);
    map['x'] = Variable<double>(x);
    map['y'] = Variable<double>(y);
    return map;
  }

  QuestLocationsCompanion toCompanion(bool nullToAbsent) {
    return QuestLocationsCompanion(
      id: Value(id),
      name: Value(name),
      theme: Value(theme),
      currentBalance: Value(currentBalance),
      allocatedBudget: Value(allocatedBudget),
      isUnderSiege: Value(isUnderSiege),
      x: Value(x),
      y: Value(y),
    );
  }

  factory QuestLocation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuestLocation(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      theme: serializer.fromJson<String>(json['theme']),
      currentBalance: serializer.fromJson<String>(json['currentBalance']),
      allocatedBudget: serializer.fromJson<String>(json['allocatedBudget']),
      isUnderSiege: serializer.fromJson<bool>(json['isUnderSiege']),
      x: serializer.fromJson<double>(json['x']),
      y: serializer.fromJson<double>(json['y']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'theme': serializer.toJson<String>(theme),
      'currentBalance': serializer.toJson<String>(currentBalance),
      'allocatedBudget': serializer.toJson<String>(allocatedBudget),
      'isUnderSiege': serializer.toJson<bool>(isUnderSiege),
      'x': serializer.toJson<double>(x),
      'y': serializer.toJson<double>(y),
    };
  }

  QuestLocation copyWith({
    String? id,
    String? name,
    String? theme,
    String? currentBalance,
    String? allocatedBudget,
    bool? isUnderSiege,
    double? x,
    double? y,
  }) => QuestLocation(
    id: id ?? this.id,
    name: name ?? this.name,
    theme: theme ?? this.theme,
    currentBalance: currentBalance ?? this.currentBalance,
    allocatedBudget: allocatedBudget ?? this.allocatedBudget,
    isUnderSiege: isUnderSiege ?? this.isUnderSiege,
    x: x ?? this.x,
    y: y ?? this.y,
  );
  QuestLocation copyWithCompanion(QuestLocationsCompanion data) {
    return QuestLocation(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      theme: data.theme.present ? data.theme.value : this.theme,
      currentBalance: data.currentBalance.present
          ? data.currentBalance.value
          : this.currentBalance,
      allocatedBudget: data.allocatedBudget.present
          ? data.allocatedBudget.value
          : this.allocatedBudget,
      isUnderSiege: data.isUnderSiege.present
          ? data.isUnderSiege.value
          : this.isUnderSiege,
      x: data.x.present ? data.x.value : this.x,
      y: data.y.present ? data.y.value : this.y,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuestLocation(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('theme: $theme, ')
          ..write('currentBalance: $currentBalance, ')
          ..write('allocatedBudget: $allocatedBudget, ')
          ..write('isUnderSiege: $isUnderSiege, ')
          ..write('x: $x, ')
          ..write('y: $y')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    theme,
    currentBalance,
    allocatedBudget,
    isUnderSiege,
    x,
    y,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuestLocation &&
          other.id == this.id &&
          other.name == this.name &&
          other.theme == this.theme &&
          other.currentBalance == this.currentBalance &&
          other.allocatedBudget == this.allocatedBudget &&
          other.isUnderSiege == this.isUnderSiege &&
          other.x == this.x &&
          other.y == this.y);
}

class QuestLocationsCompanion extends UpdateCompanion<QuestLocation> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> theme;
  final Value<String> currentBalance;
  final Value<String> allocatedBudget;
  final Value<bool> isUnderSiege;
  final Value<double> x;
  final Value<double> y;
  final Value<int> rowid;
  const QuestLocationsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.theme = const Value.absent(),
    this.currentBalance = const Value.absent(),
    this.allocatedBudget = const Value.absent(),
    this.isUnderSiege = const Value.absent(),
    this.x = const Value.absent(),
    this.y = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  QuestLocationsCompanion.insert({
    required String id,
    required String name,
    required String theme,
    required String currentBalance,
    required String allocatedBudget,
    this.isUnderSiege = const Value.absent(),
    required double x,
    required double y,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       theme = Value(theme),
       currentBalance = Value(currentBalance),
       allocatedBudget = Value(allocatedBudget),
       x = Value(x),
       y = Value(y);
  static Insertable<QuestLocation> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? theme,
    Expression<String>? currentBalance,
    Expression<String>? allocatedBudget,
    Expression<bool>? isUnderSiege,
    Expression<double>? x,
    Expression<double>? y,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (theme != null) 'theme': theme,
      if (currentBalance != null) 'current_balance': currentBalance,
      if (allocatedBudget != null) 'allocated_budget': allocatedBudget,
      if (isUnderSiege != null) 'is_under_siege': isUnderSiege,
      if (x != null) 'x': x,
      if (y != null) 'y': y,
      if (rowid != null) 'rowid': rowid,
    });
  }

  QuestLocationsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? theme,
    Value<String>? currentBalance,
    Value<String>? allocatedBudget,
    Value<bool>? isUnderSiege,
    Value<double>? x,
    Value<double>? y,
    Value<int>? rowid,
  }) {
    return QuestLocationsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      theme: theme ?? this.theme,
      currentBalance: currentBalance ?? this.currentBalance,
      allocatedBudget: allocatedBudget ?? this.allocatedBudget,
      isUnderSiege: isUnderSiege ?? this.isUnderSiege,
      x: x ?? this.x,
      y: y ?? this.y,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (theme.present) {
      map['theme'] = Variable<String>(theme.value);
    }
    if (currentBalance.present) {
      map['current_balance'] = Variable<String>(currentBalance.value);
    }
    if (allocatedBudget.present) {
      map['allocated_budget'] = Variable<String>(allocatedBudget.value);
    }
    if (isUnderSiege.present) {
      map['is_under_siege'] = Variable<bool>(isUnderSiege.value);
    }
    if (x.present) {
      map['x'] = Variable<double>(x.value);
    }
    if (y.present) {
      map['y'] = Variable<double>(y.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuestLocationsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('theme: $theme, ')
          ..write('currentBalance: $currentBalance, ')
          ..write('allocatedBudget: $allocatedBudget, ')
          ..write('isUnderSiege: $isUnderSiege, ')
          ..write('x: $x, ')
          ..write('y: $y, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, Transaction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _locationIdMeta = const VerificationMeta(
    'locationId',
  );
  @override
  late final GeneratedColumn<String> locationId = GeneratedColumn<String>(
    'location_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES quest_locations (id)',
    ),
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<String> amount = GeneratedColumn<String>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    locationId,
    amount,
    type,
    timestamp,
    description,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transactions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Transaction> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('location_id')) {
      context.handle(
        _locationIdMeta,
        locationId.isAcceptableOrUnknown(data['location_id']!, _locationIdMeta),
      );
    } else if (isInserting) {
      context.missing(_locationIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Transaction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Transaction(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      locationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location_id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}amount'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
    );
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }
}

class Transaction extends DataClass implements Insertable<Transaction> {
  final String id;
  final String locationId;
  final String amount;
  final String type;
  final DateTime timestamp;
  final String? description;
  const Transaction({
    required this.id,
    required this.locationId,
    required this.amount,
    required this.type,
    required this.timestamp,
    this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['location_id'] = Variable<String>(locationId);
    map['amount'] = Variable<String>(amount);
    map['type'] = Variable<String>(type);
    map['timestamp'] = Variable<DateTime>(timestamp);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: Value(id),
      locationId: Value(locationId),
      amount: Value(amount),
      type: Value(type),
      timestamp: Value(timestamp),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory Transaction.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Transaction(
      id: serializer.fromJson<String>(json['id']),
      locationId: serializer.fromJson<String>(json['locationId']),
      amount: serializer.fromJson<String>(json['amount']),
      type: serializer.fromJson<String>(json['type']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'locationId': serializer.toJson<String>(locationId),
      'amount': serializer.toJson<String>(amount),
      'type': serializer.toJson<String>(type),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'description': serializer.toJson<String?>(description),
    };
  }

  Transaction copyWith({
    String? id,
    String? locationId,
    String? amount,
    String? type,
    DateTime? timestamp,
    Value<String?> description = const Value.absent(),
  }) => Transaction(
    id: id ?? this.id,
    locationId: locationId ?? this.locationId,
    amount: amount ?? this.amount,
    type: type ?? this.type,
    timestamp: timestamp ?? this.timestamp,
    description: description.present ? description.value : this.description,
  );
  Transaction copyWithCompanion(TransactionsCompanion data) {
    return Transaction(
      id: data.id.present ? data.id.value : this.id,
      locationId: data.locationId.present
          ? data.locationId.value
          : this.locationId,
      amount: data.amount.present ? data.amount.value : this.amount,
      type: data.type.present ? data.type.value : this.type,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Transaction(')
          ..write('id: $id, ')
          ..write('locationId: $locationId, ')
          ..write('amount: $amount, ')
          ..write('type: $type, ')
          ..write('timestamp: $timestamp, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, locationId, amount, type, timestamp, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Transaction &&
          other.id == this.id &&
          other.locationId == this.locationId &&
          other.amount == this.amount &&
          other.type == this.type &&
          other.timestamp == this.timestamp &&
          other.description == this.description);
}

class TransactionsCompanion extends UpdateCompanion<Transaction> {
  final Value<String> id;
  final Value<String> locationId;
  final Value<String> amount;
  final Value<String> type;
  final Value<DateTime> timestamp;
  final Value<String?> description;
  final Value<int> rowid;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.locationId = const Value.absent(),
    this.amount = const Value.absent(),
    this.type = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TransactionsCompanion.insert({
    required String id,
    required String locationId,
    required String amount,
    required String type,
    required DateTime timestamp,
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       locationId = Value(locationId),
       amount = Value(amount),
       type = Value(type),
       timestamp = Value(timestamp);
  static Insertable<Transaction> custom({
    Expression<String>? id,
    Expression<String>? locationId,
    Expression<String>? amount,
    Expression<String>? type,
    Expression<DateTime>? timestamp,
    Expression<String>? description,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (locationId != null) 'location_id': locationId,
      if (amount != null) 'amount': amount,
      if (type != null) 'type': type,
      if (timestamp != null) 'timestamp': timestamp,
      if (description != null) 'description': description,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TransactionsCompanion copyWith({
    Value<String>? id,
    Value<String>? locationId,
    Value<String>? amount,
    Value<String>? type,
    Value<DateTime>? timestamp,
    Value<String?>? description,
    Value<int>? rowid,
  }) {
    return TransactionsCompanion(
      id: id ?? this.id,
      locationId: locationId ?? this.locationId,
      amount: amount ?? this.amount,
      type: type ?? this.type,
      timestamp: timestamp ?? this.timestamp,
      description: description ?? this.description,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (locationId.present) {
      map['location_id'] = Variable<String>(locationId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<String>(amount.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('id: $id, ')
          ..write('locationId: $locationId, ')
          ..write('amount: $amount, ')
          ..write('type: $type, ')
          ..write('timestamp: $timestamp, ')
          ..write('description: $description, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LootsTable extends Loots with TableInfo<$LootsTable, Loot> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LootsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rarityMeta = const VerificationMeta('rarity');
  @override
  late final GeneratedColumn<String> rarity = GeneratedColumn<String>(
    'rarity',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _visualAssetPathMeta = const VerificationMeta(
    'visualAssetPath',
  );
  @override
  late final GeneratedColumn<String> visualAssetPath = GeneratedColumn<String>(
    'visual_asset_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    category,
    rarity,
    visualAssetPath,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'loots';
  @override
  VerificationContext validateIntegrity(
    Insertable<Loot> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('rarity')) {
      context.handle(
        _rarityMeta,
        rarity.isAcceptableOrUnknown(data['rarity']!, _rarityMeta),
      );
    } else if (isInserting) {
      context.missing(_rarityMeta);
    }
    if (data.containsKey('visual_asset_path')) {
      context.handle(
        _visualAssetPathMeta,
        visualAssetPath.isAcceptableOrUnknown(
          data['visual_asset_path']!,
          _visualAssetPathMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_visualAssetPathMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Loot map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Loot(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      rarity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rarity'],
      )!,
      visualAssetPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}visual_asset_path'],
      )!,
    );
  }

  @override
  $LootsTable createAlias(String alias) {
    return $LootsTable(attachedDatabase, alias);
  }
}

class Loot extends DataClass implements Insertable<Loot> {
  final String id;
  final String name;
  final String category;
  final String rarity;
  final String visualAssetPath;
  const Loot({
    required this.id,
    required this.name,
    required this.category,
    required this.rarity,
    required this.visualAssetPath,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['category'] = Variable<String>(category);
    map['rarity'] = Variable<String>(rarity);
    map['visual_asset_path'] = Variable<String>(visualAssetPath);
    return map;
  }

  LootsCompanion toCompanion(bool nullToAbsent) {
    return LootsCompanion(
      id: Value(id),
      name: Value(name),
      category: Value(category),
      rarity: Value(rarity),
      visualAssetPath: Value(visualAssetPath),
    );
  }

  factory Loot.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Loot(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      category: serializer.fromJson<String>(json['category']),
      rarity: serializer.fromJson<String>(json['rarity']),
      visualAssetPath: serializer.fromJson<String>(json['visualAssetPath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<String>(category),
      'rarity': serializer.toJson<String>(rarity),
      'visualAssetPath': serializer.toJson<String>(visualAssetPath),
    };
  }

  Loot copyWith({
    String? id,
    String? name,
    String? category,
    String? rarity,
    String? visualAssetPath,
  }) => Loot(
    id: id ?? this.id,
    name: name ?? this.name,
    category: category ?? this.category,
    rarity: rarity ?? this.rarity,
    visualAssetPath: visualAssetPath ?? this.visualAssetPath,
  );
  Loot copyWithCompanion(LootsCompanion data) {
    return Loot(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      category: data.category.present ? data.category.value : this.category,
      rarity: data.rarity.present ? data.rarity.value : this.rarity,
      visualAssetPath: data.visualAssetPath.present
          ? data.visualAssetPath.value
          : this.visualAssetPath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Loot(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('rarity: $rarity, ')
          ..write('visualAssetPath: $visualAssetPath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, category, rarity, visualAssetPath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Loot &&
          other.id == this.id &&
          other.name == this.name &&
          other.category == this.category &&
          other.rarity == this.rarity &&
          other.visualAssetPath == this.visualAssetPath);
}

class LootsCompanion extends UpdateCompanion<Loot> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> category;
  final Value<String> rarity;
  final Value<String> visualAssetPath;
  final Value<int> rowid;
  const LootsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.rarity = const Value.absent(),
    this.visualAssetPath = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LootsCompanion.insert({
    required String id,
    required String name,
    required String category,
    required String rarity,
    required String visualAssetPath,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       category = Value(category),
       rarity = Value(rarity),
       visualAssetPath = Value(visualAssetPath);
  static Insertable<Loot> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? category,
    Expression<String>? rarity,
    Expression<String>? visualAssetPath,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (rarity != null) 'rarity': rarity,
      if (visualAssetPath != null) 'visual_asset_path': visualAssetPath,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LootsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? category,
    Value<String>? rarity,
    Value<String>? visualAssetPath,
    Value<int>? rowid,
  }) {
    return LootsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      rarity: rarity ?? this.rarity,
      visualAssetPath: visualAssetPath ?? this.visualAssetPath,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (rarity.present) {
      map['rarity'] = Variable<String>(rarity.value);
    }
    if (visualAssetPath.present) {
      map['visual_asset_path'] = Variable<String>(visualAssetPath.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LootsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('rarity: $rarity, ')
          ..write('visualAssetPath: $visualAssetPath, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PayCyclesTable extends PayCycles
    with TableInfo<$PayCyclesTable, PayCycle> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PayCyclesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
    'end_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isCompletedMeta = const VerificationMeta(
    'isCompleted',
  );
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
    'is_completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _totalHarvestedMeta = const VerificationMeta(
    'totalHarvested',
  );
  @override
  late final GeneratedColumn<String> totalHarvested = GeneratedColumn<String>(
    'total_harvested',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('0'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    startDate,
    endDate,
    isCompleted,
    totalHarvested,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pay_cycles';
  @override
  VerificationContext validateIntegrity(
    Insertable<PayCycle> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    } else if (isInserting) {
      context.missing(_endDateMeta);
    }
    if (data.containsKey('is_completed')) {
      context.handle(
        _isCompletedMeta,
        isCompleted.isAcceptableOrUnknown(
          data['is_completed']!,
          _isCompletedMeta,
        ),
      );
    }
    if (data.containsKey('total_harvested')) {
      context.handle(
        _totalHarvestedMeta,
        totalHarvested.isAcceptableOrUnknown(
          data['total_harvested']!,
          _totalHarvestedMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PayCycle map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PayCycle(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      )!,
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date'],
      )!,
      isCompleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_completed'],
      )!,
      totalHarvested: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}total_harvested'],
      )!,
    );
  }

  @override
  $PayCyclesTable createAlias(String alias) {
    return $PayCyclesTable(attachedDatabase, alias);
  }
}

class PayCycle extends DataClass implements Insertable<PayCycle> {
  final String id;
  final DateTime startDate;
  final DateTime endDate;
  final bool isCompleted;
  final String totalHarvested;
  const PayCycle({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.isCompleted,
    required this.totalHarvested,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['start_date'] = Variable<DateTime>(startDate);
    map['end_date'] = Variable<DateTime>(endDate);
    map['is_completed'] = Variable<bool>(isCompleted);
    map['total_harvested'] = Variable<String>(totalHarvested);
    return map;
  }

  PayCyclesCompanion toCompanion(bool nullToAbsent) {
    return PayCyclesCompanion(
      id: Value(id),
      startDate: Value(startDate),
      endDate: Value(endDate),
      isCompleted: Value(isCompleted),
      totalHarvested: Value(totalHarvested),
    );
  }

  factory PayCycle.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PayCycle(
      id: serializer.fromJson<String>(json['id']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime>(json['endDate']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      totalHarvested: serializer.fromJson<String>(json['totalHarvested']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime>(endDate),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'totalHarvested': serializer.toJson<String>(totalHarvested),
    };
  }

  PayCycle copyWith({
    String? id,
    DateTime? startDate,
    DateTime? endDate,
    bool? isCompleted,
    String? totalHarvested,
  }) => PayCycle(
    id: id ?? this.id,
    startDate: startDate ?? this.startDate,
    endDate: endDate ?? this.endDate,
    isCompleted: isCompleted ?? this.isCompleted,
    totalHarvested: totalHarvested ?? this.totalHarvested,
  );
  PayCycle copyWithCompanion(PayCyclesCompanion data) {
    return PayCycle(
      id: data.id.present ? data.id.value : this.id,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      isCompleted: data.isCompleted.present
          ? data.isCompleted.value
          : this.isCompleted,
      totalHarvested: data.totalHarvested.present
          ? data.totalHarvested.value
          : this.totalHarvested,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PayCycle(')
          ..write('id: $id, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('totalHarvested: $totalHarvested')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, startDate, endDate, isCompleted, totalHarvested);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PayCycle &&
          other.id == this.id &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.isCompleted == this.isCompleted &&
          other.totalHarvested == this.totalHarvested);
}

class PayCyclesCompanion extends UpdateCompanion<PayCycle> {
  final Value<String> id;
  final Value<DateTime> startDate;
  final Value<DateTime> endDate;
  final Value<bool> isCompleted;
  final Value<String> totalHarvested;
  final Value<int> rowid;
  const PayCyclesCompanion({
    this.id = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.totalHarvested = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PayCyclesCompanion.insert({
    required String id,
    required DateTime startDate,
    required DateTime endDate,
    this.isCompleted = const Value.absent(),
    this.totalHarvested = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       startDate = Value(startDate),
       endDate = Value(endDate);
  static Insertable<PayCycle> custom({
    Expression<String>? id,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<bool>? isCompleted,
    Expression<String>? totalHarvested,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (totalHarvested != null) 'total_harvested': totalHarvested,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PayCyclesCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? startDate,
    Value<DateTime>? endDate,
    Value<bool>? isCompleted,
    Value<String>? totalHarvested,
    Value<int>? rowid,
  }) {
    return PayCyclesCompanion(
      id: id ?? this.id,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isCompleted: isCompleted ?? this.isCompleted,
      totalHarvested: totalHarvested ?? this.totalHarvested,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (totalHarvested.present) {
      map['total_harvested'] = Variable<String>(totalHarvested.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PayCyclesCompanion(')
          ..write('id: $id, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('totalHarvested: $totalHarvested, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PlayersTable players = $PlayersTable(this);
  late final $QuestLocationsTable questLocations = $QuestLocationsTable(this);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  late final $LootsTable loots = $LootsTable(this);
  late final $PayCyclesTable payCycles = $PayCyclesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    players,
    questLocations,
    transactions,
    loots,
    payCycles,
  ];
}

typedef $$PlayersTableCreateCompanionBuilder =
    PlayersCompanion Function({
      required String id,
      required String name,
      Value<int> xp,
      Value<int> level,
      required String stashBalance,
      Value<String?> unlockedLoot,
      required DateTime lastLogin,
      Value<int> rowid,
    });
typedef $$PlayersTableUpdateCompanionBuilder =
    PlayersCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<int> xp,
      Value<int> level,
      Value<String> stashBalance,
      Value<String?> unlockedLoot,
      Value<DateTime> lastLogin,
      Value<int> rowid,
    });

class $$PlayersTableFilterComposer
    extends Composer<_$AppDatabase, $PlayersTable> {
  $$PlayersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get xp => $composableBuilder(
    column: $table.xp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stashBalance => $composableBuilder(
    column: $table.stashBalance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unlockedLoot => $composableBuilder(
    column: $table.unlockedLoot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastLogin => $composableBuilder(
    column: $table.lastLogin,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PlayersTableOrderingComposer
    extends Composer<_$AppDatabase, $PlayersTable> {
  $$PlayersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get xp => $composableBuilder(
    column: $table.xp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stashBalance => $composableBuilder(
    column: $table.stashBalance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unlockedLoot => $composableBuilder(
    column: $table.unlockedLoot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastLogin => $composableBuilder(
    column: $table.lastLogin,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PlayersTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlayersTable> {
  $$PlayersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get xp =>
      $composableBuilder(column: $table.xp, builder: (column) => column);

  GeneratedColumn<int> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<String> get stashBalance => $composableBuilder(
    column: $table.stashBalance,
    builder: (column) => column,
  );

  GeneratedColumn<String> get unlockedLoot => $composableBuilder(
    column: $table.unlockedLoot,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastLogin =>
      $composableBuilder(column: $table.lastLogin, builder: (column) => column);
}

class $$PlayersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlayersTable,
          Player,
          $$PlayersTableFilterComposer,
          $$PlayersTableOrderingComposer,
          $$PlayersTableAnnotationComposer,
          $$PlayersTableCreateCompanionBuilder,
          $$PlayersTableUpdateCompanionBuilder,
          (Player, BaseReferences<_$AppDatabase, $PlayersTable, Player>),
          Player,
          PrefetchHooks Function()
        > {
  $$PlayersTableTableManager(_$AppDatabase db, $PlayersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlayersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlayersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlayersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> xp = const Value.absent(),
                Value<int> level = const Value.absent(),
                Value<String> stashBalance = const Value.absent(),
                Value<String?> unlockedLoot = const Value.absent(),
                Value<DateTime> lastLogin = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlayersCompanion(
                id: id,
                name: name,
                xp: xp,
                level: level,
                stashBalance: stashBalance,
                unlockedLoot: unlockedLoot,
                lastLogin: lastLogin,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<int> xp = const Value.absent(),
                Value<int> level = const Value.absent(),
                required String stashBalance,
                Value<String?> unlockedLoot = const Value.absent(),
                required DateTime lastLogin,
                Value<int> rowid = const Value.absent(),
              }) => PlayersCompanion.insert(
                id: id,
                name: name,
                xp: xp,
                level: level,
                stashBalance: stashBalance,
                unlockedLoot: unlockedLoot,
                lastLogin: lastLogin,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PlayersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlayersTable,
      Player,
      $$PlayersTableFilterComposer,
      $$PlayersTableOrderingComposer,
      $$PlayersTableAnnotationComposer,
      $$PlayersTableCreateCompanionBuilder,
      $$PlayersTableUpdateCompanionBuilder,
      (Player, BaseReferences<_$AppDatabase, $PlayersTable, Player>),
      Player,
      PrefetchHooks Function()
    >;
typedef $$QuestLocationsTableCreateCompanionBuilder =
    QuestLocationsCompanion Function({
      required String id,
      required String name,
      required String theme,
      required String currentBalance,
      required String allocatedBudget,
      Value<bool> isUnderSiege,
      required double x,
      required double y,
      Value<int> rowid,
    });
typedef $$QuestLocationsTableUpdateCompanionBuilder =
    QuestLocationsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> theme,
      Value<String> currentBalance,
      Value<String> allocatedBudget,
      Value<bool> isUnderSiege,
      Value<double> x,
      Value<double> y,
      Value<int> rowid,
    });

final class $$QuestLocationsTableReferences
    extends BaseReferences<_$AppDatabase, $QuestLocationsTable, QuestLocation> {
  $$QuestLocationsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$TransactionsTable, List<Transaction>>
  _transactionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.transactions,
    aliasName: $_aliasNameGenerator(
      db.questLocations.id,
      db.transactions.locationId,
    ),
  );

  $$TransactionsTableProcessedTableManager get transactionsRefs {
    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.locationId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_transactionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$QuestLocationsTableFilterComposer
    extends Composer<_$AppDatabase, $QuestLocationsTable> {
  $$QuestLocationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get theme => $composableBuilder(
    column: $table.theme,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currentBalance => $composableBuilder(
    column: $table.currentBalance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get allocatedBudget => $composableBuilder(
    column: $table.allocatedBudget,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isUnderSiege => $composableBuilder(
    column: $table.isUnderSiege,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get x => $composableBuilder(
    column: $table.x,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get y => $composableBuilder(
    column: $table.y,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> transactionsRefs(
    Expression<bool> Function($$TransactionsTableFilterComposer f) f,
  ) {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.locationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$QuestLocationsTableOrderingComposer
    extends Composer<_$AppDatabase, $QuestLocationsTable> {
  $$QuestLocationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get theme => $composableBuilder(
    column: $table.theme,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currentBalance => $composableBuilder(
    column: $table.currentBalance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get allocatedBudget => $composableBuilder(
    column: $table.allocatedBudget,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isUnderSiege => $composableBuilder(
    column: $table.isUnderSiege,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get x => $composableBuilder(
    column: $table.x,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get y => $composableBuilder(
    column: $table.y,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$QuestLocationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuestLocationsTable> {
  $$QuestLocationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get theme =>
      $composableBuilder(column: $table.theme, builder: (column) => column);

  GeneratedColumn<String> get currentBalance => $composableBuilder(
    column: $table.currentBalance,
    builder: (column) => column,
  );

  GeneratedColumn<String> get allocatedBudget => $composableBuilder(
    column: $table.allocatedBudget,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isUnderSiege => $composableBuilder(
    column: $table.isUnderSiege,
    builder: (column) => column,
  );

  GeneratedColumn<double> get x =>
      $composableBuilder(column: $table.x, builder: (column) => column);

  GeneratedColumn<double> get y =>
      $composableBuilder(column: $table.y, builder: (column) => column);

  Expression<T> transactionsRefs<T extends Object>(
    Expression<T> Function($$TransactionsTableAnnotationComposer a) f,
  ) {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.locationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$QuestLocationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QuestLocationsTable,
          QuestLocation,
          $$QuestLocationsTableFilterComposer,
          $$QuestLocationsTableOrderingComposer,
          $$QuestLocationsTableAnnotationComposer,
          $$QuestLocationsTableCreateCompanionBuilder,
          $$QuestLocationsTableUpdateCompanionBuilder,
          (QuestLocation, $$QuestLocationsTableReferences),
          QuestLocation,
          PrefetchHooks Function({bool transactionsRefs})
        > {
  $$QuestLocationsTableTableManager(
    _$AppDatabase db,
    $QuestLocationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuestLocationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuestLocationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuestLocationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> theme = const Value.absent(),
                Value<String> currentBalance = const Value.absent(),
                Value<String> allocatedBudget = const Value.absent(),
                Value<bool> isUnderSiege = const Value.absent(),
                Value<double> x = const Value.absent(),
                Value<double> y = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QuestLocationsCompanion(
                id: id,
                name: name,
                theme: theme,
                currentBalance: currentBalance,
                allocatedBudget: allocatedBudget,
                isUnderSiege: isUnderSiege,
                x: x,
                y: y,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String theme,
                required String currentBalance,
                required String allocatedBudget,
                Value<bool> isUnderSiege = const Value.absent(),
                required double x,
                required double y,
                Value<int> rowid = const Value.absent(),
              }) => QuestLocationsCompanion.insert(
                id: id,
                name: name,
                theme: theme,
                currentBalance: currentBalance,
                allocatedBudget: allocatedBudget,
                isUnderSiege: isUnderSiege,
                x: x,
                y: y,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$QuestLocationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({transactionsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (transactionsRefs) db.transactions],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (transactionsRefs)
                    await $_getPrefetchedData<
                      QuestLocation,
                      $QuestLocationsTable,
                      Transaction
                    >(
                      currentTable: table,
                      referencedTable: $$QuestLocationsTableReferences
                          ._transactionsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$QuestLocationsTableReferences(
                            db,
                            table,
                            p0,
                          ).transactionsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.locationId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$QuestLocationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QuestLocationsTable,
      QuestLocation,
      $$QuestLocationsTableFilterComposer,
      $$QuestLocationsTableOrderingComposer,
      $$QuestLocationsTableAnnotationComposer,
      $$QuestLocationsTableCreateCompanionBuilder,
      $$QuestLocationsTableUpdateCompanionBuilder,
      (QuestLocation, $$QuestLocationsTableReferences),
      QuestLocation,
      PrefetchHooks Function({bool transactionsRefs})
    >;
typedef $$TransactionsTableCreateCompanionBuilder =
    TransactionsCompanion Function({
      required String id,
      required String locationId,
      required String amount,
      required String type,
      required DateTime timestamp,
      Value<String?> description,
      Value<int> rowid,
    });
typedef $$TransactionsTableUpdateCompanionBuilder =
    TransactionsCompanion Function({
      Value<String> id,
      Value<String> locationId,
      Value<String> amount,
      Value<String> type,
      Value<DateTime> timestamp,
      Value<String?> description,
      Value<int> rowid,
    });

final class $$TransactionsTableReferences
    extends BaseReferences<_$AppDatabase, $TransactionsTable, Transaction> {
  $$TransactionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $QuestLocationsTable _locationIdTable(_$AppDatabase db) =>
      db.questLocations.createAlias(
        $_aliasNameGenerator(db.transactions.locationId, db.questLocations.id),
      );

  $$QuestLocationsTableProcessedTableManager get locationId {
    final $_column = $_itemColumn<String>('location_id')!;

    final manager = $$QuestLocationsTableTableManager(
      $_db,
      $_db.questLocations,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_locationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TransactionsTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  $$QuestLocationsTableFilterComposer get locationId {
    final $$QuestLocationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locationId,
      referencedTable: $db.questLocations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuestLocationsTableFilterComposer(
            $db: $db,
            $table: $db.questLocations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionsTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  $$QuestLocationsTableOrderingComposer get locationId {
    final $$QuestLocationsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locationId,
      referencedTable: $db.questLocations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuestLocationsTableOrderingComposer(
            $db: $db,
            $table: $db.questLocations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  $$QuestLocationsTableAnnotationComposer get locationId {
    final $$QuestLocationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locationId,
      referencedTable: $db.questLocations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuestLocationsTableAnnotationComposer(
            $db: $db,
            $table: $db.questLocations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TransactionsTable,
          Transaction,
          $$TransactionsTableFilterComposer,
          $$TransactionsTableOrderingComposer,
          $$TransactionsTableAnnotationComposer,
          $$TransactionsTableCreateCompanionBuilder,
          $$TransactionsTableUpdateCompanionBuilder,
          (Transaction, $$TransactionsTableReferences),
          Transaction,
          PrefetchHooks Function({bool locationId})
        > {
  $$TransactionsTableTableManager(_$AppDatabase db, $TransactionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> locationId = const Value.absent(),
                Value<String> amount = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TransactionsCompanion(
                id: id,
                locationId: locationId,
                amount: amount,
                type: type,
                timestamp: timestamp,
                description: description,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String locationId,
                required String amount,
                required String type,
                required DateTime timestamp,
                Value<String?> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TransactionsCompanion.insert(
                id: id,
                locationId: locationId,
                amount: amount,
                type: type,
                timestamp: timestamp,
                description: description,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TransactionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({locationId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (locationId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.locationId,
                                referencedTable: $$TransactionsTableReferences
                                    ._locationIdTable(db),
                                referencedColumn: $$TransactionsTableReferences
                                    ._locationIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TransactionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TransactionsTable,
      Transaction,
      $$TransactionsTableFilterComposer,
      $$TransactionsTableOrderingComposer,
      $$TransactionsTableAnnotationComposer,
      $$TransactionsTableCreateCompanionBuilder,
      $$TransactionsTableUpdateCompanionBuilder,
      (Transaction, $$TransactionsTableReferences),
      Transaction,
      PrefetchHooks Function({bool locationId})
    >;
typedef $$LootsTableCreateCompanionBuilder =
    LootsCompanion Function({
      required String id,
      required String name,
      required String category,
      required String rarity,
      required String visualAssetPath,
      Value<int> rowid,
    });
typedef $$LootsTableUpdateCompanionBuilder =
    LootsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> category,
      Value<String> rarity,
      Value<String> visualAssetPath,
      Value<int> rowid,
    });

class $$LootsTableFilterComposer extends Composer<_$AppDatabase, $LootsTable> {
  $$LootsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rarity => $composableBuilder(
    column: $table.rarity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get visualAssetPath => $composableBuilder(
    column: $table.visualAssetPath,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LootsTableOrderingComposer
    extends Composer<_$AppDatabase, $LootsTable> {
  $$LootsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rarity => $composableBuilder(
    column: $table.rarity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get visualAssetPath => $composableBuilder(
    column: $table.visualAssetPath,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LootsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LootsTable> {
  $$LootsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get rarity =>
      $composableBuilder(column: $table.rarity, builder: (column) => column);

  GeneratedColumn<String> get visualAssetPath => $composableBuilder(
    column: $table.visualAssetPath,
    builder: (column) => column,
  );
}

class $$LootsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LootsTable,
          Loot,
          $$LootsTableFilterComposer,
          $$LootsTableOrderingComposer,
          $$LootsTableAnnotationComposer,
          $$LootsTableCreateCompanionBuilder,
          $$LootsTableUpdateCompanionBuilder,
          (Loot, BaseReferences<_$AppDatabase, $LootsTable, Loot>),
          Loot,
          PrefetchHooks Function()
        > {
  $$LootsTableTableManager(_$AppDatabase db, $LootsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LootsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LootsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LootsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> rarity = const Value.absent(),
                Value<String> visualAssetPath = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LootsCompanion(
                id: id,
                name: name,
                category: category,
                rarity: rarity,
                visualAssetPath: visualAssetPath,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String category,
                required String rarity,
                required String visualAssetPath,
                Value<int> rowid = const Value.absent(),
              }) => LootsCompanion.insert(
                id: id,
                name: name,
                category: category,
                rarity: rarity,
                visualAssetPath: visualAssetPath,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LootsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LootsTable,
      Loot,
      $$LootsTableFilterComposer,
      $$LootsTableOrderingComposer,
      $$LootsTableAnnotationComposer,
      $$LootsTableCreateCompanionBuilder,
      $$LootsTableUpdateCompanionBuilder,
      (Loot, BaseReferences<_$AppDatabase, $LootsTable, Loot>),
      Loot,
      PrefetchHooks Function()
    >;
typedef $$PayCyclesTableCreateCompanionBuilder =
    PayCyclesCompanion Function({
      required String id,
      required DateTime startDate,
      required DateTime endDate,
      Value<bool> isCompleted,
      Value<String> totalHarvested,
      Value<int> rowid,
    });
typedef $$PayCyclesTableUpdateCompanionBuilder =
    PayCyclesCompanion Function({
      Value<String> id,
      Value<DateTime> startDate,
      Value<DateTime> endDate,
      Value<bool> isCompleted,
      Value<String> totalHarvested,
      Value<int> rowid,
    });

class $$PayCyclesTableFilterComposer
    extends Composer<_$AppDatabase, $PayCyclesTable> {
  $$PayCyclesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get totalHarvested => $composableBuilder(
    column: $table.totalHarvested,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PayCyclesTableOrderingComposer
    extends Composer<_$AppDatabase, $PayCyclesTable> {
  $$PayCyclesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get totalHarvested => $composableBuilder(
    column: $table.totalHarvested,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PayCyclesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PayCyclesTable> {
  $$PayCyclesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => column,
  );

  GeneratedColumn<String> get totalHarvested => $composableBuilder(
    column: $table.totalHarvested,
    builder: (column) => column,
  );
}

class $$PayCyclesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PayCyclesTable,
          PayCycle,
          $$PayCyclesTableFilterComposer,
          $$PayCyclesTableOrderingComposer,
          $$PayCyclesTableAnnotationComposer,
          $$PayCyclesTableCreateCompanionBuilder,
          $$PayCyclesTableUpdateCompanionBuilder,
          (PayCycle, BaseReferences<_$AppDatabase, $PayCyclesTable, PayCycle>),
          PayCycle,
          PrefetchHooks Function()
        > {
  $$PayCyclesTableTableManager(_$AppDatabase db, $PayCyclesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PayCyclesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PayCyclesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PayCyclesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> startDate = const Value.absent(),
                Value<DateTime> endDate = const Value.absent(),
                Value<bool> isCompleted = const Value.absent(),
                Value<String> totalHarvested = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PayCyclesCompanion(
                id: id,
                startDate: startDate,
                endDate: endDate,
                isCompleted: isCompleted,
                totalHarvested: totalHarvested,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime startDate,
                required DateTime endDate,
                Value<bool> isCompleted = const Value.absent(),
                Value<String> totalHarvested = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PayCyclesCompanion.insert(
                id: id,
                startDate: startDate,
                endDate: endDate,
                isCompleted: isCompleted,
                totalHarvested: totalHarvested,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PayCyclesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PayCyclesTable,
      PayCycle,
      $$PayCyclesTableFilterComposer,
      $$PayCyclesTableOrderingComposer,
      $$PayCyclesTableAnnotationComposer,
      $$PayCyclesTableCreateCompanionBuilder,
      $$PayCyclesTableUpdateCompanionBuilder,
      (PayCycle, BaseReferences<_$AppDatabase, $PayCyclesTable, PayCycle>),
      PayCycle,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PlayersTableTableManager get players =>
      $$PlayersTableTableManager(_db, _db.players);
  $$QuestLocationsTableTableManager get questLocations =>
      $$QuestLocationsTableTableManager(_db, _db.questLocations);
  $$TransactionsTableTableManager get transactions =>
      $$TransactionsTableTableManager(_db, _db.transactions);
  $$LootsTableTableManager get loots =>
      $$LootsTableTableManager(_db, _db.loots);
  $$PayCyclesTableTableManager get payCycles =>
      $$PayCyclesTableTableManager(_db, _db.payCycles);
}

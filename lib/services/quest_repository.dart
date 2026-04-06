import 'package:envelope/services/database.dart' hide QuestLocation;
import 'package:envelope/models/quest_location.dart';
import 'package:decimal/decimal.dart';
import 'package:drift/drift.dart';

class QuestRepository {
  final AppDatabase _db;

  QuestRepository(this._db);

  Future<List<QuestLocation>> getAllLocations() async {
    final results = await _db.select(_db.questLocations).get();
    return results.map((row) {
      return QuestLocation(
        id: row.id,
        name: row.name,
        theme: LocationTheme.fromString(row.theme),
        currentBalance: Decimal.parse(row.currentBalance),
        allocatedBudget: Decimal.parse(row.allocatedBudget),
        isUnderSiege: row.isUnderSiege,
        x: row.x,
        y: row.y,
        iconCodePoint: row.iconCodePoint,
        colorValue: row.colorValue,
        fundingSource: row.fundingSource,
        renewalFrequency: row.renewalFrequency,
        rolloverRule: row.rolloverRule,
        overspendBehavior: row.overspendBehavior,
        autoFillDay: row.autoFillDay,
        lowBalanceAlert: row.lowBalanceAlert != null
            ? Decimal.parse(row.lowBalanceAlert!)
            : null,
        targetDate: row.targetDate,
      );
    }).toList();
  }

  Future<void> addLocation(QuestLocation location) async {
    await _db
        .into(_db.questLocations)
        .insert(
          QuestLocationsCompanion.insert(
            id: location.id,
            name: location.name,
            theme: location.theme.name,
            currentBalance: location.currentBalance.toString(),
            allocatedBudget: location.allocatedBudget.toString(),
            isUnderSiege: Value(location.isUnderSiege),
            x: location.x,
            y: location.y,
            iconCodePoint: Value(location.iconCodePoint),
            colorValue: Value(location.colorValue),
            fundingSource: Value(location.fundingSource),
            renewalFrequency: Value(location.renewalFrequency),
            rolloverRule: Value(location.rolloverRule),
            overspendBehavior: Value(location.overspendBehavior),
            autoFillDay: Value(location.autoFillDay),
            lowBalanceAlert: Value(location.lowBalanceAlert?.toString()),
            targetDate: Value(location.targetDate),
          ),
        );
  }

  Future<void> updateLocationBalance(String id, Decimal newBalance) async {
    await (_db.update(_db.questLocations)..where((t) => t.id.equals(id))).write(
      QuestLocationsCompanion(
        currentBalance: Value(newBalance.toString()),
        isUnderSiege: Value(newBalance <= Decimal.zero),
      ),
    );
  }

  Future<void> addTransaction(
    String locationId,
    Decimal amount,
    String type,
    String? description,
  ) async {
    await _db
        .into(_db.transactions)
        .insert(
          TransactionsCompanion.insert(
            id: DateTime.now().millisecondsSinceEpoch
                .toString(), // Simple ID generator
            locationId: locationId,
            amount: amount.toString(),
            type: type,
            timestamp: DateTime.now(),
            description: Value(description),
          ),
        );
  }

  // PayCycle Methods
  Future<PayCycle?> getCurrentPayCycle() async {
    final query = _db.select(_db.payCycles)
      ..where((t) => t.isCompleted.equals(false))
      ..limit(1);
    final result = await query.getSingleOrNull();
    if (result == null) return null;
    return PayCycle(
      id: result.id,
      startDate: result.startDate,
      endDate: result.endDate,
      isCompleted: result.isCompleted,
      totalHarvested: Decimal.parse(result.totalHarvested),
    );
  }

  Future<void> completeCurrentPayCycle(String id, Decimal harvested) async {
    await (_db.update(_db.payCycles)..where((t) => t.id.equals(id))).write(
      PayCyclesCompanion(
        isCompleted: const Value(true),
        totalHarvested: Value(harvested.toString()),
      ),
    );
  }

  Future<void> startNewPayCycle(DateTime start, DateTime end) async {
    await _db
        .into(_db.payCycles)
        .insert(
          PayCyclesCompanion.insert(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            startDate: start,
            endDate: end,
            isCompleted: const Value(false),
            totalHarvested: const Value('0'),
          ),
        );
  }

  Future<List<PayCycle>> getCompletedPayCycles() async {
    final query = _db.select(_db.payCycles)
      ..where((t) => t.isCompleted.equals(true))
      ..orderBy([(t) => OrderingTerm.desc(t.endDate)]);
    final results = await query.get();
    return results.map((row) {
      return PayCycle(
        id: row.id,
        startDate: row.startDate,
        endDate: row.endDate,
        isCompleted: row.isCompleted,
        totalHarvested: Decimal.parse(row.totalHarvested),
      );
    }).toList();
  }
}

class PayCycle {
  final String id;
  final DateTime startDate;
  final DateTime endDate;
  final bool isCompleted;
  final Decimal totalHarvested;

  PayCycle({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.isCompleted,
    required this.totalHarvested,
  });
}

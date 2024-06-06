import 'package:hive/hive.dart';
part 'PurchaseHistoryModel.g.dart';

@HiveType(typeId: 1)
class PurchaseHistoryModel{

  PurchaseHistoryModel({
    required this.bundleName,
    required this.price,
    required this.purchasedAt,
  });

  @HiveField(0)
  String? id;

  @HiveField(1)
  final String bundleName;

  @HiveField(2)
  final String price;

  @HiveField(3)
  final String purchasedAt;
}
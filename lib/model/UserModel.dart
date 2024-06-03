import 'package:hive/hive.dart';
part 'UserModel.g.dart';

@HiveType(typeId: 0)
class UserModel{

  UserModel({
    required this.username,
    required this.email,
    required this.password,
    required this.image,
  });

  @HiveField(0)
  String? id;

  @HiveField(1)
  final String username;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String password;

  @HiveField(4)
  String image;
}
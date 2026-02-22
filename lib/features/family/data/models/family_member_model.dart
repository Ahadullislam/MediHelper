import 'package:hive/hive.dart';

part 'family_member_model.g.dart';

@HiveType(typeId: 0)
class FamilyMemberModel {

  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  int age;

  @HiveField(3)
  String relation;

  @HiveField(4)
  String blood;

  FamilyMemberModel({
    required this.id,
    required this.name,
    required this.age,
    required this.relation,
    required this.blood,

  });

}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../data/models/family_member_model.dart';
import 'package:uuid/uuid.dart';

class FamilyCubit extends Cubit<List<FamilyMemberModel>> {

  FamilyCubit() : super([]);

  final Box familyBox = Hive.box('familyBox');

  void loadFamily() {
    final data = familyBox.values.cast<FamilyMemberModel>().toList();
    emit(data);
  }

  void addMember(String name, int age, String relation) {

    final member = FamilyMemberModel(
      id: const Uuid().v4(),
      name: name,
      age: age,
      relation: relation,
      blood: '',
    );

    familyBox.add(member);
    loadFamily();
  }

  void deleteMember(int index) {
    familyBox.deleteAt(index);
    loadFamily();
  }

}
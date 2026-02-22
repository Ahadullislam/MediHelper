import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../data/models/medicine_model.dart';
import '../../domain/entities/medicine.dart';
import 'medicine_state.dart';

class MedicineCubit extends Cubit<MedicineState> {

  MedicineCubit() : super(MedicineInitial());

  final medicineBox = Hive.box('medicineBox');

  // ADD MEDICINE
  void addMedicine(MedicineModel medicine) {

    medicineBox.put(medicine.id, medicine);

    loadMedicines();
  }

  // LOAD MEDICINES
  void loadMedicines() {

    final data = medicineBox.values.cast<Medicine>().toList();

    emit(MedicineLoaded(data));
  }

  // DELETE MEDICINE
  void deleteMedicine(String id) {

    medicineBox.delete(id);

    loadMedicines();
  }
}
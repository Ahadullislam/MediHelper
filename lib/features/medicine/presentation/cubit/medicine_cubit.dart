import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../../core/notifications/notification_service.dart';
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

    for (var time in medicine.times) {

      final parts = time.split(":");

      final hour = int.parse(parts[0]);
      final minute = int.parse(parts[1]);

      final scheduledDate = DateTime(
        medicine.startDate.year,
        medicine.startDate.month,
        medicine.startDate.day,
        hour,
        minute,
      );

      NotificationService.scheduleMedicineNotification(
        id: scheduledDate.hashCode,
        title: "Medicine Reminder",
        body: "${medicine.name} - ${medicine.dosage}",
        dateTime: scheduledDate,
      );
    }
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
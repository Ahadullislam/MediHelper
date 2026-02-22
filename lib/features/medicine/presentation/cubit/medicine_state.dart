import '../../domain/entities/medicine.dart';

abstract class MedicineState {}

class MedicineInitial extends MedicineState {}

class MedicineLoaded extends MedicineState {
  final List<Medicine> medicines;
  MedicineLoaded(this.medicines);
}
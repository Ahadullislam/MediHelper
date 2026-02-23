import 'package:hive/hive.dart';
import '../../domain/entities/appointment.dart';

part 'appointment_model.g.dart';

@HiveType(typeId: 2)
class AppointmentModel extends Appointment {

  @HiveField(0)
  @override
  final String id;

  @HiveField(1)
  @override
  final String doctorName;

  @HiveField(2)
  @override
  final String hospital;

  @HiveField(3)
  @override
  final DateTime dateTime;

  @HiveField(4)
  @override
  final String memberId;

  @HiveField(5)
  @override
  final String notes;

  AppointmentModel({
    required this.id,
    required this.doctorName,
    required this.hospital,
    required this.dateTime,
    required this.memberId,
    required this.notes,
  }) : super(
    id: id,
    doctorName: doctorName,
    hospital: hospital,
    dateTime: dateTime,
    memberId: memberId,
    notes: notes,
  );
}
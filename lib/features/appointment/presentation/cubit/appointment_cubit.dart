import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../../../core/notifications/notification_service.dart';
import '../../data/models/appointment_model.dart';
import 'appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {

  AppointmentCubit() : super(AppointmentInitial());

  final box = Hive.box('appointmentBox');

  void loadAppointments() {
    final data = box.values.cast<AppointmentModel>().toList();
    emit(AppointmentLoaded(data));
  }

  void addAppointment(AppointmentModel appointment) {

    box.put(appointment.id, appointment);

    // 🔔 Schedule 1 hour before
    final reminderTime =
    appointment.dateTime.subtract(const Duration(hours: 1));

    NotificationService.scheduleMedicineNotification(
      id: reminderTime.hashCode,
      title: "Doctor Appointment",
      body: "${appointment.doctorName} at ${appointment.hospital}",
      dateTime: reminderTime,
    );

    loadAppointments();
  }

  void deleteAppointment(String id) {
    box.delete(id);
    loadAppointments();
  }
}
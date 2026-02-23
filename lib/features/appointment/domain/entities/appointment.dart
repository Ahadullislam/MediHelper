class Appointment {

  final String id;
  final String doctorName;
  final String hospital;
  final DateTime dateTime;
  final String memberId;
  final String notes;

  Appointment({
    required this.id,
    required this.doctorName,
    required this.hospital,
    required this.dateTime,
    required this.memberId,
    required this.notes,
  });
}
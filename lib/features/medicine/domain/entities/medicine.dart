class Medicine {

  final String id;
  final String name;
  final String dosage;
  final int frequency;
  final List<String> times;
  final DateTime startDate;
  final DateTime endDate;
  final String memberId;

  Medicine({
    required this.id,
    required this.name,
    required this.dosage,
    required this.frequency,
    required this.times,
    required this.startDate,
    required this.endDate,
    required this.memberId,
  });

}
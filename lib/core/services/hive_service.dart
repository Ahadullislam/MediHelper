import 'package:hive_flutter/hive_flutter.dart';
import '../../features/appointment/data/models/appointment_model.dart';
import '../../features/family/data/models/family_member_model.dart';
import '../../features/medicine/data/models/medicine_model.dart';

class HiveService {

  static Future<void> init() async {

    await Hive.initFlutter();

    Hive.registerAdapter(FamilyMemberModelAdapter());
    Hive.registerAdapter(MedicineModelAdapter());
    Hive.registerAdapter(AppointmentModelAdapter());

    await Hive.openBox('familyBox');
    await Hive.openBox('medicineBox');
    await Hive.openBox('appointmentBox');
    await Hive.openBox('healthLogBox');
    await Hive.openBox('appointmentBox');

  }

}
class AppConstants {
  // App Info
  static const String appName = 'MediHelper';
  static const String appVersion = '1.0.0';
  
  // Hive Box Names
  static const String familyBox = 'family_box';
  static const String medicineBox = 'medicine_box';
  static const String appointmentBox = 'appointment_box';
  static const String healthLogBox = 'health_log_box';
  
  // Notification Channels
  static const String notificationChannelId = 'medihelper_channel';
  static const String notificationChannelName = 'MediHelper Notifications';
  static const String notificationChannelDescription = 
      'Notifications for medicine reminders and appointments';
  
  // Routes
  static const String homeRoute = '/home';
  static const String familyRoute = '/family';
  static const String medicineRoute = '/medicine';
  static const String appointmentRoute = '/appointment';
  static const String healthLogRoute = '/health_log';
  
  // Screen Names
  static const String homeScreen = 'Home';
  static const String addFamilyScreen = 'Add Family Member';
  static const String addMedicineScreen = 'Add Medicine';
  static const String addAppointmentScreen = 'Add Appointment';
  static const String addHealthLogScreen = 'Add Health Log';
  
  // Time Formats
  static const String timeFormat = 'HH:mm';
  static const String dateFormat = 'dd/MM/yyyy';
  static const String dateTimeFormat = 'dd/MM/yyyy HH:mm';
  
  // Validation
  static const int minNameLength = 2;
  static const int maxNameLength = 50;
  static const int maxDescriptionLength = 500;
  
  // Limits
  static const int maxFamilyMembers = 10;
  static const int maxMedicines = 50;
  static const int maxAppointments = 100;
  static const int maxHealthLogs = 200;
}

class AppStrings {
  // Common
  static const String save = 'Save';
  static const String cancel = 'Cancel';
  static const String delete = 'Delete';
  static const String edit = 'Edit';
  static const String add = 'Add';
  static const String update = 'Update';
  static const String confirm = 'Confirm';
  static const String yes = 'Yes';
  static const String no = 'No';
  static const String ok = 'OK';
  static const String error = 'Error';
  static const String success = 'Success';
  static const String loading = 'Loading...';
  static const String noData = 'No data available';
  
  // Family
  static const String familyMembers = 'Family Members';
  static const String addFamilyMember = 'Add Family Member';
  static const String name = 'Name';
  static const String age = 'Age';
  static const String relationship = 'Relationship';
  static const String bloodType = 'Blood Type';
  static const String allergies = 'Allergies';
  static const String medicalConditions = 'Medical Conditions';
  
  // Medicine
  static const String medicines = 'Medicines';
  static const String addMedicine = 'Add Medicine';
  static const String medicineName = 'Medicine Name';
  static const String dosage = 'Dosage';
  static const String frequency = 'Frequency';
  static const String startTime = 'Start Time';
  static const String endDate = 'End Date';
  static const String instructions = 'Instructions';
  
  // Appointments
  static const String appointments = 'Appointments';
  static const String addAppointment = 'Add Appointment';
  static const String doctorName = 'Doctor Name';
  static const String specialty = 'Specialty';
  static const String hospital = 'Hospital';
  static const String appointmentDate = 'Appointment Date';
  static const String appointmentTime = 'Appointment Time';
  static const String notes = 'Notes';
  
  // Health Log
  static const String healthLogs = 'Health Logs';
  static const String addHealthLog = 'Add Health Log';
  static const String logType = 'Log Type';
  static const String logDate = 'Log Date';
  static const String logTime = 'Log Time';
  static const String description = 'Description';
  static const String bloodPressure = 'Blood Pressure';
  static const String heartRate = 'Heart Rate';
  static const String temperature = 'Temperature';
  static const String weight = 'Weight';
}

import 'package:flutter/material.dart';
import 'core/services/hive_service.dart';
import 'core/notifications/notification_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/family/presentation/cubit/family_cubit.dart';
import 'features/dashboard/presentation/screens/home_screen.dart';
import 'features/medicine/presentation/cubit/medicine_cubit.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await HiveService.init();
  await NotificationService().initNotifications();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => FamilyCubit()..loadFamily(),

        ),
        BlocProvider(
          create: (_) => MedicineCubit()..loadMedicines(),

        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
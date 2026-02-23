import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../appointment/presentation/screens/add_appointment_screen.dart';
import '../../../family/data/models/family_member_model.dart';
import '../../../family/presentation/cubit/family_cubit.dart';
import '../../../family/presentation/screens/add_family_screen.dart';
import '../../../medicine/presentation/screens/add_medicine_screen.dart';
import '../../family/presentation/cubit/family_cubit.dart';
import '../../family/presentation/screens/add_family_screen.dart';
import '../../family/data/models/family_member_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Family List")),
      body: BlocBuilder<FamilyCubit, List<FamilyMemberModel>>(
        builder: (context, family) {
          if (family.isEmpty) {
            return const Center(child: Text("No Family Member Added"));
          }

          return ListView.builder(
            itemCount: family.length,
            itemBuilder: (context, index) {
              final member = family[index];
              return ListTile(
                title: Text(member.name),
                subtitle: Text("${member.relation} - ${member.age}"),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    context.read<FamilyCubit>().deleteMember(index);
                  },
                ),
              );
            },
          );
        },
      ),

      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          //Add Family Member
          FloatingActionButton(
            heroTag: "Add Family",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AddFamilyScreen(),
                ),
              );
            },
            child: const Icon(Icons.family_restroom),
          ),
          const SizedBox(height: 12),

          //Add Medicine
          FloatingActionButton(
            heroTag: "medicine",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AddMedicineScreen(),
                ),
              );
            },
            child: const Icon(Icons.medical_services),
          ),
          const SizedBox(height: 12),

          //Add Appointment
          FloatingActionButton(
            heroTag: "appointment",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AddAppointmentScreen(),
                ),
              );
            },
            child: const Icon(Icons.event),
          ),

        ],
      ),
    );
  }
}
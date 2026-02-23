import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../../../family/presentation/cubit/family_cubit.dart';
import '../../data/models/appointment_model.dart';
import '../cubit/appointment_cubit.dart';

class AddAppointmentScreen extends StatefulWidget {
  const AddAppointmentScreen({super.key});

  @override
  State<AddAppointmentScreen> createState() => _AddAppointmentScreenState();
}

class _AddAppointmentScreenState extends State<AddAppointmentScreen> {

  final doctorController = TextEditingController();
  final hospitalController = TextEditingController();
  final notesController = TextEditingController();

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? selectedMemberId;

  Future pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if(date != null){
      setState(() => selectedDate = date);
    }
  }

  Future pickTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if(time != null){
      setState(() => selectedTime = time);
    }
  }

  void saveAppointment(){

    if(
    doctorController.text.isEmpty ||
        hospitalController.text.isEmpty ||
        selectedDate == null ||
        selectedTime == null ||
        selectedMemberId == null
    ){
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Fill all fields"))
      );
      return;
    }

    final appointmentDateTime = DateTime(
      selectedDate!.year,
      selectedDate!.month,
      selectedDate!.day,
      selectedTime!.hour,
      selectedTime!.minute,
    );

    final appointment = AppointmentModel(
      id: const Uuid().v4(),
      doctorName: doctorController.text,
      hospital: hospitalController.text,
      dateTime: appointmentDateTime,
      memberId: selectedMemberId!,
      notes: notesController.text,
    );

    context.read<AppointmentCubit>().addAppointment(appointment);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Appointment")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            BlocBuilder<FamilyCubit, List>(
                builder: (context, family) {
                  return DropdownButtonFormField(
                    hint: const Text("Select Family Member"),
                    items: family.map((member){
                      return DropdownMenuItem(
                        value: member.id,
                        child: Text(member.name),
                      );
                    }).toList(),
                    onChanged: (value){
                      setState(()=> selectedMemberId = value as String?);
                    },
                  );
                }
            ),

            TextField(
              controller: doctorController,
              decoration: const InputDecoration(
                  labelText: "Doctor Name"
              ),
            ),

            TextField(
              controller: hospitalController,
              decoration: const InputDecoration(
                  labelText: "Hospital"
              ),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: pickDate,
              child: Text(selectedDate == null
                  ? "Pick Date"
                  : selectedDate.toString().split(" ")[0]),
            ),

            ElevatedButton(
              onPressed: pickTime,
              child: Text(selectedTime == null
                  ? "Pick Time"
                  : selectedTime!.format(context)),
            ),

            TextField(
              controller: notesController,
              decoration: const InputDecoration(
                  labelText: "Notes"
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: saveAppointment,
              child: const Text("Save Appointment"),
            ),

          ],
        ),
      ),
    );
  }
}
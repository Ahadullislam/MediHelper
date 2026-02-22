import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../family/presentation/cubit/family_cubit.dart';
import '../../../data/models/medicine_model.dart';
import '../../../family/presentation/cubit/family_cubit.dart';
import '../../data/models/medicine_model.dart';
import '../cubit/medicine_cubit.dart';
import 'package:uuid/uuid.dart';

class AddMedicineScreen extends StatefulWidget {
  const AddMedicineScreen({super.key});

  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {

  final _nameController = TextEditingController();
  final _dosageController = TextEditingController();

  List<TimeOfDay> selectedTimes = [];
  DateTime? startDate;
  DateTime? endDate;
  String? selectedMemberId;

  int frequency = 1;

  pickTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if(time != null){
      setState(() {
        selectedTimes.add(time);
        frequency = selectedTimes.length;
      });
    }
  }

  pickDate(bool isStart) async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );

    if(date != null){
      setState(() {
        if(isStart){
          startDate = date;
        } else {
          endDate = date;
        }
      });
    }
  }

  saveMedicine(){

    if(_nameController.text.isEmpty ||
        _dosageController.text.isEmpty ||
        selectedMemberId == null ||
        startDate == null ||
        endDate == null ||
        selectedTimes.isEmpty){
      return;
    }

    final medicine = MedicineModel(
      id: const Uuid().v4(),
      name: _nameController.text,
      dosage: _dosageController.text,
      frequency: frequency,
      times: selectedTimes.map((e)=> "${e.hour}:${e.minute}").toList(),
      startDate: startDate!,
      endDate: endDate!,
      memberId: selectedMemberId!,
    );

    context.read<MedicineCubit>().addMedicine(medicine);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Medicine")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Medicine Name"),
            ),

            TextField(
              controller: _dosageController,
              decoration: const InputDecoration(labelText: "Dosage"),
            ),

            const SizedBox(height: 20),

            BlocBuilder<FamilyCubit, List>(
              builder: (context, members) {

                return DropdownButtonFormField(
                  hint: const Text("Select Family Member"),
                  items: members.map<DropdownMenuItem>((m){
                    return DropdownMenuItem(
                      value: m.id,
                      child: Text(m.name),
                    );
                  }).toList(),
                  onChanged: (value){
                    selectedMemberId = value;
                  },
                );
              },
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: pickTime,
              child: const Text("Add Reminder Time"),
            ),

            Text("Selected Times: ${selectedTimes.length}"),

            ElevatedButton(
              onPressed: ()=> pickDate(true),
              child: const Text("Start Date"),
            ),

            ElevatedButton(
              onPressed: ()=> pickDate(false),
              child: const Text("End Date"),
            ),

            const Spacer(),

            ElevatedButton(
              onPressed: saveMedicine,
              child: const Text("Save"),
            ),

          ],
        ),
      ),
    );
  }
}
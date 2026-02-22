import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/family_cubit.dart';

class AddFamilyScreen extends StatefulWidget {
  const AddFamilyScreen({super.key});

  @override
  State<AddFamilyScreen> createState() => _AddFamilyScreenState();
}

class _AddFamilyScreenState extends State<AddFamilyScreen> {

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _relationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Family Member")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),

            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Age"),
            ),

            TextField(
              controller: _relationController,
              decoration: const InputDecoration(labelText: "Relation"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {

                context.read<FamilyCubit>().addMember(
                  _nameController.text,
                  int.parse(_ageController.text),
                  _relationController.text,
                );

                Navigator.pop(context);

              },
              child: const Text("Save Member"),
            )

          ],
        ),
      ),
    );
  }
}
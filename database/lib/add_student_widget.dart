import 'package:database/db/model/data_model.dart';
import 'package:database/db/functions/db_functions.dart';
import 'package:flutter/material.dart';

class AddStudentWidget extends StatelessWidget {
   AddStudentWidget({super.key});

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: _nameController,
              decoration:const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Name'
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: _ageController,
              decoration:const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Age'
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed:(){
              onAddStudentButtonClicked();
            },
            icon:const Icon(Icons.add), 
            label:const Text('Add Student'),
          )
        ],
      );
  }

  onAddStudentButtonClicked() async {
    final _name = _nameController.text.trim();
    final _age = _ageController.text.trim();
    if(_name.isEmpty || _age.isEmpty){
      return;
    }else{
    //print('$_name ,$_age');
    final _student = StudentModel(name: _name, age: _age);
    addStudent(_student); 
    } 
  }
}
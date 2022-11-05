import 'package:database/add_student_widget.dart';
import 'package:database/db/functions/db_functions.dart';
import 'package:database/list_student_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AddStudentWidget(),
            const Expanded(child: ListStudentWidget()),
          ],
          
        )
      )
    );
  }
}
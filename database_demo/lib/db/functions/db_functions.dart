import 'package:database/db/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<StudentModel2>> studentListNotifier = ValueNotifier([]);
List<StudentModel2> studentlist = [];

void addStudent(StudentModel2 value) async{
   
  //print(value.toString());

  final studentDB = await Hive.openBox<StudentModel2>('student_db1');
  //studentDB.clear();
  final _id = await studentDB.add(value);
  value.id = _id;
  final id = value.id;
  studentDB.put(id, value);
  studentListNotifier.value.add(value);
  studentlist.add(value);
  studentListNotifier.notifyListeners();
}

Future<void> getAllStudents() async {
  final studentDB = await Hive.openBox<StudentModel2>('student_db1');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDB.values);
  studentListNotifier.notifyListeners();
}

Future<void> deleteStudent(int  id) async{
  final studentDB = await Hive.openBox<StudentModel2>('student_db1');
  await studentDB.delete( id);
  getAllStudents();
}


// Future<void> detailsStudent()async{
//   print('student_db1.values');
// }
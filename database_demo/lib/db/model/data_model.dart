import 'dart:io';
import 'dart:typed_data';

import 'package:hive_flutter/hive_flutter.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
 class StudentModel2{
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String age;

  @HiveField(3)
  final String? classname;

  @HiveField(4)
  final String? phone;

  @HiveField(5)
  Uint8List? image;


  StudentModel2({this.id, required this.name,required  this.age, required this.phone, required this.classname,required this.image});
 }
 //
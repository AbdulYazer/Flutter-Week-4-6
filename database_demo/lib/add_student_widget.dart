import 'dart:io';

import 'package:database/db/model/data_model.dart';
import 'package:database/db/functions/db_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';


class AddStudentWidget extends StatefulWidget {
  const AddStudentWidget({super.key});

  @override
  State<AddStudentWidget> createState() => _AddStudentWidgetState();
}

class _AddStudentWidgetState extends State<AddStudentWidget> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _classController = TextEditingController();
  final _phoneController = TextEditingController();
  Uint8List? image;

  bool _isDataEntered = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Fill Student Data') ,
        centerTitle: true,
      ),
        body: SingleChildScrollView(
          child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: image != null ? Image.memory(image!,height: 200,width: 200,) : 
            
            ElevatedButton.icon(
              onPressed: (){
                updateImage();
              }, 
              icon:const Icon(Icons.image),
              label: const Text('Pick an image'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _nameController,
                decoration:const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Name'
                ),
                validator: (value){ 
                return value == null || value.isEmpty || !RegExp(r'^[a-zA-Z\s]{3,15}$').hasMatch(value)?'Enter valid Name':null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.number,
                controller: _ageController,
                decoration:const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Age'
                ),
                validator: (value){
                  return value==null || value.isEmpty || !RegExp(r'^[0-9]{1,2}$').hasMatch(value)?'Enter valid Age':null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _classController,
                decoration:const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Class'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.phone,
                controller: _phoneController,
                decoration:const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Phone Number'
                ),
                validator: (value){
                  return value==null || value.isEmpty || !RegExp(r'^[0-9]{10}$').hasMatch(value)?'Enter valid Phone number':null;
                },
              ),
            ),
            ElevatedButton.icon(
              onPressed:(){
                onAddStudentButtonClicked();
              },
              icon:const Icon(Icons.add), 
              label:const Text('Add Student'),
            ),
            //  Visibility(
            //   visible: !_isDataEntered,
            //   child: const Text(
            //     'Data Entered Succesfully',
            //     style: TextStyle(color: Colors.green),
            //   ),
            // ),
          ],
              ),
        ),
    );
  }

  onAddStudentButtonClicked() async {
    final _name = _nameController.text.trim();
    final _age = _ageController.text.trim();
    final _class = _classController.text.trim();
    final _phone = _phoneController.text.trim();
    if(_name.isEmpty || _age.isEmpty || _class.isEmpty || _phone.isEmpty || image!.isEmpty){
    }else{
    final _student = StudentModel2(name: _name, age: _age,phone: _phone, classname: _class,image: image);
    addStudent(_student); 
    // _nameController.clear();
    // _ageController.clear();
    // _classController.clear(); 
    // _phoneController.clear();
    // image!.clear();
    // setState(() {
      
    // });

    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => AddStudentWidget()));
    } 
  }
  void updateImage() async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final temp = await image.readAsBytes();
    setState(() {
      this.image = temp;
    });
  } 
}


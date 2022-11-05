import 'package:database/db/model/data_model.dart';
import 'package:database/db/functions/db_functions.dart';
import 'package:database/details_student.dart';
import 'package:flutter/material.dart';

class ListStudentWidget extends StatelessWidget {
  const ListStudentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder:
          (BuildContext ctx, List<StudentModel2> studentList, Widget? child) {
        return ListView.separated(
          itemBuilder: (ctx1, index) {
            final data = studentList[index];
            return ListTile( 
              leading: data.image != null ? Image.memory(data.image!,height: 50,width: 50,) : FlutterLogo(),
              title: Text(data.name),
              subtitle: Text(data.age),
              onTap:(){
                // print(studentList[index].image);
                Navigator.of(ctx1).push(MaterialPageRoute(builder: (ctx1) =>  StudentDetails(name: data.name,phone: data.phone!, classname: data.classname!, age:  data.age,id: data.id!,image1: data.image!,)));
              } ,
              trailing: IconButton(
                onPressed:(){
                  //print(data.id);
                  if(data.id != null){
                    //deleteStudent(data.id!);
                    dailogueBox(ctx, studentList, index);

                  }else 
                  {
                    //print(data.id);
                    print('Student id is null.Unable to delete');
                  }
                } , 
                icon:const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            );
          },
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
          itemCount: studentList.length,
        );
      },
    );
  }
}
void dailogueBox(BuildContext ctx,List<StudentModel2> studentList,var index){
  showDialog(
      context: ctx, 
      builder: (ctx2){
        return AlertDialog(
          title: const Text('Are you sure you want to delete'),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.of(ctx).pop();
              }, 
              child: const Text('CANCEL')
            ),
            TextButton(
              onPressed: (){
                final data = studentList[index];
                deleteStudent(data.id!);
                Navigator.of(ctx).pop();
                
              }, 
              child: const Text('OK')
            ),
          ],
        );
    });
}
import 'package:database/db/model/data_model.dart';
import 'package:database/db/functions/db_functions.dart';
import 'package:flutter/material.dart';

class ListStudentWidget extends StatelessWidget {
  const ListStudentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder:
          (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
        return ListView.separated(
          itemBuilder: (ctx, index) {
            final data = studentList[index];
            return ListTile(
              title: Text(data.name),
              subtitle: Text(data.age),
              trailing: IconButton(
                onPressed:(){
                  if(data.id != null){
                    deleteStudent(data.id!);
                  }else 
                  {
                    print('Student id is null.Unable to delete');
                  }
                } , 
                icon:const Icon(
                  Icons.delete,
                  color: Colors.red
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

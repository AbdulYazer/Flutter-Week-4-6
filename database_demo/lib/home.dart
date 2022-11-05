import 'package:database/add_student_widget.dart';
import 'package:database/db/functions/db_functions.dart';
import 'package:database/db/model/data_model.dart';
import 'package:database/details_student.dart';
import 'package:database/list_student_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      appBar: AppBar(
        title:const Text('Student List'),
        centerTitle: true,
        actions: [
        IconButton(
          onPressed: () {
            showSearch(
              context: context,
              delegate: MySearchDelegete(),
            );
          },
          icon: const Icon(Icons.search),
        )
      ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: Column(
            children:const[
              // TextField(
              //  // onChanged: (value) => _runFilter(value),
              //   decoration: InputDecoration(
              //     contentPadding:
              //         const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
              //     hintText: "Search",
              //     suffixIcon: const Icon(Icons.search),
              //     // prefix: Icon(Icons.search),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(20.0),
              //       borderSide: const BorderSide(),
              //     ),
              //   ),
              // ),
              //AddStudentWidget(),
               Expanded(child: ListStudentWidget()),
               Padding(
                padding:  EdgeInsets.all(10.0),
              )
            ],
            
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
      onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddStudentWidget()));
        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => SelectImage()));

      },
      child:const Icon(Icons.add),
    ),
    );
  }
}


//------------------------------searchBar------------------------------------------//


class MySearchDelegete extends SearchDelegate {
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: const Icon(Icons.clear),
        )
      ];

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    Box<StudentModel2> studentBox = Hive.box<StudentModel2>('student_db1');

    List<StudentModel2> student = studentBox.values.toList();

    final searchItem = query.isEmpty
        ? student
        : student
            .where(
              (element) => element.name.toLowerCase().contains(
                    query.toLowerCase().toString(),
                  ),
            )
            .toList();
    return searchSuggetions(context,searchItem);
  }

  Widget searchSuggetions(BuildContext context,List<StudentModel2> searchItem) {
    getAllStudents();
          return ListView.builder(
              itemCount: searchItem.length,
              itemBuilder: (context, index) {
                final data = searchItem[index];
                return ListTile(
                  onTap: () {
                    if (data.image == null) {
                      return;
                    }
                    // print(data.image);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => StudentDetails(
                          id: data.id!,
                          name: data.name,
                          age: data.age,
                          phone: data.phone!,
                          classname: data.classname!,
                          image1: data.image!,
                        ),
                      ),
                    );
                  },
                  leading:data.image != null ? Image.memory(data.image!) : null,
                   title: Text(data.name),
                  subtitle: Text(data.age),
                ); 
              });
        }
  }



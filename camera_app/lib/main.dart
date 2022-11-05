import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      ),
      home:const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Uint8List? image;
  final imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:const Text('CAMERA'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              width: 200,
              height: 200,
              child: Center(
                 child: image != null ? Image(image: MemoryImage(image!)) :const Text('No image selected'),
                //child: image == null ? const Text('No image selected') : Image.file(image!),
              ),
            ),
            const SizedBox(height: 480,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: IconButton(
                      onPressed: (){
                        getImage();
                      }, 
                      icon:Icon(Icons.photo_library_outlined)
                    ),
                  ),
                  CircleAvatar(
                    radius: 30,
                    child: IconButton(
                      onPressed: (){
                        takeImage();
                      }, 
                      icon:Icon(Icons.camera_alt)
                    ),
                  ),
                ],
              ),
            )
          //   Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
          //    children: [
          //      ElevatedButton.icon(onPressed: (){
          //       takeImage();
          //      }, icon:  Icon(Icons.camera_alt), label: Text('Open Camera')),
          //      ElevatedButton.icon(onPressed: (){
          //       getImage();
          //      }, icon: Icon(Icons.photo), label: Text('Open Gallery'))
          //    ],
          //  )
          ],
        ),
        
        // floatingActionButton: FloatingActionButton(
        //   onPressed: (){
        //     takeImage();
        //   },
        //   child:const Icon(Icons.camera_alt),
        // ),
        ),
    );
  }

  Future takeImage() async{
    final image =await imagePicker.pickImage(source: ImageSource.camera);
    if(image==null){
    return;
    }
    final temp = await image.readAsBytes();
    setState(() {
    this.image=temp;
    });
    GallerySaver.saveImage(image.path);

    // setState(() {
    //   image = File(image.path);
    // });
  }

  Future getImage() async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image==null){
      return;
    }
    final temp = await image.readAsBytes();
      setState(() {
        this.image=temp;
      }
    );
  }
}





  // void _saveImage() async{
  //   ImagePicker.pickImage(source: ImageSource.camera)
  //   .then((PickedFile capturedImage){
  //     if(capturedImage!= null && capturedImage.path != null){
  //       setState(() {
  //         firstButtonText = 'saving in progress...';
  //       });
  //       GallerySaver.saveImage(capturedImage.path).then((String path){
  //         setState(() {
  //           firstButtonText = 'image saved!';
  //         });
  //       });
  //     }
  //    });
  // } 


  // savePhoto() async{
  //         Directory? directory = await getExternalStorageDirectory();
  //         String newPath = "";
  //         print(directory);
  //         List<String> paths = directory!.path.split("/");
  //         for (int x = 1; x < paths.length; x++) {
  //           String folder = paths[x];
  //           if (folder != "Android") {
  //             newPath += "/" + folder;
  //           } else {
  //             break;
  //           }
  //         }
  //         newPath = newPath + "/RPSApp";
  //         directory = Directory(newPath);
  // }

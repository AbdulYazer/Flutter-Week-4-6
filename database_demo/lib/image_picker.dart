import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class SelectImage extends StatefulWidget {
  const SelectImage({super.key});

  @override
  State<SelectImage> createState() => _SelectImageState();
}

  class _SelectImageState extends State<SelectImage> {
  File? _image;
  Future<void> getImage() async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemporary = File(image.path);
    setState(() {
      this._image = imageTemporary;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Pick an image'),
      ),
      body: Center(
        child: Column(
          children: [
            const  SizedBox(height: 20),
            _image != null ? Image.file(_image!,width: 250,height: 250,fit: BoxFit.cover,) : Image.network('https://abdulyazer.github.io/portfolio/assets/images/Yazer1.jpg',width: 250),
            const  SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: (){
                getImage();
              }, 
              icon:const Icon(Icons.image), 
              label:const Text('Pick an image'),
            )
          ],
        ),
      ),
    );
  }
}
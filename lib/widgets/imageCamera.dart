import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageCameta extends StatefulWidget {
  final Function getImagePath;
  ImageCameta(this.getImagePath);

  @override
  _ImageCametaState createState() => _ImageCametaState();
}

class _ImageCametaState extends State<ImageCameta> {
  File image;
  final picker = ImagePicker();
  Future<void> takePicture() async {
    final imagePath = await picker.getImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    // print(imagePath.path);

    setState(() {
      widget.getImagePath(imagePath.path);
      image = File(imagePath.path);
    });
  }

  Future<void> getPicture() async {
    final imagePath = await picker.getImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );
    // print(imagePath.path);
    setState(() {
      widget.getImagePath(imagePath.path);
      image = File(imagePath.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width / 3,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2.0,
              color: Colors.black,
            ),
          ),
          child: image != null
              ? Image(
                  image: FileImage(image),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton.icon(
                color: Colors.green,
                onPressed: () {
                  getPicture();
                },
                icon: Icon(
                  Icons.upload_file,
                  color: Colors.white,
                ),
                label: Text(
                  "Uplode",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 5),
              FlatButton.icon(
                color: Colors.green,
                onPressed: () {
                  takePicture();
                },
                icon: Icon(
                  Icons.camera,
                  color: Colors.white,
                ),
                label: Text(
                  "Camera",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

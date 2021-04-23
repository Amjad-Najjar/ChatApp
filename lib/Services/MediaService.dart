import'dart:io';
import 'package:image_picker/image_picker.dart';
class MediaService{
  File image;
  File vedio;
  final _picker =ImagePicker();
  Future<File> getImageFromGallery()async{
    PickedFile pickedFile=await _picker.getImage(source: ImageSource.gallery);
    image=File(pickedFile.path);
    return image;
  }
  Future<File> getImageFromCamera()async{
    PickedFile pickedFile=await _picker.getImage(source: ImageSource.camera);
    image=File(pickedFile.path);
    return image;
  }

}
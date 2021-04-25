import 'dart:io';

import 'package:chatfirebase/model/USER.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';


class DataServer {
  final users = FirebaseFirestore.instance.collection('users');
  Future<bool> newUser(User user) async {
    if (await users.doc().snapshots().length >0){    QuerySnapshot snapshot =
        await users.where("Uid", isEqualTo: user.uid).get();
    List<QueryDocumentSnapshot> u = snapshot.docs;
    return u.length == 0 ? true : false;}
    else return true;
  }

  Future addUserToDB(User user) async {
    //if (await newUser(user)) {
      await users.doc(user.uid).set({
        "Name": user.displayName,
        "Uid": user.uid,
        "PhotoUrl":user.photoURL,
        "LastSeen":DateTime.now().day.toString(),

      }
      );
   // }
  }
  Future<String> uploadImageToFirebase(File img) async {
    String fileName = "img"+DateTime.now().millisecondsSinceEpoch.toString();
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('Profile Pic/$fileName');
    UploadTask uploadTask = firebaseStorageRef.putFile(img);
    TaskSnapshot taskSnapshot = await uploadTask;
      var value= await taskSnapshot.ref.getDownloadURL();
         
        
        return value.toString();
  }

  Future<List<USER>> getAllUsers() async {
    List<USER> mylist = [];
    await users.get().then((querySnapShot) {
      querySnapShot.docs.forEach((doc) {
        mylist.add(USER(id: doc["Uid"], name: doc["Name"],image: doc["PhotoUrl"],lastSeen: doc["LastSeen"]));
      });
    });

    return mylist;
  }

  Future updateUser(String userId, Map m) async {
    await users.where("Uid", isEqualTo: userId).snapshots().length;
  }
}

import 'dart:io';

import 'package:chatfirebase/Services/auth.dart';
import 'package:chatfirebase/model/USER.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';


class DataServer {
  USER user;
  final users = FirebaseFirestore.instance.collection('users');
  Future<bool> newUser(User user) async {
    if (await users.doc().snapshots().length >0){    QuerySnapshot snapshot =
        await users.where("Uid", isEqualTo: user.uid).get();
    List<QueryDocumentSnapshot> u = snapshot.docs;
    return u.length == 0 ? true : false;}
    else return true;
  }
 
  Future addUserToDB(USER user) async {
    this.user=user;
    //if (await newUser(user)) {
      await users.doc(user.id).set({
        "Name": user.name,
        "Uid": user.id,
        "PhotoUrl":user.image,
        "LastSeen":user.lastSeen,

      }
      );
          print(user.name+" "+user.id);

   // }
  }
  Future sendMessage(USER peerUser)async{
    var master =users.doc(user.id).collection("ChatRooms").doc(peerUser.id);
    var slave =users.doc(peerUser.id).collection("ChatRooms").doc(user.id);
    await master.collection("Messages").doc().set({"Name":peerUser.name,"Message":"Hello i am a master","Time":DateTime.now()});
    await slave.collection("Messages").doc().set({"Name":user.name,"Message":"Hello i am a slave","Time":DateTime.now()});



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

  Future<USER> updateUser(name,photoUrl,lastSeen)async{
   DocumentReference doc =users.doc(user.id);
  if(name!=null){user.name=name;await doc.update({"Name":name});}
  if(photoUrl!=null){user.image=photoUrl;await doc.update({"PhotoUrl":photoUrl});}
  if(lastSeen!=null){user.lastSeen=lastSeen;await doc.update({"LastSeen":lastSeen});}
  return user;
  }
}

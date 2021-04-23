import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
class DataServer{
   final users=FirebaseFirestore.instance.collection('users');
   Future<bool> newUser(User user)async {
     QuerySnapshot snapshot=await users.where("Uid",isEqualTo: user.uid).get();
     List <QueryDocumentSnapshot> u= snapshot.docs;
     return u.length==0?true:false;
   }
   Future addUserToDB(User user)async{
     if(await newUser(user)){
   await  users.doc(user.uid).set({
       "Name":user.displayName,
       "Uid":user.uid,
       "PhotoUrl":user.photoURL,
       
     });}
    

   }
   Future updateUser(String userId,Map m)async{
     await users.where("Uid",isEqualTo:userId).snapshots().length;
   }
  
   
}
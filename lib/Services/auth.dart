import 'package:chatfirebase/model/USER.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'DataServer.dart';

class Auth extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  DataServer data=DataServer();
  Rx<User> _firebaseUser  ;
  User get myStream => _firebaseUser.value;
  

  @override
  void onInit() {
    _firebaseUser=FirebaseAuth.instance.currentUser.obs;
    
    Get.put<DataServer>(data,permanent: true);
    // TODO: implement onInit
    _firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }
  Future signUpWithEmail(String email, String password ) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return user;
    } catch ( error) {
      if(error.code=="ERROR_EMAIL_ALREADY_IN_USE") 
      try{
        return await signInWithEmail(email, password);
      }
      catch(e){print(e.code);};
      return null;
    }
  }
  USER getCurrentUser(){
    User u= _auth.currentUser;
    return USER( name:u.displayName,id:u.uid,image:u.photoURL);
  }
  Future signInWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return user;
    } catch (FirebaseAuthException) {
      Get.snackbar("Error ", "Somthing Wrong Happened ",duration: Duration(seconds:2));
      return null;
    }
  }
  Future updateUserProfile(String name ,String image ) async
  {
    await _auth.currentUser.updateProfile(displayName: name ,photoURL: image);

    await data.addUserToDB(getCurrentUser());
    print(getCurrentUser().name+" "+getCurrentUser().id);

  }
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  Future checkIfExsisted(String email)
  {
  //  _auth.
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'DataServer.dart';

class Auth extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DataServer data=Get.find<DataServer>();
  Rx<User> _firebaseUser  ;
  User get myStream => _firebaseUser.value;
  

  @override
  void onInit() {
    _firebaseUser=FirebaseAuth.instance.currentUser.obs;
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
    } catch (e) {
      print(e.toString());
      return null;
    }
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
  data.addUserToDB(_auth.currentUser);
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

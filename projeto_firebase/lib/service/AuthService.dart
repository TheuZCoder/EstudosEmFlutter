import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //atributio
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //metodo login user
  Future<User?> loginUsuario(String email, String password) async{
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //metodo register user
  Future<User?> registerUsuario(String email, String password) async{
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  //logout user
  Future<void> logoutUsuario() async{
    try{
      await _auth.signOut();
    }catch(e){
      print(e.toString());
    }
  }

}
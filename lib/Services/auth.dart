import 'package:brew_crew/Model/User.dart';
import 'package:brew_crew/Services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth= FirebaseAuth.instance;
  user1? _usefromFirebaseUser(User? w){
    return w !=null ? user1(uid: w.uid):null;
  }
  Stream<user1?> get user {
    return _auth.authStateChanges()
        .map(_usefromFirebaseUser);
  }
  //sign in anon
 Future signInAnon() async{
   try{
     UserCredential result= await _auth.signInAnonymously();
     User? user= result.user;
     return _usefromFirebaseUser(user!);
   }catch(e){
     print(e.toString());
     return null;
   }
 }
 //signout
Future signout() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
}
//Register with Email and Password
Future registerwithpass(String email,String password) async{
    try{
      UserCredential result=await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User ? user12=result.user;
      await DataBaseServices(uid: user12!.uid).updateValues('0', 'bru crew New User', 100);
      return _usefromFirebaseUser(user12);
    }catch(e){
      print(e.toString());
      return null;
    }
}
//Sign In with Email and Passsword
Future signinwithpass(String email,String password) async{
    try{
      UserCredential result= await _auth.signInWithEmailAndPassword(email: email, password: password);
      User ? user12=result.user;
      return _usefromFirebaseUser(user12);
    }catch(e){
      print(e.toString());
      return null;
    }
}
}
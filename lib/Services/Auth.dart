import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:doctory/module/User.dart';
import 'package:flutter/cupertino.dart';
class AuthServices{

  final FirebaseAuth _auth =FirebaseAuth.instance;

  //create user obj based on firebase

  TheUser _userFormFirebase(User user){
    return user !=null ? TheUser(uid: user.uid):null;
  }

  //Auth change user stream
  Stream<TheUser> get user{
    return _auth.authStateChanges().map(_userFormFirebase);
        //.map((User user)=>_userFormFirebase(user)); the same
  }
/*
Stream<CustomClassName> get user {
    return _korisnik.authStateChanges().map(_fromFirebaseUser);
  }
 */
  //sign in

  Future signInAnon()async{
    try{
   UserCredential result=  await _auth.signInAnonymously();
   User user =result.user;
   return _userFormFirebase(user);
    }
    catch(e){
    print(e.toString());
    return null;
    }
  }

  //sign in with email and pass
  Future signinWithEmailandPassword(String email,String password)async{
    try{
      UserCredential result=await _auth.signInWithEmailAndPassword(email: email, password: password);
      User users=result.user;
      return _userFormFirebase(users);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  //register with email and pass

  Future registerWithEmailandPassword(String email,String password)async{
    try{
      UserCredential result=await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User users=result.user;
      return _userFormFirebase(users);
    }
    catch(e){
    print(e.toString());
    return null;
    }
  }

  //sign out
  Future signOut()async{
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
}
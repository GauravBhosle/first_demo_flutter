import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_demo_flutter/src/features/screens/home/home_screen.dart';
import 'package:first_demo_flutter/src/features/screens/login/login_screen.dart';
import 'package:first_demo_flutter/src/repository/authentication_repository/exceptions/login_email_password_failure.dart';
import 'package:first_demo_flutter/src/repository/authentication_repository/exceptions/signup_email_password_failure.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  //variable
  final _auth=FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser=Rx<User?>(_auth.currentUser) ;
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitalScreen);
  }

  _setInitalScreen(User? user) {
    user==null ? Get.offAll(() => LoginScreen()) : Get.off( () => HomeScreen());
  }

  Future<String> createUserWithEmailAndPass(String email,String password) async {
    String errorMessage;
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null ?  Get.offAll(() => HomeScreen()) : Get.off(() => LoginScreen());
    } on FirebaseAuthException catch(e){
      switch (e.code) {
        case 'weak-password' : errorMessage = 'Please enter strong password';
        break;
        case 'invalid-email' : errorMessage = 'Email is not valid or badly formatted';
        break;
        case 'email-already-in-use' : errorMessage = 'An account already exist for this email';
        break;
        case 'operation-not-allowed' : errorMessage = 'Operation is not allowed, Please contact support';
        break;
        case 'user-disabled' : errorMessage = 'This user has been disabled';
        break;
        default:
          errorMessage = 'done';
      }
      if (errorMessage != 'done') {
        return Future.error(errorMessage);
      }
    }catch(_){

    }
    return 'done';
  }
  Future<String> loginUserWithEmailAndPass(String email,String password) async {
    String errorMessage;
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null ?  Get.offAll(() => HomeScreen()) : Get.off(() => LoginScreen());

    } on FirebaseAuthException catch(e){
      switch (e.code) {
        case "account-exists-with-different-credential":
          errorMessage= 'account exists with different credential';
          break;
        case "email-already-in-use":
          errorMessage= "Email already used. Go to login page.";
          break;
        case "wrong-password":
          errorMessage= "Wrong email/password combination.";
          break;
        case "user-not-found":
          errorMessage ="No user found with this email.";
          break;
        case "user-disabled":
          errorMessage= "User disabled.";
          break;
        case "operation-not-allowed":
          errorMessage="Too many requests to log into this account.";
          break;
        case "operation-not-allowed":
          errorMessage = "Server error, please try again later.";
          break;
        case "ERROR_INVALID_EMAIL":
          errorMessage='Invalid email';
          break;
        case "invalid-email":
          errorMessage= "Email address is invalid.";
          break;
        default:
          errorMessage ='done';
      }
      if (errorMessage != 'done') {
        return Future.error(errorMessage);
      }
      else
        {
          firebaseUser.value != null ?  Get.offAll(() => HomeScreen()) : Get.off(() => LoginScreen());
        }
    } catch(_){

    }
      return 'done';
  }

  Future<void> logout() async => await _auth.signOut();
}
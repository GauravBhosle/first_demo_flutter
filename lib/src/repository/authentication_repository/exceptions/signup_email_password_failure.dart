class SignUpEmailPasswordFailure{
  final String message;

  const  SignUpEmailPasswordFailure([this.message='An unknown error message']);

  factory SignUpEmailPasswordFailure.code(String code){
    switch(code){
      case 'weak-password' : return const SignUpEmailPasswordFailure('Please enter strong password');
      case 'invalid-email' : return const SignUpEmailPasswordFailure('Email is not valid or badly formatted');
      case 'email-already-in-use' : return const SignUpEmailPasswordFailure('An account already exist for this email');
      case 'operation-not-allowed' : return const SignUpEmailPasswordFailure('Operation is not allowed, Please contact support');
      case 'user-disabled' : return const SignUpEmailPasswordFailure('This user has been disabled');
      default : return const SignUpEmailPasswordFailure();
    }
  }

}
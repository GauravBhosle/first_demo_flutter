class LoginEmailPasswordFailure {
  final String message;

  LoginEmailPasswordFailure([this.message = 'Unknown error occured']);

  factory LoginEmailPasswordFailure.code(String code){
    switch (code) {
      case "account-exists-with-different-credential":
        return LoginEmailPasswordFailure('account exists with different credential');
      case "email-already-in-use":
        return LoginEmailPasswordFailure("Email already used. Go to login page.");
      case "wrong-password":
        return LoginEmailPasswordFailure("Wrong email/password combination.");
      case "user-not-found":
        return LoginEmailPasswordFailure("No user found with this email.");
      case "user-disabled":
        return LoginEmailPasswordFailure("User disabled.");
      case "operation-not-allowed":
        return LoginEmailPasswordFailure("Too many requests to log into this account.");
      case "operation-not-allowed":
        return LoginEmailPasswordFailure("Server error, please try again later.");
      case "ERROR_INVALID_EMAIL":
        return LoginEmailPasswordFailure('Invalid email');
      case "invalid-email":
        return LoginEmailPasswordFailure("Email address is invalid.");
      default:
        return LoginEmailPasswordFailure();
    }
  }
}
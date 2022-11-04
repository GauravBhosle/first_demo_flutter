class Validation{

  static validateName(name){
    if(name == null || name.isEmpty){
      return "Can\'t be empty";
    }
    if(name.length<5){
      return "Username too short";
    }
    return null;
  }

  static validateEmail(email){
    if(email == null || email.isEmpty){
      return "Can\'t be empty";
    }
    if(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)){
      return null;
    }
    return 'Enter valid Email address';
  }

  static validatePhone(phone){
    if(phone == null || phone.isEmpty){
      return "Can\'t be empty";
    }
    if (phone.length != 10) {
      return 'Phone No. must be of 10 digit';
    } else {
      return null;
    }
  }

  static validatePassword(pass) {
    RegExp regex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (pass.isEmpty || pass==null) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(pass)) {
        return 'Enter at least 8 charater with one upper case,one lower case,one digit,one Special character ';
      } else {
        return null;
      }
    }
  }
}
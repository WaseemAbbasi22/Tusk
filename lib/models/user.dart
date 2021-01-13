class FUser {
  String uid;
  String email = '';
  String password = '';
  FUser({this.uid});

  void setEmail(String email) {
    this.email = email;
  }

  void setPass(String password) {
    this.password = password;
  }

  String getEmail() {
    return this.email;
  }

  String getPass() {
    return this.password;
  }
}

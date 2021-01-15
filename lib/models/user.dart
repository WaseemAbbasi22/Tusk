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

class UserData {
  final String uid;
  final String name;
  final String sugers;
  final int strength;
  UserData({this.uid, this.name, this.sugers, this.strength});
}

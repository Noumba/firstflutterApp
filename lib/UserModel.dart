
class User{
  int _id;
  String _username;
  String _password;
  String _email;
  String _phoneNumber;

  User(this._id, this._username, this._password, this._email, this._phoneNumber);

  User.fromMap(Map<String, dynamic> details ){
    this._id = details[_id];
    this._username = details[_username];
    this._password = details[_password];
    this._email = details[_email];
    this._phoneNumber = details[_phoneNumber];
  }

  String get username => _username;
  String get password => _password;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['id'] = _id;
    map['username'] = _username;
    map['password'] = _password;
    map['email'] = _email;
    map['phoneNumber'] = _phoneNumber;

    return map;
  }

}
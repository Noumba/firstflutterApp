class UserReal{
  int _id;
  String _username;
  String _password;
  String _email;
  String _phoneNumber;

  UserReal(this._id, this._username, this._password, this._email, this._phoneNumber);

  /*User.fromMap(Map<String, dynamic> map ){
    this._id = map[_id];
    this._username = map[_username];
    this._password = map[_password];
    this._email = map[_email];
    this._phoneNumber = map[_phoneNumber];
  }*/
  int get id => _id;
  String get username => _username;
  String get password => _password;
  String get email => _email;
  String get phoneNumber => _phoneNumber;

  /*Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['id'] = _id;
    map['username'] = _username;
    map['password'] = _password;
    map['email'] = _email;
    map['phoneNumber'] = _phoneNumber;

    return map;
  }*/


  factory UserReal.fromMap(Map<String, dynamic> data) {
    return UserReal(
      data['id'],
      data['username'],
      data['password'],
      data['email'],
      data['phoneNumber'],
    );
  }

  Map<String, dynamic> toMap() => {
    'id': _id,
    'username': _username,
    'password': _password,
    'email': _email,
    'phoneNumber': _phoneNumber,
  };

}
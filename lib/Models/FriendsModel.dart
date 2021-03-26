
class Friend{
  final int _uid;
  final String _name;
  final String _number;
  final String _email;
  final String _image;

  Friend(this._uid, this._name, this._number, this._email, this._image);


  int get uid => _uid;
  String get name => _name;
  String get number => _number;
  String get email => _email;
  String get image => _image;


  factory Friend.fromMap(Map<String, dynamic> data) {
    return Friend(
      data['uid'],
      data['name'],
      data['number'],
      data['email'],
      data['image'],
    );
  }

  Map<String, dynamic> toMap() => {
    'uid' : _uid,
    'name' : _name,
    'number' : _number,
    'email' : _email,
    'image' : _image,
  };

}
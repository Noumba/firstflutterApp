
class Messages{
  final String _textMessage;
  final String _type;
  final int _isMe;
  Messages(this._textMessage, this._type, this._isMe);


  String get message => _textMessage;
  String get messageType => _type;
  int get isMe => _isMe;


  factory Messages.fromMap(Map<String, dynamic> data) {
    return Messages(
      data['textMessage'],
      data['type'],
      data['isMe'],
    );
  }

  Map<String, dynamic> toMap() => {
    'textMessage' : _textMessage,
    'type' : _type,
    'isMe' : _isMe,
  };

}
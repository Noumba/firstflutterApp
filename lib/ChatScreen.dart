import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:my_first_flutter_app/ImageScreen.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as pPath;
import 'package:flutter/cupertino.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_first_flutter_app/DbHelper.dart';
import 'package:my_first_flutter_app/MessageModel.dart';
import 'package:emoji_picker/emoji_picker.dart';
//import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
// ignore: implementation_imports
import 'package:flutter_keyboard_visibility/src/keyboard_visibility_controller.dart';
import 'package:smart_reply/smart_reply.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

enum MessageType { text, image, sticker }

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController textMessage = TextEditingController();
  SQLiteDbProvider dbHelper;
  bool istyping = false;
  bool isEmojiVisible = false;
  bool isKeyBoardVisible = false;
  bool isEmojiSelected = false;
  final focusNode = FocusNode();
  ScrollController _controller = new ScrollController();
  // bool _firstAutoScrollExecuted = true;
  // bool _shouldAutoScroll = true;
  List<Messages> messages;
  List<String> _suggestedReplies = [
    'Hallo', 'Good Morning', 'Hope you fine', 'Sorry am running late', 'Please am not available now', 'Can we see later?',
    'Thanks for the Information, am really thankful', 'Merry Christmas', 'How can I help you please?', 'You are very much welcome',
    'Hallo, this is DaVinci Tech Power House. You are very much welcome to the number one 1 innovative tech brain in Central Africa.',
    'Yes, am so proud of you', 'Call me later please'
  ];
  List<TextMessage> _messages = [];
  int count = 5;
  int sentMessageCount = 0;
  int isMe = 1;
  final rand = Random();


  void _scrollToBottom() {
    setState(() {
      _controller.jumpTo(_controller.position.maxScrollExtent);
    });
  }

  TextMessage txt = TextMessage();

  refreshMessageList() async {
    messages = await dbHelper.getAllMessages();
    setState(() {});
  }

  // void _scrollListener(){
  //   _firstAutoScrollExecuted = true;
  //   if(_controller.hasClients && _controller.position.pixels == _controller.position.maxScrollExtent){
  //     setState(() {
  //       _shouldAutoScroll = true;
  //     });
  //   } else {
  //     setState(() {
  //       _shouldAutoScroll = false;
  //     });
  //   }
  // }

  void onClickedEmoji() async {
    if (isEmojiVisible) {
      focusNode.requestFocus();
    } else if (isKeyBoardVisible) {
      await SystemChannels.textInput.invokeMethod('TextInput.hide');
      await Future.delayed(Duration(milliseconds: 100));
    }
    //onBlurred();
    focusNode.requestFocus();
    toogleEmojiKeyBoard();
  }

  Future toogleEmojiKeyBoard() async {
    if (isKeyBoardVisible) {
      FocusScope.of(context)
          .unfocus(disposition: UnfocusDisposition.previouslyFocusedChild);
    }
    setState(() {
      isEmojiVisible = !isEmojiVisible;
    });
  }

  void onEmojiSelected(String emoji) {
    textMessage.text = textMessage.text + emoji;
    isEmojiSelected = true;
    setState(() {});
  }

  Future<void> getSuggestedReplies() async{
    SmartReply.suggestReplies(_messages).then((replies) {
      setState(() {
        _suggestedReplies = replies;
      });
    });

  }

  Widget _showEmoji() {
    return EmojiPicker(
        rows: 3,
        columns: 7,
        buttonMode: ButtonMode.MATERIAL,
        recommendKeywords: ["racing", "church", "horse", "moon", "love"],
        numRecommended: 10,
        onEmojiSelected: (Emoji emoji, category) =>
            onEmojiSelected(emoji.emoji));
  }

  Widget chats() {
    return new FutureBuilder<List<Messages>>(
        future: dbHelper.getAllMessages(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              if (_controller.hasClients) {
                _controller.jumpTo(_controller.position.maxScrollExtent);
              } else {
                setState(() {});
              }
            });
            return new ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                shrinkWrap: true,
                controller: _controller,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: snapshot.data[index].isMe == 1 ? MainAxisAlignment.end : MainAxisAlignment.start,
                    crossAxisAlignment: snapshot.data[index].isMe == 1 ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: snapshot.data[index].isMe == 1 ? MainAxisAlignment.end : MainAxisAlignment.start,
                        crossAxisAlignment: snapshot.data[index].isMe == 1 ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                        children: [
                          Container(
                            constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.7),
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 4.0,
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              //alignment: Alignment.centerRight,
                              decoration: BoxDecoration(
                                  color: snapshot.data[index].messageType ==
                                          MessageType.text.toString() && snapshot.data[index].isMe == 1
                                      ? Colors.lightBlueAccent
                                      : snapshot.data[index].messageType ==
                                      MessageType.text.toString() && snapshot.data[index].isMe == 2
                                  ? Colors.white70 : Colors.transparent,
                                  borderRadius: BorderRadius.only(
                                      topLeft: snapshot.data[index].isMe == 1 ? Radius.circular(24) : Radius.zero,
                                      topRight: Radius.circular(24),
                                      bottomLeft: Radius.circular(24),
                                      bottomRight: snapshot.data[index].isMe == 1 ? Radius.zero : Radius.circular(24))),
                              child: snapshot.data[index].messageType ==
                                      MessageType.text.toString()
                                  ? Text(
                                      snapshot.data[index].message,
                                      style: TextStyle(
                                          color: Colors.grey[800],
                                          fontFamily: 'sans-serif',
                                          fontSize: 15,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400),
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HeroDestination(File(
                                                        snapshot.data[index]
                                                            .message))));
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10.0),
                                        child: Image.file(
                                          File(snapshot.data[index].message),
                                          fit: BoxFit.cover,
                                          height:
                                              MediaQuery.of(context).size.height *
                                                  0.3,
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  0.5,
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                });
          }
          return Container(
            child: CircularProgressIndicator(),
          );
        });
  }

  void scroll() {
    // if(_firstAutoScrollExecuted && _controller.hasClients){
    //   _scrollToBottom();
    // }
    setState(() {
      if (messages.length > count) {
        _scrollToBottom();
      }
    });
  }

  File _takenImage;

  Future<void> _takePicture() async {
    final imageFile = await ImagePicker().getImage(
        source: ImageSource.camera,);
    if (imageFile == null) {
      return 'No picks';
    }
    _takenImage = File(imageFile.path);
    final appDir = await pPath.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await _takenImage.copy('${appDir.path}/$fileName');
    final dbSavedImage = savedImage.path;
    var messageToSend = Messages(dbSavedImage, MessageType.image.toString(), isMe);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ImageDestination(_takenImage, messageToSend)));
    setState(() {
      sentMessageCount += 1;
    });
  }

  Future<void> _selectPictureFromGallery() async {
    final imageFile = await ImagePicker().getImage(
        source: ImageSource.gallery,);
    if (imageFile == null) {
      return 'No picks';
    }
    _takenImage = File(imageFile.path);
    final appDir = await pPath.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await _takenImage.copy('${appDir.path}/$fileName');
    final dbSavedImage = savedImage.path;


    var messageToSend = Messages(dbSavedImage, MessageType.image.toString(), isMe);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ImageDestination(_takenImage, messageToSend)));
    setState(() {
      sentMessageCount += 1;
    });
  }

  void showFileOptions() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.2,
            margin: EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
            padding: EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.orange[400],
                          borderRadius: BorderRadius.circular(50.0)),
                      child: IconButton(
                          icon: Icon(
                            Icons.insert_drive_file_rounded,
                            color: Colors.white,
                          ),
                          onPressed: () {}),
                    ),
                    Text(
                      'Document',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.pink[500],
                          borderRadius: BorderRadius.circular(50.0)),
                      child: IconButton(
                          icon: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            _takePicture();
                          }),
                    ),
                    Text(
                      'Camera',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.blue[700],
                          borderRadius: BorderRadius.circular(50.0)),
                      child: IconButton(
                          icon: Icon(
                            Icons.photo,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            _selectPictureFromGallery();
                          }),
                    ),
                    Text(
                      'Gallery',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
          );
        });
  }

  Future<bool> onBackPress() {
    if (isEmojiVisible) {
      toogleEmojiKeyBoard();
    } else {
      Navigator.pop(context);
    }

    return Future.value(false);
  }

  @override
  void initState() {
    // TODO: implement initState
    dbHelper = SQLiteDbProvider();
    KeyboardVisibilityController().onChange.listen((isKeyBoardVisible) {
      setState(() {
        this.isKeyBoardVisible = isKeyBoardVisible;
      });
      if (isKeyBoardVisible && isEmojiVisible) {
        setState(() {
          isKeyBoardVisible = false;
        });
      }
    });
    // _controller.addListener(_scrollListener);
    refreshMessageList();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // _controller.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // scroll();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey[800],
            )),
        backgroundColor: Colors.white,
        title: Text(
          'Chat Session',
          style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.w600,
              fontSize: 18),
        ),
        centerTitle: false,
        elevation: 0.0,
        actions: [
          IconButton(
              icon: Icon(
                Icons.call,
                color: Colors.grey[800],
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.grey[800],
              ),
              onPressed: () {}),
        ],
      ),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(child: chats()),
            WillPopScope(
              onWillPop: onBackPress,
              child: Stack(
                children: [
                  Container(
                    //alignment: Alignment.bottomCenter,
                    color: Colors.white,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5.0),
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 5.0,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 2.0,
                              ),
                              constraints: BoxConstraints(
                                maxHeight: 100,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    style: BorderStyle.solid,
                                    color: Colors.grey),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: TextField(
                                focusNode: focusNode,
                                controller: textMessage,
                                keyboardType: TextInputType.text,
                                expands: false,
                                maxLines: 100,
                                minLines: 1,
                                cursorHeight: 25.0,
                                onChanged: (hintText) async {
                                  if (textMessage.text != "") {
                                    setState(() {
                                      istyping = true;
                                    });
                                  } else if (textMessage.text == "") {
                                    setState(() {
                                      istyping = false;
                                    });
                                  }
                                },
                                onTap: () {
                                  setState(() {
                                    isEmojiVisible = false;
                                  });
                                },
                                decoration: InputDecoration(
                                    hintText: 'Text message',
                                    border: InputBorder.none,
                                    prefixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          onClickedEmoji();
                                        });
                                      },
                                      icon: isKeyBoardVisible != true
                                          ? Icon(
                                              Icons.keyboard_rounded,
                                              color: Colors.grey,
                                            )
                                          : Icon(
                                              Icons.emoji_emotions_outlined,
                                              color: Colors.purple,
                                            ),
                                    ),
                                    suffixIcon: IconButton(
                                        icon: Icon(
                                          Icons.attach_file,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {
                                          showFileOptions();
                                        })),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.0, vertical: 10.0),
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0),
                                color: istyping || isEmojiSelected
                                    ? Colors.white
                                    : Colors.grey,
                              ),
                              child: istyping || isEmojiSelected
                                  ? GestureDetector(
                                      onTap: () {
                                        dbHelper.insertTextMessage(Messages(
                                            textMessage.text,
                                            MessageType.text.toString(), isMe));
                                        textMessage.text = "";
                                        istyping = false;
                                        isEmojiSelected = false;
                                        print(istyping);
                                        print(isEmojiSelected);
                                        setState(() {
                                          sentMessageCount = sentMessageCount + 1;
                                          scroll();
                                        });
                                        if(sentMessageCount % 2 == 0){
                                          dbHelper.insertTextMessage(Messages(
                                              _suggestedReplies[rand.nextInt(_suggestedReplies.length)],
                                              MessageType.text.toString(),
                                              2));
                                        }
                                      },
                                      child: Center(
                                        child: Icon(
                                          Icons.send,
                                          color: Colors.indigo,
                                          size: 30,
                                        ),
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.mic,
                                        color: Colors.indigo,
                                      ),
                                    ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  //isEmojiVisible ? _showEmoji() : Container(height: 40, color: Colors.blue,),
                  // Offstage(offstage: !isEmojiVisible,
                  //     child: _showEmoji())
                ],
              ),
            ),
            isEmojiVisible ? _showEmoji() : Container(),
          ],
        ),
      ),
    );
  }
}

class ImageDestination extends StatelessWidget {
  final File photoName;
  final Messages message;
  ImageDestination(this.photoName, this.message);
  @override
  Widget build(BuildContext context) {
    SQLiteDbProvider dbHelper = SQLiteDbProvider();
    return Scaffold(
      appBar: AppBar(
        title: Text('Image'),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(icon: Icon(Icons.edit), onPressed: () {}),
          IconButton(icon: Icon(Icons.crop), onPressed: () {})
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dbHelper.insertTextMessage(message);
          Navigator.pop(context);
        },
        child: Icon(
          Icons.send,
          color: Colors.white,
        ),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(0.0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.file(
            photoName,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

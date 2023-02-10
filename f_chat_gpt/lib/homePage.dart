import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class Message {
  String text;
  String sender;

  Message(this.text, this.sender);
}

class _HomePageState extends State<HomePage> {
  TextEditingController _textController = TextEditingController();
  List<Message> messages = [
    Message("Welcome to Stupid", "robot"),
  ];
  var themeData = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.indigo,
  );
  bool isUserMessage(int index) {
    return index % 2 == 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeData.backgroundColor,
      appBar: AppBar(
        shadowColor: Color.fromARGB(255, 211, 206, 206),
        backgroundColor: themeData.backgroundColor,
        centerTitle: true,
        // elevation: 1,
        title: Text(
          'Stupid:AI',
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.brightness_high),
            onPressed: () {
              setState(() {
                themeData = themeData.copyWith(
                    brightness: themeData.brightness == Brightness.dark
                        ? Brightness.light
                        : Brightness.dark);
                print(themeData.brightness);
                setState(() {});
              });
            },
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                reverse: false,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  var message = messages[index];
                  var alignment = Alignment.centerRight;
                  if (message.sender == "robot") {
                    alignment = Alignment.centerLeft;
                  }
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        alignment: alignment,
                        decoration: BoxDecoration(
                          color: themeData.primaryColor,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Text(
                          message.text,
                          style: TextStyle(
                            color: themeData.backgroundColor,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        hintText: 'Ask a question',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        suffixIcon: IconButton(
                            icon: Icon(Icons.send),
                            onPressed: () {
                              setState(() {
                                if (_textController.text.isNotEmpty) {
                                  Message newMessage =
                                      Message(_textController.text, "User");
                                  messages.add(newMessage);
                                  print(messages);
                                  print(_textController.text);
                                  _textController.clear();
                                  setState(() {});
                                }
                              });
                            }),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 100.0,
              child: DrawerHeader(
                child: Text('Under development'),
                decoration: BoxDecoration(color: themeData.backgroundColor),
              ),
            ),
            ListTile(
              title: Text('Under development'),
              onTap: () {
                // Update the state of the app
                // ...
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Under development'),
              onTap: () {
                // Update the state of the app
                // ...
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

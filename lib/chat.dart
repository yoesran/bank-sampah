import 'package:bank_sampah_app/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_10.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_3.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_4.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_5.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_6.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_7.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_8.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_9.dart';
import 'package:get/get.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  AppBar appBar = AppBar(
    elevation: 0,
    leadingWidth: 100,
    leading: Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: GestureDetector(
        onTap: () {
          Get.offAll(() => Home());
        },
        child: Row(
          children: [
            Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            Text(
              "Home",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
    centerTitle: true,
    backgroundColor: Color(0xFF507B45),
    title: Text(
      "Customer Care",
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar,
        body: MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  TextEditingController chatController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: Stack(
        children: [
          ListView(
            children: <Widget>[
              getSenderView(ChatBubbleClipper5(type: BubbleType.sendBubble), context),
              getReceiverView(ChatBubbleClipper5(type: BubbleType.receiverBubble), context),
              getSenderView(ChatBubbleClipper5(type: BubbleType.sendBubble), context),
              getReceiverView(ChatBubbleClipper5(type: BubbleType.receiverBubble), context),
              getReceiverView(ChatBubbleClipper5(type: BubbleType.receiverBubble), context),
              getSenderView(ChatBubbleClipper5(type: BubbleType.sendBubble), context),
              getSenderView(ChatBubbleClipper5(type: BubbleType.sendBubble), context),
              getReceiverView(ChatBubbleClipper5(type: BubbleType.receiverBubble), context),
              getSenderView(ChatBubbleClipper5(type: BubbleType.sendBubble), context),
              getReceiverView(ChatBubbleClipper5(type: BubbleType.receiverBubble), context),
              getReceiverView(ChatBubbleClipper5(type: BubbleType.receiverBubble), context),
              getSenderView(ChatBubbleClipper5(type: BubbleType.sendBubble), context),
              SizedBox(
                height: 75,
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 100,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Color.fromRGBO(220, 220, 220, 1),
                    ),
                    padding: EdgeInsets.only(left: 15),
                    margin: EdgeInsets.only(top: 15),
                    child: TextFormField(
                      controller: chatController,
                      decoration: InputDecoration(
                        hintText: "Type Your Message",
                        hintStyle: TextStyle(color: Colors.black26),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      onChanged: (value) {},
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Color.fromRGBO(220, 220, 220, 1)),
                    margin: EdgeInsets.only(
                      top: 15,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.send,
                        size: 30.0,
                        color: Colors.blue,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  getSenderView(CustomClipper clipper, BuildContext context) => ChatBubble(
        clipper: clipper,
        alignment: Alignment.topRight,
        margin: EdgeInsets.only(top: 20),
        backGroundColor: Colors.green.shade800,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

  getReceiverView(CustomClipper clipper, BuildContext context) => ChatBubble(
        clipper: clipper,
        backGroundColor: Color(0xffE7E7ED),
        margin: EdgeInsets.only(top: 20),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: Text(
            "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
            style: TextStyle(color: Colors.black),
          ),
        ),
      );
}

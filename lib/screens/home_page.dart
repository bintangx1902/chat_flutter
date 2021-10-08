import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
    const HomePage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        body: SafeArea(
                child: Padding(
                padding: EdgeInsets.all(8),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                        Text("Message", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
                                        FlatButton(
                                            child: Icon(Icons.mode_edit, color: Colors.greenAccent, size: 32),
                                            onPressed: () {}
                                        )
                                    ],
                            ),
                            SizedBox(height: 20,),
                            Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: TextField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(27.0),
                                            gapPadding: 4,
                                        ),
                                        fillColor: Colors.white,
                                        labelStyle: TextStyle(color: Colors.grey[500], fontSize: 14.0),
                                        labelText: 'Search',
                                        counterText: '',
                                        prefixIcon: Icon(Icons.search, color: Colors.grey[500], size: 28.0,),
                                    )
                                ),
                            ),

                            SizedBox(height: 25,),
                            Text('Activities', style: TextStyle(fontWeight: FontWeight.bold),),
                            SizedBox(height: 10,),
                            Container(
                                height: 115,
                                child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                        UserWidget(family: 'Selma', pic: 'user8.jpg'), 
                                        UserWidget(family: 'Selma', pic: 'user8.jpg'), 
                                        UserWidget(family: 'Selma', pic: 'user8.jpg'), 
                                        UserWidget(family: 'Selma', pic: 'user8.jpg'), 
                                        UserWidget(family: 'Selma', pic: 'user8.jpg'), 
                                    ],
                                ),
                            ),
                            SizedBox(height: 25,),
                            Text("Messages", style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 25,),
                            Expanded(
                                child: ListView(
                                    children: [
                                        MessageWidget(family: 'Johan', msg: 'hai bro, whatsup today?', pic: 'user2.jpg', time: '18min', count: 1,),
                                        MessageWidget(family: 'Brox', msg: 'The fuck what r u doin to her?!', pic: 'user2.jpg', time: '18min', count: 0,),
                                        MessageWidget(family: 'Sanders', msg: 'Lets go hangin!', pic: 'user2.jpg', time: '18min', count: 0,),
                                    ],
                                ),
                            ),
                        ],
                    ),
                )
            ),
            bottomNavigationBar: BottomNavigationBar(
                iconSize: 27,
                items: [
                    BottomNavigationBarItem(icon: Icon(Icons.chat_bubble, color: Colors.grey,), activeIcon: Icon(Icons.chat_bubble_outline_outlined, color: Colors.green,), label: 'Chat'),
                    BottomNavigationBarItem(icon: Icon(Icons.phone, color: Colors.grey,), label: 'Call'),
                    BottomNavigationBarItem(icon: Icon(Icons.camera, color: Colors.grey,), label: 'Camera'),
                    BottomNavigationBarItem(icon: Icon(Icons.settings, color: Colors.grey,), label: 'Settings'),
                ],
            ),
        );
    }
}

// messages widget
class MessageWidget extends StatefulWidget {
    const MessageWidget({Key? key, required this.family, required this.msg, required this.pic, required this.time, required this.count}) : super(key: key);

    final String family;
    final String msg;
    final String pic;
    final String time;
    final int count;

    @override
    State<MessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
    @override
    Widget build(BuildContext context) {
        return Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Container(
                        padding: EdgeInsets.all(3),
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(45),

                        ),
                        child: Container(
                            child: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(45),

                                ),
                                child: Container(
                                    width: 55,
                                    height: 55,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(45),
                                        image: DecorationImage(image: AssetImage('images/${widget.pic}'))
                                    ),
                                
                                ),
                            ),
                        ),
                    ),
                    SizedBox(height: 10,),
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Text("${widget.family}", style: TextStyle(fontWeight: FontWeight.bold),),
                                SizedBox(height: 10),
                                Text(
                                    "${widget.msg}",
                                    style: TextStyle(
                                        fontSize: 15, 
                                        color: Colors.grey.shade700, 
                                        height: 1.15,
                                        ),
                                    )
                            ],
                        ),
                    ),
                    Column(
                        children: [
                            Text("${widget.time}", style: TextStyle(
                                color: widget.count == 0 ? Colors.grey.shade800 : Colors.green, fontSize: 12),
                                ),
                            SizedBox(height: 10,),
                            this.widget.count == 0
                            ? Container():
                            CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.green.shade600,
                                child: Text('1', style: TextStyle(color: Colors.white),),
                            ),
                        ],
                    ),
                ],
            ),
        );
    }
}

// user widget
class UserWidget extends StatefulWidget {
    const UserWidget({Key? key, required this.family, required this.pic}) : super(key:key);

    final String family;
    final String pic;

    @override
    State<UserWidget> createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
    @override
    Widget build(BuildContext context) {
        return Column(
            children: [
                Container(
                    padding: EdgeInsets.all(3),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(45),

                    ),
                    child: Container(
                        child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(45),

                            ),
                            child: Container(
                                width: 55,
                                height: 55,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(45),
                                    image: DecorationImage(image: AssetImage('images/${widget.pic}')),
                                ),
                            
                            ),
                        ),
                    ),
                ),
                const SizedBox(height: 10,),
                Text("${widget.family}", style: TextStyle(fontWeight: FontWeight.bold),)
            ],
        );
    }
}

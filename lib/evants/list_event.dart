import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenpeace/streem_firestore/event_stream.dart';
import 'package:greenpeace/Footer/footer.dart';

class List_event extends StatefulWidget {
  List_event({Key key}) : super(key: key);
  static const String id = "All_event";
  @override
  _List_event createState() => _List_event();
}

class _List_event extends State<List_event> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(child: Image.asset('image/logo_greem.png', scale: 2)),
          automaticallyImplyLeading: false),
      body: Container(
          color: Colors.white,
          //height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [

                    SizedBox(width: 100),
                    Text(
                      'אירועים',
                      style: TextStyle(
                          fontFamily: 'Assistant',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ],
                ),
                event_stream(),
              ],
            ),
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(int.parse("0xff6ed000")),
        child: Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, 'new_event'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:greenpeace/personal_massage/personalMessModel.dart';
import 'package:greenpeace/personal_massage/mass_page.dart';
import 'package:greenpeace/globalfunc.dart';

final _firestore = Firestore.instance;

class messMenager extends StatelessWidget {
  messMenager({this.width_page, this.height_page});
  final height_page;
  final width_page;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection("messageMenager").snapshots(),
      // ignore: missing_return
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final reports = snapshot.data.documents;
        List<personalMessContainer> personalsList = [];
        for (var report in reports) {
          final messageText = report.data["text"];
          final messageSender = report.data["sender"];
          final time = report.data["time"];
          final messageSenderId = report.data["senderID"];

          final personalsContainer = personalMessContainer(
            mess: personalMessModel(
              sender: messageSender,
              senderId: messageSenderId.toString(),
              time: time.toDate(),
              text: messageText,
            ),
            height_page: height_page,
            width_page: width_page,
          );
          personalsList.add(personalsContainer);
          //  reports.sort((a, b) => b.time.compareTo(a.time));

        }
        return Column(
          children: personalsList,
        );
      },
    );
  }
}

class personalMessContainer extends StatelessWidget {
  final personalMessModel mess;
  var height_page;
  var width_page;
  personalMessContainer({
    this.mess,
    this.height_page,
    this.width_page,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            //height: MediaQuery.of(context).size.height/(3),
            child: ListTile(
              leading: Container(
                decoration: new BoxDecoration(
                    border: new Border(
                        right:
                            new BorderSide(width: 1.0, color: Colors.white))),
                child: Container(
                  padding: const EdgeInsets.all(0.0),
                  child: ImageIcon(
                    AssetImage("image/feed2.png"),
                    color: Colors.black,
                  ),
                ),
              ),
              title: Text(
                mess.sender,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
              subtitle: Text(cutTimeString(mess.time.toString()),
                  overflow: TextOverflow.ellipsis),
              trailing: FlatButton(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                    width: 1,
                    child: Icon(Icons.keyboard_arrow_left,
                        color: Colors.black, size: 30.0)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => mass(
                                topic: "הודעה פרטית",
                                text: mess.text,
                                sender: mess.sender,
                                senderId: mess.senderId,
                              )));
                },
              ),
            ),
          ),
        ),
        // SizedBox(
        //   height: 10,
        // ),
      ],
    );
  }
}

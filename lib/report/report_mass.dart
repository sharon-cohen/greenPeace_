import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:greenpeace/report/report_model.dart';
import 'package:greenpeace/GetID_DB/getid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:greenpeace/globalfunc.dart';

final _firestore = Firestore.instance;

class reportMass extends StatelessWidget {
  final reportModel report;

  const reportMass({Key key, this.report}) : super(key: key);
  Widget mass(BuildContext context) {
    if (report.text.toString() != "") {
      return Align(
        child: new Text(
          report.text,
          style: new TextStyle(
            fontSize: 20,
            fontFamily: 'Assistant',
          ),
        ), //so big text
        alignment: FractionalOffset.topRight,
      );
    } else {
      return TextButton(
        onPressed: () {
          showAlertDialogImage(context, report.image);
        },
        child: Container(
          child: CachedNetworkImage(
            imageUrl: report.image,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(child: Image.asset('image/logo_greem.png', scale: 2)),
          automaticallyImplyLeading: false),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              //todo
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 20,
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                        icon: Icon(
                          Icons.clear,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "???????????? ??'????",
                        style: new TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Assistant',
                        ),
                      ),
                      Spacer(),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.white,
                  // width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height / 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                        child: Row(
                          children: [
                            new Text(
                              "??????: ",
                              style: new TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Assistant',
                              ),
                            ),
                            new Text(
                              report.sender,
                              style: new TextStyle(
                                fontSize: 20,
                                fontFamily: 'Assistant',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(thickness: 1, color: Colors.grey[400]),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                        child: Row(
                          children: [
                            new Text("????????: ",
                                style: new TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Assistant',
                                )), 
                            new Text(" ??????????",
                                style: new TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Assistant',
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                //padding: const EdgeInsets.all(8.0),
                padding: EdgeInsets.fromLTRB(8, 1, 8, 8),
                child: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.87,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
                    child: mass(context),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  //todo suit to other
                  // color: Colors.white,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 10,
                              width: MediaQuery.of(context).size.height / 8,
                              decoration: BoxDecoration(
                                color: Color(int.parse("0xff6ed000")),
                                border: Border.all(
                                    color: Color(int.parse("0xff6ed000"))),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      showDialog(
                                          builder: (_) =>  new Dialog(
                                            child: Container(
                                              width: 100,
                                              height: 100,
                                              child: new Column(
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons
                                                            .not_interested),
                                                        Text(
                                                            ' ?????? ?????????? ?????????? ???? ?????????????????',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Assistant',
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.black,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Row(
                                                    children: [
                                                      Spacer(),
                                                      new TextButton(
                                                        child: new Text("??????",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Assistant',
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.black,
                                                            )),
                                                        onPressed: () async {
                                                          if (report.image !=
                                                              "") {
                                                            String idevent =
                                                                await Getmess(
                                                                    report
                                                                        .image,
                                                                    true);
                                                            await _firestore
                                                                .collection(
                                                                    "messages")
                                                                .document(
                                                                    idevent)
                                                                .delete();
                                                            String idreport =
                                                                await Getreport(
                                                                    report
                                                                        .image,
                                                                    true);
                                                            await _firestore
                                                                .collection(
                                                                    "report")
                                                                .document(
                                                                    idreport)
                                                                .delete();

                                                            Navigator.pop(
                                                                context, true);
                                                            Navigator.pop(
                                                                context, true);
                                                          } else {
                                                            String idevent =
                                                                await Getmess(
                                                                    report.text,
                                                                    false);
                                                            await _firestore
                                                                .collection(
                                                                    "messages")
                                                                .document(
                                                                    idevent)
                                                                .delete();
                                                            String idreport =
                                                                await Getreport(
                                                                    report.text,
                                                                    false);
                                                            await _firestore
                                                                .collection(
                                                                    "report")
                                                                .document(
                                                                    idreport)
                                                                .delete();
                                                            Navigator.pop(
                                                                context, true);
                                                            Navigator.pop(
                                                                context, true);
                                                          }
                                                        },
                                                      ),
                                                      new TextButton(
                                                        child: new Text("??????",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Assistant',
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.black,
                                                            )),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context, true);
                                                        },
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          context: context);
                                    },
                                    // onPressed: () async {
                                    //   if (report.image != null) {
                                    //     String idevent =
                                    //         await Getmess(report.image, true);
                                    //     await _firestore
                                    //         .collection("messages")
                                    //         .document(idevent)
                                    //         .delete();
                                    //     Navigator.pop(context);
                                    //   } else {
                                    //     String idevent =
                                    //         await Getmess(report.text, false);
                                    //     await _firestore
                                    //         .collection("messages")
                                    //         .document(idevent)
                                    //         .delete();
                                    //     Navigator.pop(context);
                                    //   }
                                    // },
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'image/deletefeed.png',
                                          color: Colors.white,
                                          width: 30,
                                          height: 30,
                                        ),
                                        Text('??????',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontFamily: 'Assistant',
                                            )),
                                      ],
                                    ),
                                    // color: Colors.blue,
                                    // textColor: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 10,
                              width: MediaQuery.of(context).size.height / 8,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[600]),
                                //color: Colors.black87,
                              ),
                              child: Column(
                                //crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: [
                                  TextButton(
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'image/delete.png',
                                          color: Colors.black,
                                          width: 30,
                                          height: 30,
                                        ),
                                        Text('??????????',
                                            style: TextStyle(
                                              fontFamily: 'Assistant',
                                              fontSize: 15,
                                              color: Colors.black,
                                            )),
                                      ],
                                    ),
                                    onPressed: () {
                                      showDialog(
                                          builder: (_) =>  new Dialog(
                                            child: Container(
                                              width: 100,
                                              height: 100,
                                              child: new Column(
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  5, 0, 5, 0),
                                                          child: Icon(Icons
                                                              .delete_forever),
                                                        ),
                                                        Text(
                                                            '?????? ???????????? ???????????? ?????',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Assistant',
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.black,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Row(
                                                    children: [
                                                      Spacer(),
                                                      new TextButton(
                                                        child: new Text("??????????",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Assistant',
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.black,
                                                            )),
                                                        onPressed: () async {
                                                          if (report.image !=
                                                              "") {
                                                            String idevent =
                                                                await Getreport(
                                                                    report
                                                                        .image,
                                                                    true);
                                                            await _firestore
                                                                .collection(
                                                                    "report")
                                                                .document(
                                                                    idevent)
                                                                .delete();
                                                            Navigator.pop(
                                                                context, true);
                                                            Navigator.pop(
                                                                context, true);
                                                          } else {
                                                            String idevent =
                                                                await Getreport(
                                                                    report.text,
                                                                    false);
                                                            await _firestore
                                                                .collection(
                                                                    "report")
                                                                .document(
                                                                    idevent)
                                                                .delete();
                                                            Navigator.pop(
                                                                context, true);
                                                            Navigator.pop(
                                                                context, true);
                                                          }
                                                        },
                                                      ),
                                                      new TextButton(
                                                        child: new Text("??????",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Assistant',
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.black,
                                                            )),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context, true);
                                                        },
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          context: context);
                                    },
                                  ),
                                  // SizedBox(width: 200),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

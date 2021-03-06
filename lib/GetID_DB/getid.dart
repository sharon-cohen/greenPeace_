

import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> Getevent(String title) async {

  final QuerySnapshot result = await Firestore.instance
      .collection('events')
      .where('title', isEqualTo: title)
      .limit(1)
      .getDocuments();
  final List<DocumentSnapshot> documents = result.documents;
  if(documents.length == 1)
    return documents[0].documentID;
  else
    return "not exist";



}
Future<String> Getreport(String text,bool isImage) async {
if(isImage==true){
  final QuerySnapshot result = await Firestore.instance
      .collection('report')
      .where('url', isEqualTo: text)
      .limit(1)
      .getDocuments();
  final List<DocumentSnapshot> documents = result.documents;
  if(documents.length == 1)
    return documents[0].documentID;
  else
    return "not exist";
}

else{
  final QuerySnapshot result = await Firestore.instance
      .collection('report')
      .where('text', isEqualTo: text)
      .limit(1)
      .getDocuments();
  final List<DocumentSnapshot> documents = result.documents;
  if(documents.length == 1)
    return documents[0].documentID;
  else
    return "not exist";
}


}
Future<String> Getmess(String text,bool isImage) async {
  if(isImage==true){
    final QuerySnapshot result = await Firestore.instance
        .collection('messages')
        .where('url', isEqualTo: text)
        .limit(1)
        .getDocuments();
    final List<DocumentSnapshot> documents = result.documents;
    if(documents.length == 1)
      return documents[0].documentID;
    else
      return "not exist";
  }

  else{
    final QuerySnapshot result = await Firestore.instance
        .collection('messages')
        .where('text', isEqualTo: text)
        .limit(1)
        .getDocuments();
    final List<DocumentSnapshot> documents = result.documents;
    if(documents.length == 1)
      return documents[0].documentID;
    else
      return "not exist";
  }


}
Future<String> GetPersonalMess(String text,String sender) async {

  final QuerySnapshot result = await Firestore.instance
      .collection('personalMess')
      .where('text', isEqualTo: text)
      .where('sender',isEqualTo: sender)
      .limit(1)
      .getDocuments();
  final List<DocumentSnapshot> documents = result.documents;
  if(documents.length == 1)
    return documents[0].documentID;
  else
    return "not exist";



}
Future<String> GetMessToAll(String text,String sender) async {

  final QuerySnapshot result = await Firestore.instance
      .collection('MessForAll')
      .where('text', isEqualTo: text)
      .where('sender',isEqualTo: sender)
      .limit(1)
      .getDocuments();
  final List<DocumentSnapshot> documents = result.documents;
  if(documents.length == 1)
    return documents[0].documentID;
  else
    return "not exist";



}
Future<String> GetMenagerMess(String text,String sender) async {

  final QuerySnapshot result = await Firestore.instance
      .collection('messageMenager')
      .where('text', isEqualTo: text)
      .where('sender',isEqualTo: sender)
      .limit(1)
      .getDocuments();
  final List<DocumentSnapshot> documents = result.documents;
  if(documents.length == 1)
    return documents[0].documentID;
  else
    return "not exist";



}
Future<String> GetHotMess(String text,String sender) async {

  final QuerySnapshot result = await Firestore.instance
      .collection('hotReport')
      .where('text', isEqualTo: text)
      .where('sender',isEqualTo: sender)
      .limit(1)
      .getDocuments();
  final List<DocumentSnapshot> documents = result.documents;
  if(documents.length == 1)
    return documents[0].documentID;
  else
    return "not exist";



}
Future<String> GetStrugle(String name) async {

  final QuerySnapshot result = await Firestore.instance
      .collection('struggle')
      .where('title', isEqualTo: name)
      .limit(1)
      .getDocuments();
  final List<DocumentSnapshot> documents = result.documents;
  if(documents.length == 1)
    return documents[0].documentID;
  else
    return "not exist";



}
Future<bool> CheckNameUserExist(String name) async {
  final QuerySnapshot result = await Firestore.instance
      .collection('users')
      .where('name', isEqualTo: name)
      .limit(1)
      .getDocuments();
  final List<DocumentSnapshot> documents = result.documents;
  if(documents.length == 1)
    return true;
  else
    return false;
  }
Future<bool> CheckNameStruggleExist(String name) async {
  final QuerySnapshot result = await Firestore.instance
      .collection('struggle')
      .where('title', isEqualTo: name)
      .limit(1)
      .getDocuments();
  final List<DocumentSnapshot> documents = result.documents;
  if(documents.length == 1)
    return true;
  else
    return false;
}
Future<bool> CheckNameEventExist(String name) async {
  final QuerySnapshot result = await Firestore.instance
      .collection('events')
      .where('title', isEqualTo: name)
      .limit(1)
      .getDocuments();
  final List<DocumentSnapshot> documents = result.documents;
  if(documents.length == 1)
    return true;
  else
    return false;
}
Future<String>Getuser(String name)async{
  final QuerySnapshot result = await Firestore.instance
      .collection('users')
      .where('name', isEqualTo: name)
      .limit(1)
      .getDocuments();
  final List<DocumentSnapshot> documents = result.documents;
  if(documents.length == 1)
    return documents[0].documentID;
  else
    return "not exist";
}
Future<String>GetuserByEmail(String email)async{

  email=email.toLowerCase();
   QuerySnapshot result=null;

  try{
     result = await Firestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .limit(1)
        .getDocuments();
  }
  catch(err) {

    return "not exist";
  }

  final List<DocumentSnapshot> documents = result.documents;


  if(documents.length == 1)
    return documents[0].documentID;
  else
    return "not exist";
}
Future<String>GetMailuserByName(String name)async{

  name=name.toLowerCase();
  QuerySnapshot result=null;

  try{
    result = await Firestore.instance
        .collection('users')
        .where('name', isEqualTo: name)
        .limit(1)
        .getDocuments();
  }
  catch(err) {

    return "not exist";
  }

  final List<DocumentSnapshot> documents = result.documents;


  if(documents.length == 1)
    return documents[0]["email"];
  else
    return "not exist";
}
Future<String>GetuserByName(String name)async{

  name=name.toLowerCase();
  QuerySnapshot result=null;

  try{
    result = await Firestore.instance
        .collection('users')
        .where('name', isEqualTo: name)
        .limit(1)
        .getDocuments();
  }
  catch(err) {

    return "not exist";
  }

  final List<DocumentSnapshot> documents = result.documents;


  if(documents.length == 1)
    return documents[0].documentID;
  else
    return "not exist";
}
Future<bool>TypeManegeRoleuser(String userId)async{
  DocumentSnapshot variable = await Firestore.instance.collection('users').document(userId).get();
  if(variable.data['role']=='menager'){
    return true;
  }
  else{
    return false;
  }
}

Future<bool> GetuserBan(String mail)async{

  mail=mail.toLowerCase();
  final QuerySnapshot result = await Firestore.instance
      .collection('banUsers')
      .where('email', isEqualTo: mail)
      .limit(1)
      .getDocuments();
  final List<DocumentSnapshot> documents = result.documents;
  if(documents.length == 1)
    return true;
  else
    return false;
}
Future<String> mailMenager(String email)async{
  final QuerySnapshot result = await Firestore.instance
      .collection('manegar')
      .where('email', isEqualTo: email)
      .limit(1)
      .getDocuments();
  final List<DocumentSnapshot> documents = result.documents;
  if(documents.length == 1)
    return documents[0].documentID;
  else
    return "not exist";
}
Future<String> GetuserBanID(String email)async{
  email=email.toLowerCase();
  final QuerySnapshot result = await Firestore.instance
      .collection('banUsers')
      .where('email', isEqualTo: email)
      .limit(1)
      .getDocuments();
  final List<DocumentSnapshot> documents = result.documents;
  if(documents.length == 1)
    return documents[0].documentID;
  else
    return "not exist";
}

Future<String> GetAbout()async{
  DocumentSnapshot variable = await Firestore.instance.collection('about').document('sYFhYhmjY5zyzL3Rowcg').get();
  return variable['text'].toString();
}
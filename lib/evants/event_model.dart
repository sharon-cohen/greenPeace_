import 'package:firebase_helpers/firebase_helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class EventModel extends DatabaseItem{
  final String id;
  final String title;
  final String description;
     DateTime eventDate;
  final DateTime createDateEvent;
  final DateTime time;
  final String sender;
  final String senderId;
  final String location;
  final String type_event;
  final String whatapp;
  final double lat;
  final double long;
  bool approve;
  EventModel({this.id,this.title, this.description, this.eventDate,this.approve,this.time,
    this.senderId,this.sender,this.location,this.type_event,this.whatapp,this.createDateEvent,this.lat,this.long
  }):super(id);

  factory EventModel.fromMap(Map data) {
    return EventModel(

      title: data['title'],
      description: data['description'],
      eventDate: data['event_date'].toDate(),
      approve: data['approve'],
      time:data['time'],
      sender: data['sender'],
      senderId: data['senderId'],
      location: data['location'],
      type_event: data['type_event'],
      whatapp: data['whatapp'],
      lat: data['lat'],
      long :data['long']
    );
  }

  factory EventModel.fromDS(String id, Map<String,dynamic> data) {
    return EventModel(
      id: id,
      title: data['title'],
      description: data['description'],
      eventDate: data['event_date'].toDate(),
      approve: data['approve'],
      time:data['time'].toDate(),
      sender: data['sender'],
      senderId: data['senderId'],
      location: data['location'],
      type_event: data['type_event'],
      whatapp: data['whatapp'],
        lat: data['lat'],
        long :data['long']
    );
  }

  Map<String,dynamic> toMap() {


    return {
      "title":title,
      "description": description,
      "event_date":eventDate,
      "id":id,
      "approve":approve,
        "time":time,
      "sender":sender,
      "senderId":senderId,
      "type_event":type_event,
      "location":location,
      "whatapp": whatapp,
      "lat" :lat,
      "long":long
    };
  }
}


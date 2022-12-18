import 'package:connect_with/resources/firestore_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryMeetingScreen extends StatefulWidget {
  const HistoryMeetingScreen({Key? key}) : super(key: key);

  @override
  _HistoryMeetingScreenState createState() => _HistoryMeetingScreenState();
}

class _HistoryMeetingScreenState extends State<HistoryMeetingScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseMethods().meetingHistorys,
        builder: (context, AsyncSnapshot snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) => ListTile(
              title: Text('Room Name : ${snapshot.data.docs[index]['meetingName']}'),
              subtitle: Text('Joined at : ${snapshot.data.docs[index]['createdAt']}') ,
            )
        );

    });
  }
}

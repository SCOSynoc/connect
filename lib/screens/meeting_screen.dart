import 'dart:math';

import 'package:connect_with/resources/auth_methods.dart';
import 'package:connect_with/screens/video_call_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/jitsi_meet_methods.dart';
import '../widgets/home_meeting_button.dart';

class MeetingScreen extends StatefulWidget {
  const MeetingScreen({Key? key}) : super(key: key);

  @override
  _MeetingScreenState createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {

  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  final AuthMethods _authMethods = AuthMethods();

  createNewMeeting() async {

    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(roomName: roomName, isVideoMuted: true, isAudioMuted: true);

  }

  joinMeeting(BuildContext context) {
    Navigator.push(context,MaterialPageRoute(builder: (context) => VideoCallScreen()));
  }


  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
              onPressed: /*createNewMeeting*/ createNewMeeting,
              text: 'New Meeting',
              icon: Icons.videocam,
            ),
            HomeMeetingButton(
              onPressed: () => /*joinMeeting(context)*/ joinMeeting(context),
              text: 'Join Meeting',
              icon: Icons.add_box_rounded,
            ),
            HomeMeetingButton(
              onPressed: () {},
              text: 'Schedule',
              icon: Icons.calendar_today,
            ),
            HomeMeetingButton(
              onPressed: () {},
              text: 'Share Screen',
              icon: Icons.arrow_upward_rounded,
            ),
          ],
        ),
        const Expanded(
          child: Center(
            child: Text(
              'Create/Join Meetings with just a click!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

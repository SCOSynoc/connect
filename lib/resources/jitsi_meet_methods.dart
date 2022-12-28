import 'package:connect_with/resources/auth_methods.dart';
import 'package:connect_with/resources/firestore_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';

class JitsiMeetMethods {
   final AuthMethods _authMethods  = AuthMethods();
   final FirebaseMethods _firebaseMethods = FirebaseMethods();


   void createMeeting({
     required String roomName,
     required bool isAudioMuted,
     required bool isVideoMuted,
     String username = ""}
     ) async {
     try {
       FeatureFlag featureFlag = FeatureFlag();
       featureFlag.welcomePageEnabled = false;
       featureFlag.resolution = FeatureFlagVideoResolution.MD_RESOLUTION;
       String name;
       if (username.isEmpty) {
         name = _authMethods.user.email! ;
       } else {
         name = username;
       }
       var options = JitsiMeetingOptions(room: roomName)
         ..userDisplayName = name
         ..userEmail = _authMethods.user.email
         ..userAvatarURL = "https://someimageurl.com/image.jpg" // or .png
         ..audioOnly = true
         ..audioMuted = true
         ..videoMuted = true;

       _firebaseMethods.addToMeetingHistory(roomName);
       await JitsiMeet.joinMeeting(options);

     }catch (error) {
       debugPrint("error: $error");
     }

   }

}
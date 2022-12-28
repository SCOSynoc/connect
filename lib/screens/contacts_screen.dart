import 'dart:developer';

import 'package:connect_with/resources/view_contacts_methods.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {

  List<Contact>? _contacts;
  final ViewContactsMethods contactsMethods = ViewContactsMethods();
  bool _isLoading = false;
  bool? permissionFlag ;

  void getContacts() async{
    setState(() {
      _isLoading = true;
    });
    await contactsMethods.getUserContacts.then((value) {
      setState(() {
        _isLoading = false;
        _contacts = value;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPermissions();
  }


  getPermissions() async{
    await kHandlePermission(Permission.contacts).then((value){
      getContacts();
    });
  }

  Future<void> kHandlePermission(Permission permission) async{
    if (defaultTargetPlatform == TargetPlatform.android) {
      final status = await permission.request();
      if(status.isGranted){
        permissionFlag = true;
      }
      log(status.toString());
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _contacts != null ? ListView.builder(
          itemCount: _contacts!.length,
          itemBuilder: (context, index) {
            var data = _contacts![index];
        return InkWell(
          onTap: () async{
            await ContactsService.openExistingContact(data);
          },
          child: ListTile(
            title: Text("${data.displayName}"),
            subtitle: Text("${data.givenName}"),
          ),
        );
      }) :_isLoading ? const Center(
        child: CircularProgressIndicator(),
      ) :const Center(
        child: Text("Unable to load contacts"),
      )
    );
  }
}

import 'package:contacts_service/contacts_service.dart';


class ViewContactsMethods {

  Future<List<Contact>>  get getUserContacts => ContactsService.getContacts();



}
import 'package:contact_app/data/contact.dart';
import 'package:contact_app/ui/contact/contact_create_page.dart';
import 'package:contact_app/ui/contact_list_page/widgets/contact_tile.dart';
import 'package:contact_app/ui/model/contacts_model.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart' as faker;
import 'package:scoped_model/scoped_model.dart';

class ContactListPage extends StatefulWidget {
  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Contacts"),
        backgroundColor: Colors.blue,
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              print('search icon is clicked');
            },
          ),
          IconButton(
            icon:const Icon(Icons.more_vert),
            onPressed: () {
              // Another action
            },
          ),
        ],
        elevation: 4.0,
        toolbarHeight: 70.0,
      ),
      body: ScopedModelDescendant <ContactsModel>(
        // run when the notifyListeners() is called from the model
        builder: (context,child,model){
          return ListView.builder(
            itemCount: model.contacts.length,
            itemBuilder: (context, index) {
            return ContactTile(
              contactIndex: index,
            );
          });
        }
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_)=>ContactCreatePage())
        );
      },
        child : Icon (Icons.person_add),
      ),
    );
  }
}

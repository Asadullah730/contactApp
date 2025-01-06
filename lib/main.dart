import 'package:contact_app/ui/contact/contact_create_page.dart';
import 'package:contact_app/ui/contact_list_page/contact_list.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:contact_app/ui/model/contacts_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: new ContactsModel(),
      child: MaterialApp(
        title: 'Contact App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:ContactListPage(),
      ),
    );
  }
}




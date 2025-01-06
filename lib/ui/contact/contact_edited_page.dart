import 'package:contact_app/ui/contact/widget/contact_form.dart';
import 'package:flutter/material.dart';

import '../../data/contact.dart';

class ContactEditPage  extends StatelessWidget {
  final Contact editedContact;
  final int editedContactIndex;


  const ContactEditPage({
    Key ?key,
    required this.editedContact,
    required this.editedContactIndex
}): super(key :key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Contact',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: ContactForm(editedContact: editedContact,editedContactIndex: editedContactIndex,),
    );
  }
}

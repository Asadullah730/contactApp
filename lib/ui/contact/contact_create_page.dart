import 'package:contact_app/ui/contact/widget/contact_form.dart';
import 'package:flutter/material.dart';
class ContactCreatePage extends StatelessWidget {
  const ContactCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : const Text("Add Contact",
          style: TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.lightBlue,
      ),

      body: ContactForm(),


    );

  }
}

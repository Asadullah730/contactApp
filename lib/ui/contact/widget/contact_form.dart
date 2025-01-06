import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../../data/contact.dart';
import '../../model/contacts_model.dart';
class ContactForm extends StatefulWidget {

  final Contact ?editedContact;
  final int editedContactIndex ;
  const ContactForm({
    super.key,
    this.editedContact,
    this.editedContactIndex = -1,
  });
  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {

  final _formKey =  GlobalKey<FormState>();
  String ?_name;
  String ?_phoneNumber;
  String ?_email;

  // checking whether it is in edit mode or not , use in updateContactMethod
  bool get isEditMode => widget.editedContact != null;

  @override
  Widget build(BuildContext context) {
    return Form(key :_formKey ,child: ListView(
      children:<Widget>[
        //  Name Input Field
        const SizedBox(height: 40),
        TextFormField(
          onSaved: (value) =>  _name =value,
          validator: _validateName,
          initialValue: widget.editedContact?.name,
          decoration : InputDecoration(
            labelText: "Name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),

        // Phone Number Input Field
        const SizedBox(height: 40),
        TextFormField(
          onSaved:  (value)=>  _phoneNumber = value,
          validator: _validatePhoneNumber,
          initialValue: widget.editedContact?.number,
          decoration : InputDecoration(
            labelText: "Contact Number",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),

        //  Email Input Field
        const SizedBox(height: 40),
        TextFormField(
          onSaved:  (value)=>  _email = value,
          validator: _validateEmail,
          decoration : InputDecoration(
            labelText: "email",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        const SizedBox(height: 40),
        OutlinedButton(onPressed: onSavedContactButtonPressed,
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.lightBlue,
            side: BorderSide(color: Theme.of(context).primaryColor)

          ),
            child:const Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Save Contact",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.person,
                  size: 20,
                  color: Colors.white,
                ),
            ],
        ),
        )
      ],
    ));
  }
  String? _validateName (String? value){
    if (value == null  || value.isEmpty) {
      return "Enter the Name";
    }
    else {
      return null;
    }
  }

  String? _validateEmail (String? value){
    final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    if (value == null ||value.isEmpty){
      return "Enter the email";
    }
    else if (!emailRegex.hasMatch(value)){
      return 'Enter valid email Address';
    }
    else {
      return null ;
    }
  }
  
  
  String?  _validatePhoneNumber (String? value){
    final phoneRegex =  RegExp(r"^\+?(\d{1,3})?[-.\s]?(\(?\d{1,4}\)?)?[-.\s]?\d{1,4}[-.\s]?\d{1,4}[-.\s]?\d{1,9}$");
    if (value == null || value.isEmpty){
      return "Enter the Phone Number";
    }
    else if (!phoneRegex.hasMatch(value)){
      return 'Enter the valid phoneNumber';
    }
    else {
      return null;
    }
  }


  void onSavedContactButtonPressed (){
    if (_formKey.currentState!.validate()){
      _formKey.currentState!.save();

      final newOrEditedContact =  Contact (
        name :_name,
        number :_phoneNumber,
        is_favorite: widget.editedContact?.is_favorite?? false ,
      );
      if (isEditMode){
        ScopedModel.of<ContactsModel>(context).updateContact(newOrEditedContact,widget.editedContactIndex);
      }
      else{
        ScopedModel.of<ContactsModel>(context).addContact(newOrEditedContact);
      }
      Navigator.of(context).pop();
    }
  }
}



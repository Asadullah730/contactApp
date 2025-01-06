import 'package:contact_app/ui/contact/contact_edited_page.dart';
import 'package:contact_app/ui/model/contacts_model.dart';
import 'package:flutter/material.dart';
import 'package:contact_app/data/contact.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ContactTile extends StatelessWidget {
  final int contactIndex;
  const ContactTile({
    super.key,
    required this.contactIndex,
  });

  @override
  Widget build(BuildContext context) {
    final model = ScopedModel.of<ContactsModel>(context);
    final displayedContact = model.contacts[contactIndex];
    return Slidable(
      endActionPane: ActionPane(
          motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              // Add the delete functionality here
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'delete',
          ),
        ],),
      child: ListTile(
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                model.changeFavoriteStatus(contactIndex);
              },
              icon: Icon(
                model.contacts[contactIndex].is_favorite
                    ? Icons.star
                    : Icons.star_border,
                color: model.contacts[contactIndex].is_favorite
                    ? Colors.amber
                    : Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () {
                print("Clicked On Star");
              },
              icon: const Icon(Icons.call),
            ),
          ],
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (_) => ContactEditPage(
                    editedContact: displayedContact,
                    editedContactIndex: contactIndex)),
          );
        },
        title: Text(model.contacts[contactIndex].name.toString()),
        subtitle: Text(model.contacts[contactIndex].number.toString()),
      ),
    );
  }
}

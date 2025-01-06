import 'package:faker/faker.dart' as faker;
import 'package:scoped_model/scoped_model.dart';
import '../../data/contact.dart';

class ContactsModel extends Model {
  final List<Contact> _contacts =  List.generate(10, (index) {
    return Contact(
      name: '${faker.faker.person.firstName()} ${faker.faker.person.lastName()}',
      number: '0${faker.faker.randomGenerator.integer(350, min: 300)} ${faker.faker.randomGenerator
              .integer(9999999, min: 1000000)}',
    );
  });

  // get only property, make sure that we cannot overwrite contacts from different classes
  List <Contact> get contacts =>_contacts;

  void changeFavoriteStatus (int index){
    _contacts[index].is_favorite= !_contacts[index].is_favorite;
    _sortContacts();
    notifyListeners();
  }

  void _sortContacts() {
    _contacts.sort((a, b) {
      int comparisonResults ;
      comparisonResults = compareBasedOnFavoriteStatus(a, b);

      if (comparisonResults == 0){
        comparisonResults = _compareAlphabetically(a, b);
      }
      return comparisonResults;
    });
  }

  int compareBasedOnFavoriteStatus(Contact a, Contact b) {
     if (a.is_favorite) {
      return -1;
    } else if (b.is_favorite) {
      return 1;
    } else {
      return 0;
    }
  }

  int _compareAlphabetically (Contact a, Contact b){
    return a.name!.compareTo(b.name!);
  }

  void addContact(Contact contact){
    print ("No.of Contact Before Adding new One ${_contacts.length}");
    _contacts.add(contact);
    print ("No.of Contact After Adding new One ${_contacts.length}");
    notifyListeners();
  }


  void updateContact (Contact contact, int contactIndex){
    _contacts[contactIndex] = contact;
    notifyListeners();
  }
}
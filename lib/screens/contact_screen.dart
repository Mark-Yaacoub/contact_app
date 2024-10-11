import 'package:flutter/material.dart';
import '../widgets/contact_list.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List<Map<String, String>> contacts = [];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

void addContact() {
  if (nameController.text.isEmpty || phoneController.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Please enter a name and phone number.')),
    );
  }
  else if (contacts.length >= 3) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('You cannot add more than 3 contacts.')),
    );
  }
  // إذا كانت جميع الشروط صحيحة، إضافة جهة الاتصال
  else {
    setState(() {
      contacts.add({
        'name': nameController.text,
        'phone': phoneController.text,
      });
      nameController.clear();
      phoneController.clear();
    });
  }
}


  void deleteContact() {
    if (contacts.isNotEmpty) {
      setState(() {
        contacts.removeLast();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Enter Your Name here'),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Enter Your Phone Number here'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: addContact,
                  child: Text('Add'),
                ),
                ElevatedButton(
                  onPressed: deleteContact,
                  child: Text('Delete'),
                ),
              ],
            ),
            SizedBox(height: 20),
            ContactList(contacts: contacts),
          ],
        ),
      ),
    );
  }
}

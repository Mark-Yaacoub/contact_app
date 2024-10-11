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
  final _formKey = GlobalKey<FormState>();

  void addContact() {
    if (_formKey.currentState!.validate()) {
      if (contacts.length >= 3) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('You cannot add more than 3 contacts.')),
        );
      } else {
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
  }

  void deleteContact(int index) {
    setState(() {
      contacts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Enter Your Name here',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'Enter Your Phone Number here',
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid phone number';
                  } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Please enter only numbers';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: addContact,
                child: Text('Add Contact'),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ContactList(
                  contacts: contacts,
                  onDelete: deleteContact, 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

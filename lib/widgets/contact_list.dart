import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  final List<Map<String, String>> contacts;
  final Function(int) onDelete;

  ContactList({required this.contacts, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(contacts[index]['name'] ?? ''),
          subtitle: Text(contacts[index]['phone'] ?? ''),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => onDelete(index), 
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  final List<Map<String, String>> contacts;

  ContactList({required this.contacts});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: contacts.isNotEmpty,
      child: Column(
        children: contacts.map((contact) {
          return ListTile(
            title: Text(contact['name'] ?? ''),
            subtitle: Text(contact['phone'] ?? ''),
          );
        }).toList(),
      ),
    );
  }
}

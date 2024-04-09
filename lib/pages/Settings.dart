import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});
  static const List<Map<String, String>> settings = [
    {'title': 'Preferences', 'link': '/preferences'},
    {'title': 'Notifications', 'link': '/notifications'},
    {'title': 'Profile', 'link': '/profile'},
    {'title': 'About', 'link': '/about'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 4, 141, 151),
      ),
      body: ListView.builder(
        itemCount: settings.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            title: Text(settings[index]['title']!),
            onTap: () {
              Navigator.of(context).pushNamed('/profile');
            },
            trailing: const Icon(Icons.arrow_forward_ios),
          );
        }
      )
    );
  }
}
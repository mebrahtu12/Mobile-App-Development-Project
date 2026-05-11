import 'package:first_version_flutter_pro/Screens/edr/ehome.dart';
import 'package:flutter/material.dart';

class Punishment extends StatefulWidget {
  const Punishment({super.key});

  @override
  State<Punishment> createState() => _PunishmentState();
}

class _PunishmentState extends State<Punishment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Text('PUNISMENT', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => EdrHomePage2()),
            );
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 30, color: Colors.green[300]),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Rounds extends StatefulWidget {
  final String? ekubType;
  const Rounds({super.key, this.ekubType});

  @override
  State<Rounds> createState() => _RoundsState();
}

class _RoundsState extends State<Rounds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Text('VIEW STATUS', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.maybePop(context);
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

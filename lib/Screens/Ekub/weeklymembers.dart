import 'package:flutter/material.dart';

class WeeklyMembers extends StatefulWidget {
  const WeeklyMembers({super.key});

  @override
  State<WeeklyMembers> createState() => _WeeklyMembersState();
}

class _WeeklyMembersState extends State<WeeklyMembers> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("weeklymem")));
  }
}

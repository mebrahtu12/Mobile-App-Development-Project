import 'package:flutter/material.dart';

class MonthlyMembers extends StatefulWidget {
  const MonthlyMembers({super.key});

  @override
  State<MonthlyMembers> createState() => _MonthlyMembersState();
}

class _MonthlyMembersState extends State<MonthlyMembers> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("monthlymem")));
  }
}

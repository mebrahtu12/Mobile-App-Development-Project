import 'package:first_version_flutter_pro/Screens/loginpage.dart';

import 'round.dart';
import 'winner_page.dart';
import 'viewstatus.dart';
import 'package:flutter/material.dart';
//import 'ekub_dashbord.dart';
import 'paymentt.dart';
import '../admin/a_ekub_dashbord.dart';

class Weekly extends StatelessWidget {
  const Weekly({super.key});

  Widget buildCard(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.green.shade100,
              child: Icon(icon, color: Colors.green, size: 28),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Text('Weekly', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EkubLoginPage()),
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

      body: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade100, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: Column(
          children: [
            SizedBox(height: 10),

            // 🧾 TITLE
            Text(
              "Weekly Ekub Options",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),
            buildCard(context, "Pay Now", Icons.attach_money, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => PaymentPage()),
              );
            }),

            buildCard(context, "View Status", Icons.info, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ViewStatus()),
              );
            }),

            buildCard(context, "Round", Icons.autorenew, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => Rounds()),
              );
            }),

            buildCard(context, "Winners List", Icons.emoji_events, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => WinnersPage()),
              );
            }),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WinnersPage extends StatelessWidget {
  final String? ekubType;
  const WinnersPage({super.key, this.ekubType});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Winners"),
        backgroundColor: Colors.green[300],
        leading: IconButton(
          onPressed: () {
            Navigator.maybePop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('winners')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("No winners yet"));
          }

          final winners = snapshot.data!.docs;

          return ListView.builder(
            itemCount: winners.length,
            itemBuilder: (context, index) {
              var winner = winners[index];

              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  leading: Icon(Icons.emoji_events, color: Colors.amber),
                  title: Text(
                    winner['username'],
                    style: TextStyle(color: Colors.green),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(winner['email'])],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'ekub_dashbord.dart';

// class Winners extends StatefulWidget {
//   const Winners({super.key});

//   @override
//   State<Winners> createState() => _WinnersState();
// }

// class _WinnersState extends State<Winners> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green[300],
//         title: Text('WINNERS', style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => EkubDashbordPage()),
//             );
//           },
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 10.0),
//             child: CircleAvatar(
//               backgroundColor: Colors.white,
//               child: Icon(Icons.person, size: 30, color: Colors.green[300]),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

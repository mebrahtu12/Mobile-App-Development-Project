import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'daily.dart';

class DailyMembers extends StatefulWidget {
  const DailyMembers({super.key});
  @override
  DailyMembersState createState() => DailyMembersState();
}

class DailyMembersState extends State<DailyMembers> {
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Members"),
        centerTitle: true,
        backgroundColor: Colors.green[300],
        foregroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Daily()),
            );
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          // Search Field
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search members...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
            ),
          ),

          // Members List
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Daily')
                  .orderBy('username')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData) {
                  return Center(child: Text("No members found"));
                }

                final members = snapshot.data!.docs;

                //  Filter list
                final filteredMembers = members.where((doc) {
                  String name = doc['username'].toString().toLowerCase();
                  return name.contains(searchQuery);
                }).toList();

                return ListView.builder(
                  itemCount: filteredMembers.length,
                  itemBuilder: (context, index) {
                    var member = filteredMembers[index];

                    return ListTile(
                      leading: Icon(Icons.person),
                      title: Text(member['username']),

                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          isScrollControlled: true,
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // 🔹 Top indicator (nice UI touch)
                                  Container(
                                    width: 40,
                                    height: 5,
                                    margin: EdgeInsets.only(bottom: 15),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.green[300],
                                    child: Icon(
                                      Icons.person,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 10),

                                  // 👤 Username
                                  Text(
                                    member['username'],
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  SizedBox(height: 15),

                                  //  Email
                                  Row(
                                    children: [
                                      Icon(Icons.email, color: Colors.green),
                                      SizedBox(width: 10),
                                      Expanded(child: Text(member['email'])),
                                    ],
                                  ),

                                  SizedBox(height: 10),

                                  //  Phone
                                  Row(
                                    children: [
                                      Icon(Icons.phone, color: Colors.green),
                                      SizedBox(width: 10),
                                      Expanded(child: Text(member['phone'])),
                                    ],
                                  ),

                                  SizedBox(height: 20),

                                  // Close button
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green[300],
                                      ),
                                      onPressed: () => Navigator.pop(context),
                                      child: Text(
                                        "Close",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },

                      // CLICK EVENT
                      // onTap: () {
                      //   showDialog(
                      //     context: context,
                      //     builder: (context) {
                      //       return AlertDialog(
                      //         title: Text(member['username']),
                      //         content: Column(
                      //           mainAxisSize: MainAxisSize.min,
                      //           children: [
                      //             Text("Email: ${member['email']}"),
                      //             Text("Phone: ${member['phone']}"),
                      //           ],
                      //         ),
                      //         actions: [
                      //           TextButton(
                      //             onPressed: () => Navigator.pop(context),
                      //             child: Text("Close"),
                      //           ),
                      //         ],
                      //       );
                      //     },
                      //   );
                      // },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

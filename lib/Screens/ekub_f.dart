import 'package:flutter/material.dart';

class FirstEkub extends StatefulWidget {
  const FirstEkub({super.key});

  @override
  State<FirstEkub> createState() => _FirstEkubState();
}

class _FirstEkubState extends State<FirstEkub> {
  List<String> ekubTime = [
    "Daily",
    "Weekly",
    "Monthly",
    "3 month",
    "6 month",
    "Yearly",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("ekubNET")),
        leading: Icon(Icons.navigate_before, size: 30),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 30, color: Colors.black),
          ),
          Icon(Icons.more_vert, size: 30),
        ],
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: Center(
              child: Center(
                child: Text(
                  "Time Catagory",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),

              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.purple[500],
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(colors: [Colors.blue, Colors.green]),
                ),
                child: Center(
                  child: Text(
                    ekubTime[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green[700],
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.white),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance, color: Colors.white),
            label: "Acount",
          ),
        ],
      ),
    );
  }
}

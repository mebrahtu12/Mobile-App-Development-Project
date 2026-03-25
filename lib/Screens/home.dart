import 'package:flutter/material.dart';
import 'payWith.dart';
import 'ekub_home.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Degital Ekub and Edr',
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu, size: 30),
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
              height: 500,
              width: double.infinity,
              child: Image.asset(
                "assets/img/HomeLogo.jpg",
                fit: BoxFit.cover,
                color: Colors.white,
                colorBlendMode: BlendMode.multiply,
              ),
            ),
            SizedBox(
              height: 50,
              child: Center(
                child: Center(
                  child: Text(
                    "Build Your Future",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Builder(
              builder: (context) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Ekub()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(20),
                    height: 80,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.green[400],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "ekubNET",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                );
              },
            ),

            Builder(
              builder: (context) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PayWith()),
                    );
                  },
                  child: Container(
                    height: 80,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.green[400],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "D-EDR",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'ekub_f.dart';
import 'registration.dart';

class Ekub extends StatefulWidget {
  const Ekub({super.key});

  @override
  State<Ekub> createState() => _EkubState();
}

class _EkubState extends State<Ekub> {
  void showLoginPopup(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 198, 197, 197),
          title: Center(child: Text("Join Ekub")),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: usernameController,
                decoration: InputDecoration(labelText: "Username"),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[400],
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[400],
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FirstEkub()),
                );
              },
              child: Text("Login"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 500,
            width: double.infinity,
            child: Image.asset(
              "assets/img/EkubLogo.jpg",
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
                  showLoginPopup(context);
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
                      "Join as Member",
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
                    MaterialPageRoute(builder: (context) => RegisterPage()),
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
                      "Create New",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

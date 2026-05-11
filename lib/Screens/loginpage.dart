import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'registrationpage.dart';
import 'Ekub/daily.dart';
import 'Ekub/weekly.dart';
import 'Ekub/monthly.dart';
import 'ekub_reset_password.dart';
import 'admin/a_ekub_dashbord.dart';
import 'a_home.dart';

class EkubLoginPage extends StatefulWidget {
  final String? ekubType;
  const EkubLoginPage({super.key, this.ekubType});

  @override
  State<EkubLoginPage> createState() => _EkubLoginPageState();
}

class _EkubLoginPageState extends State<EkubLoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void showPasswordDialog(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Enter Password"),
          content: TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Enter your password",
              prefixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                String enteredPassword = passwordController.text;

                if (enteredPassword == "123a") {
                  Navigator.pop(context); // close dialog

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EkubDashbordPage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Wrong password"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  Future<void> loginUser() async {
    try {
      String username = usernameController.text.trim();
      String password = passwordController.text.trim();
      String? ekubType = widget.ekubType ?? '';

      if (ekubType.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Ekub type is not specified"),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // Find email using username from Firestore
      var result = await FirebaseFirestore.instance
          .collection(ekubType)
          .where('username', isEqualTo: username)
          .get();

      if (result.docs.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Username not found"),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      String email = result.docs.first['email'];

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Map<String, Widget> pages = {
        "Daily": Daily(),
        "Weekly": Weekly(),
        "Monthly": Monthly(),
      };
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => pages[widget.ekubType]!),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login failed"), backgroundColor: Colors.red),
      );
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: const Text('ekubNet', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePagee()),
            );
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () {
              showPasswordDialog(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Text(
                "Admin",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// Logo
                const Icon(
                  Icons.lock,
                  size: 90,
                  color: Color.fromARGB(255, 121, 194, 125),
                ),

                const SizedBox(height: 20),

                /// Title
                const Text(
                  "Ekub Login",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                Text(
                  "Login to your account",
                  style: TextStyle(color: Colors.grey[700]),
                ),

                const SizedBox(height: 30),

                /// Username
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: "Username",
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// Password
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                /// Login Button
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[300],
                    ),
                    onPressed: () {
                      if (usernameController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Username and password must be filled",
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        loginUser();
                      }
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[300],
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EkubRegistrationPage(
                            ekubType: widget.ekubType ?? '',
                          ),
                        ),
                      );
                    },

                    child: const Text(
                      "Register",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                /// Forgot Password
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EkubResetPassword(),
                          ),
                        );
                      },
                      child: const Text(
                        "Forgot Password",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

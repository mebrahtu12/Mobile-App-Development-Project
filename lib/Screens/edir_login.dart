
import 'package:flutter/material.dart';
import 'package:minifinance/edir_dashbord.dart';
import 'package:minifinance/edir_page.dart';
import 'package:minifinance/edir_reset_password.dart';
import 'package:minifinance/ekub_dashbord.dart';
import 'package:minifinance/home.dart';
import 'package:minifinance/edir_registration_page.dart';

class EdirLoginPage extends StatefulWidget {
  const EdirLoginPage({super.key});

  @override
  State<EdirLoginPage> createState() => _EdirLoginPageState();
}

class _EdirLoginPageState extends State<EdirLoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
        title: const Text('D-Edir'),
        backgroundColor: Color(0xe4bcd987),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EdirPage()),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            icon: const Icon(Icons.close),
          )
        ],
      ),
      backgroundColor: Colors.blueGrey[50],
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
                  color: Colors.blueGrey,
                ),

                const SizedBox(height: 10),

                /// Title
                const Text(
                  "Edir Login",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  "Login to your account",
                  style: TextStyle(color: Colors.grey[700]),
                ),

                const SizedBox(height: 30),

                /// Username Field
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

                /// Password Field
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
                  height: 50,
                  child: ElevatedButton(
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EdirDashbordPage(),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),

                const SizedBox(height: 15),
                const SizedBox(height: 20),

/// Divider
Row(
  children: [
    Expanded(child: Divider()),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text("OR"),
    ),
    Expanded(child: Divider()),
  ],
),

const SizedBox(height: 20),

/// Google Login Button
SizedBox(
  width: double.infinity,
  height: 50,
  child: OutlinedButton.icon(
    onPressed: () {
      // TODO: Implement Google Sign-In
    },
    icon: Icon(Icons.g_mobiledata, size: 28),
    label: Text(
      "Continue with Google",
      style: TextStyle(fontSize: 16),
    ),
  ),
),

const SizedBox(height: 10),

/// Facebook Login Button (Optional)
SizedBox(
  width: double.infinity,
  height: 50,
  child: OutlinedButton.icon(
    onPressed: () {
      
    },
    icon: Icon(Icons.facebook, color: Colors.blue),
    label: Text(
      "Continue with Facebook",
      style: TextStyle(fontSize: 16),
    ),
  ),
),

                /// Forgot Password
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(" "),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EdirResetPassword(),
                          ),
                        );
                      },
                      child: const Text(
                        "Forgot Password",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
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

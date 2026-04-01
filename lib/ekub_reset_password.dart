import 'package:flutter/material.dart';
import 'package:minifinance/edir_login.dart';
import 'package:minifinance/ekub_confirm_password.dart';
import 'package:minifinance/home.dart';
import 'package:minifinance/login_page.dart';
import 'package:minifinance/main.dart';

class EkubResetPassword extends StatelessWidget {
  EkubResetPassword({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ekubNet"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              icon: Icon(Icons.home))
        ],
        backgroundColor: Color(0x8cb3c898),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.lock_reset,
              size: 80,
              color: Colors.blueGrey,
            ),

            const SizedBox(height: 20),

            const Text(
              "Forgot Password?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Enter your email to reset your password",
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            /// Email Field
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                prefixIcon: const Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 25),

            /// Send Reset Link Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: FilledButton(
                onPressed: () {
                  String email = emailController.text;

                  if (email.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Reset link sent successfully to $email",
                        ),
                        backgroundColor: Colors.green,
                      ),
                    );

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EkubConfirmPassword(),
                        ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please enter your email"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: const Text(
                  "Send Reset Link",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 15),

            /// Back to Login
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EdirLoginPage(),
                  ),
                );
              },
              child: const Text("Back to Login"),
            ),
          ],
        ),
      ),
    );
  }
}
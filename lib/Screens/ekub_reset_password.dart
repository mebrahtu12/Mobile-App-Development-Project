import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EkubResetPassword extends StatefulWidget {
  const EkubResetPassword({super.key});

  @override
  State<EkubResetPassword> createState() => _EkubResetPasswordState();
}

class _EkubResetPasswordState extends State<EkubResetPassword> {
  final TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ekubNet", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green[300],
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EkubLoginPage(ekubType: ''),
              ),
            );
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight:
                    MediaQuery.of(context).size.height -
                    MediaQuery.of(context).viewInsets.bottom,
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.lock_reset,
                            size: 80,
                            color: Color.fromARGB(255, 185, 77, 77),
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
                              style: FilledButton.styleFrom(
                                backgroundColor: Colors.green[300],
                              ),
                              onPressed: () async {
                                String email = emailController.text.trim();

                                if (email.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Please enter your email"),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                  return;
                                }
                                setState(() {
                                  isLoading = true;
                                });

                                try {
                                  // send firebase reset email
                                  await FirebaseAuth.instance
                                      .sendPasswordResetEmail(email: email);

                                  // success message
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "Password reset link sent to $email",
                                      ),
                                      backgroundColor: Colors.green,
                                    ),
                                  );

                                  // navigate
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          EkubLoginPage(ekubType: ''),
                                    ),
                                  );
                                } on FirebaseAuthException catch (e) {
                                  String message = "something went wrong";

                                  if (e.code == 'user-not-found') {
                                    message =
                                        "Password reset link sent (if the account exists)";
                                  }

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(message),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                } finally {
                                  setState(() {
                                    isLoading = false;
                                  });
                                }
                              },

                              child: isLoading
                                  ? const SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 3,
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Text(
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
                                  builder: (context) =>
                                      EkubLoginPage(ekubType: ''),
                                ),
                              );
                            },
                            child: const Text("Back to Login"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

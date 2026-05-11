import 'package:first_version_flutter_pro/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'edir_login.dart';

class resetPassword extends StatefulWidget {
  const resetPassword({super.key});

  @override
  State<resetPassword> createState() => _EkubResetPasswordState();
}

class _EkubResetPasswordState extends State<resetPassword> {
  final TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("D-edr", style: TextStyle(color: Colors.white)),
        flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EdirLoginPage()),
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
                                      builder: (context) => EdirLoginPage(),
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
                                      backgroundColor: Colors.black,
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
                                  builder: (context) => EdirLoginPage(),
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

// import 'package:flutter/material.dart';
// import 'edr_comfir_password.dart';
// import 'edrlogin.dart';

// class EkubResetPassword extends StatelessWidget {
//   EkubResetPassword({super.key});

//   final TextEditingController emailController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("ekubNet", style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.green[300],
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => EdrLoginPage()),
//             );
//           },
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(25),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Icon(
//               Icons.lock_reset,
//               size: 80,
//               color: Color.fromARGB(255, 185, 77, 77),
//             ),

//             const SizedBox(height: 20),

//             const Text(
//               "Forgot Password?",
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),

//             const SizedBox(height: 10),

//             const Text(
//               "Enter your email to reset your password",
//               textAlign: TextAlign.center,
//             ),

//             const SizedBox(height: 30),

//             /// Email Field
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(
//                 labelText: "Email",
//                 prefixIcon: const Icon(Icons.email),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 25),

//             /// Send Reset Link Button
//             SizedBox(
//               width: double.infinity,
//               height: 50,
//               child: FilledButton(
//                 style: FilledButton.styleFrom(
//                   backgroundColor: Colors.green[300],
//                 ),
//                 onPressed: () {
//                   String email = emailController.text;

//                   if (email.isNotEmpty) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text("Reset link sent successfully to $email"),
//                         backgroundColor: Colors.green,
//                       ),
//                     );

//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => EdrConfirmPassword(),
//                       ),
//                     );
//                   } else {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         content: Text("Please enter your email"),
//                         backgroundColor: Colors.red,
//                       ),
//                     );
//                   }
//                 },
//                 child: const Text(
//                   "Send Reset Link",
//                   style: TextStyle(fontSize: 18),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 15),

//             /// Back to Login
//             TextButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => EdrLoginPage()),
//                 );
//               },
//               child: const Text("Back to Login"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

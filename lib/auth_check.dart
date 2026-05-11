// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import 'Screens/Ekub/daily.dart';
// import 'Screens/Ekub/ekub_login.dart';

// class AuthCheck extends StatelessWidget {
//   const AuthCheck({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Scaffold(
//             body: Center(child: CircularProgressIndicator()),
//           );
//         }

//         if (snapshot.hasData) {
//           return const Daily(); // user already logged in
//         } else {
//           return const EkubLoginPage((ekubType: widget.ekubType); // not logged in
//         }
//       },
//     );
//   }
// }

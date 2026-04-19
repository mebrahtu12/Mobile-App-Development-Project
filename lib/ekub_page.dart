import 'package:flutter/material.dart';
import 'package:minifinance/ekub_dashbord.dart';
import 'package:minifinance/ekub_login.dart';
import 'package:minifinance/home.dart';

import 'package:minifinance/ekub_registration_page.dart';

class EkubPage extends StatelessWidget {
  const EkubPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ));
            },
            icon: Icon(Icons.arrow_back)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ));
              },
              icon: Icon(Icons.close))
        ],
        title: Text('ekubNet'),
        backgroundColor: Color(0x8cb3c898),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                'data:image/jpeg;base64,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',
              ),
            ),
            Text(
              'Save Today,Secure Tommorrow!',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                ),
                OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EkubLoginPage(),
                          ));
                    },
                    child: Text('login')),
                SizedBox(
                  width: 30,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EkubRegistrationPage(),
                          ));
                    },
                    child: Text(
                      'Create Account',
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EkubDashbordPage(),
                          ));
                    },
                    child: Text("login as Admin"))
              ],
            )
          ],
        ),
      ),
    );
  }
}

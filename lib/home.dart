import 'package:flutter/material.dart';
import 'package:minifinance/edirpage.dart';
import 'package:minifinance/ekubpage.dart';
import 'package:minifinance/main.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home  Page'),
        centerTitle: true,
        backgroundColor: Color(0x1fb50a0a),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAvNor4IFJvaXjoq-j6W0MTZ49LRiGhkeSOw&s'),
            Text(
              'Digital Future',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EkubPage(),
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.deepOrangeAccent),
                    child: Text('Join Ekub')),
                SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EdirPage(),
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.deepOrangeAccent),
                    child: Text('Join Edir'))
              ],
            )
          ],
        ),
      ),
    );
  }
}

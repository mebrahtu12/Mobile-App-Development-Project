import '../loginpage.dart';
import 'package:flutter/material.dart';

class PaymentMenthodPage extends StatefulWidget {
  const PaymentMenthodPage({super.key});

  @override
  State<PaymentMenthodPage> createState() => _PaymentMenthodPageState();
}

class _PaymentMenthodPageState extends State<PaymentMenthodPage> {
  List<String> myImages = [
    "assets/img/cbe.png",
    "assets/img/telebirr.png",
    "assets/img/dashen.png",
    "assets/img/awash.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Text('PAY WITH', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EkubLoginPage()),
            );
          },

          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 150),
          Expanded(
            child: GridView.builder(
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.all(20),
                child: ClipRect(
                  child: Image.asset(
                    myImages[index],
                    fit: BoxFit.cover,
                    color: Colors.white,
                    colorBlendMode: BlendMode.multiply,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green[700],
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.white),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance, color: Colors.white),
            label: "Acount",
          ),
        ],
      ),
    );
  }
}

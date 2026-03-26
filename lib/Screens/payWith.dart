import 'package:flutter/material.dart';

class PayWith extends StatefulWidget {
  const PayWith({super.key});

  @override
  State<PayWith> createState() => _PayWithState();
}

class _PayWithState extends State<PayWith> {
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
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Center(child: Text("Payment")),
        leading: Icon(Icons.navigate_before),
        actions: [Icon(Icons.menu)],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: Center(
              child: Center(
                child: Text(
                  "PAY WITH",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
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

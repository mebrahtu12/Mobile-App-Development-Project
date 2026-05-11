import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});
  @override
  PaymentPageState createState() => PaymentPageState();
}

class PaymentPageState extends State<PaymentPage> {
  int selectedIndex = -1;

  final List<Map<String, String>> banks = [
    {"name": "Commercial Bank of Ethiopia", "logo": "assets/img/cbe.png"},
    {"name": "telebirr", "logo": "assets/img/telebirr.png"},
    {"name": "Awash Bank", "logo": "assets/img/awash.png"},
    {"name": "Dashen Bank", "logo": "assets/img/dashen.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
        backgroundColor: Colors.green[300],
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Choose Payment Method",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 8),

            Text(
              "Select your preferred bank to continue payment securely.",
              style: TextStyle(color: Colors.grey[700]),
            ),

            SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: banks.length,
                itemBuilder: (context, index) {
                  final bank = banks[index];
                  final isSelected = selectedIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.only(bottom: 16),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.green.shade50 : Colors.white,
                        borderRadius: BorderRadius.circular(16),

                        // Border highlight
                        border: Border.all(
                          color: isSelected
                              ? Colors.green
                              : Colors.grey.shade300,
                          width: 2,
                        ),

                        // Shadow
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),

                      child: Row(
                        children: [
                          Image.asset(bank["logo"]!, width: 50, height: 50),

                          SizedBox(width: 16),

                          Expanded(
                            child: Text(
                              bank["name"]!,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),

                          // CHECK ICON
                          if (isSelected)
                            Icon(Icons.check_circle, color: Colors.green),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            //  BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedIndex != -1
                      ? Colors.green
                      : Colors.grey,
                  padding: EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: selectedIndex != -1
                    ? () {
                        final selectedBank = banks[selectedIndex]["name"];

                        // 👉 Navigate or process payment
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Proceeding with $selectedBank"),
                          ),
                        );
                      }
                    : null,
                child: Text(
                  "Continue Payment",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

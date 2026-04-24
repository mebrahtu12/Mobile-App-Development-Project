import 'package:flutter/material.dart';
import 'ekub_f.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final TextEditingController firstName = TextEditingController();
  final TextEditingController middleName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController region = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController nationalId = TextEditingController();
  bool isHidden = true;


  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void cancel() {
    Navigator.pop(context);
  }
  void confirmRegister() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Confirm"),
          content: const Text("Are you sure you want to register?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("No"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FirstEkub()),
                );
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ekubNET"),
        centerTitle: true,
        leading: const Icon(Icons.navigate_before),
        actions: const [
          Padding(padding: EdgeInsets.all(8.0), child: Icon(Icons.menu)),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Text(
              "REGISTER",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            buildTextField("First Name", firstName),
            buildTextField("Middle Name", middleName),
            buildTextField("Last Name", lastName),
            buildTextField("Email", email),
            buildTextField("Phone No", phone),
            buildTextField("Region", region),
            buildTextField("City", city),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "NATIONAL ID (FAN NO)",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 6),
                  TextField(
                    controller: nationalId,
                    obscureText: isHidden,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      suffixIcon: IconButton(
                        icon: Icon(
                          isHidden
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            isHidden = !isHidden;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: cancel,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    child: const Text("CANCEL"),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(

                    onPressed: confirmRegister,

                    child: const Text("REGISTER"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
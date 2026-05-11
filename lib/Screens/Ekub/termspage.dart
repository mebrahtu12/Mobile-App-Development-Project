import 'ekub_catagory.dart';
import 'package:flutter/material.dart';
import '../../localization/language_provider.dart';
import 'package:provider/provider.dart';
//import 'ekub_login.dart';

class TermsPage extends StatefulWidget {
  const TermsPage({super.key});

  @override
  TermsPageState createState() => TermsPageState();
}

class TermsPageState extends State<TermsPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final lang = Provider.of<LanguageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(lang.translate("terms & Agreement")),
        backgroundColor: Colors.green[300],
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // 📜 TERMS TEXT (SCROLLABLE)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Text(
                  lang.translate("term"),
                  style: TextStyle(fontSize: 15, height: 1.5),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Checkbox(
                  value: isChecked,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    lang.translate('I agree'),
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isChecked ? Colors.green : Colors.grey,
                  padding: EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: isChecked
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Catagory()),
                        );
                      }
                    : null,
                child: Text(
                  lang.translate('Continue'),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

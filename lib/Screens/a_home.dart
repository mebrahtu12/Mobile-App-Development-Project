import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Ekub/termspage.dart';
import 'edr/edir_login.dart';
import '../widgets/custom_app_bar.dart';
import '../theme/app_colors.dart';
import '../localization/language_provider.dart';

class HomePagee extends StatefulWidget {
  const HomePagee({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePagee> {
  Widget _buildFeatureCard(
    String titleKey,
    String subtitle,
    IconData icon,
    Widget next,
  ) {
    final lang = Provider.of<LanguageProvider>(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => next));
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: AppColors.softShadow,
          border: Border.all(
            color: AppColors.primaryLightGreen.withOpacity(0.5),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primaryLightGreen.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: AppColors.primaryGreen, size: 30),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lang.translate(titleKey),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.primaryGreen,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(titleKey: 'home', showBackButton: false),

      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildFeatureCard(
              "ekubNet",
              "Traditional saving made digital and secure.",
              Icons.account_balance_rounded,
              TermsPage(),
            ),
            _buildFeatureCard(
              "digital_edr",
              "Community support system at your fingertips.",
              Icons.groups_rounded,
              const EdirLoginPage(),
            ),
          ],
        ),
      ),
    );
  }
}

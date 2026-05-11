import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Ekub/winner_page.dart';
import '../Ekub/dailymembers.dart';
import '../Ekub/announcements.dart';
import '../Ekub/viewstatus.dart';
import '../Ekub/paymentt.dart';
import '../../widgets/custom_app_bar.dart';
import '../../theme/app_colors.dart';
import '../../localization/language_provider.dart';

class EdrDashbordPage extends StatelessWidget {
  const EdrDashbordPage({super.key});

  Widget _buildActionButton(
    BuildContext context,
    String titleKey,
    IconData icon,
    Widget next,
  ) {
    final lang = Provider.of<LanguageProvider>(context);
    return Expanded(
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => next),
        ),
        child: Container(
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: AppColors.softShadow,
            border: Border.all(
              color: AppColors.primaryLightGreen.withOpacity(0.5),
              width: 1,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primaryLightGreen.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: AppColors.primaryGreen, size: 28),
              ),
              const SizedBox(height: 10),
              Text(
                lang.translate(titleKey),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  //color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final lang = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: const CustomAppBar(titleKey: 'digital_edr'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(25),
                boxShadow: AppColors.softShadow,
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white24,
                    child: Icon(Icons.person, size: 40, color: Colors.white),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lang.translate('personal_info'),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "Addmin ID: #12345",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                _buildActionButton(
                  context,
                  'members',
                  Icons.people_alt_rounded,
                  DailyMembers(),
                ),
                const SizedBox(width: 16),
                _buildActionButton(
                  context,
                  'pay',
                  Icons.payment_rounded,
                  PaymentPage(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildActionButton(
                  context,
                  'view_status',
                  Icons.analytics_rounded,
                  ViewStatus(),
                ),
                const SizedBox(width: 16),
                _buildActionButton(
                  context,
                  'announcements',
                  Icons.campaign_rounded,
                  Announcements(),
                ),
              ],
            ),
            const SizedBox(height: 16),

            SizedBox(height: 15),
            Row(
              children: [
                _buildActionButton(
                  context,
                  'Punishment',
                  Icons.warning_rounded,
                  WinnersPage(),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20,
        backgroundColor: Colors.green[300],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_rounded),
            label: lang.translate("home"),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search_rounded),
            label: lang.translate("search"),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.account_balance_wallet_rounded),
            label: lang.translate("pay"),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_rounded),
            label: lang.translate("account"),
          ),
        ],
      ),
    );
  }
}

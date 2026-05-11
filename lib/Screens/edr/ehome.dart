import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Ekub/paymentt.dart';
import '../../widgets/custom_app_bar.dart';
import '../../theme/app_colors.dart';
import '../../localization/language_provider.dart';
import 'edr_member.dart';
import 'punishment.dart';
import 'detail.dart';

class EdrHomePage2 extends StatelessWidget {
  const EdrHomePage2({super.key});

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
      appBar: const CustomAppBar(titleKey: '', showBackButton: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 70),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(25),
                boxShadow: AppColors.softShadow,
              ),
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lang.translate('digital_edr'),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                _buildActionButton(
                  context,
                  'members',
                  Icons.people_alt_rounded,
                  Emembers(),
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
            SizedBox(height: 50),

            Row(
              children: [
                _buildActionButton(
                  context,
                  'punishment',
                  Icons.warning_rounded,
                  Punishment(),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                _buildActionButton(
                  context,
                  'show ditail',
                  Icons.info,
                  Detail(),
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

// import 'package:first_version_flutter_pro/Screens/loginpage.dart';
// import '';
// import 'package:flutter/material.dart';
// //import 'dassssssss.dart';
// import 'paymentt.dart';

// class Daily extends StatelessWidget {
//   const Daily({super.key});

//   Widget buildCard(
//     BuildContext context,
//     String title,
//     IconData icon,
//     VoidCallback onTap,
//   ) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         margin: EdgeInsets.symmetric(vertical: 10),
//         padding: EdgeInsets.all(18),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(18),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black12,
//               blurRadius: 10,
//               offset: Offset(0, 5),
//             ),
//           ],
//         ),
//         child: Row(
//           children: [
//             CircleAvatar(
//               radius: 25,
//               backgroundColor: Colors.green.shade100,
//               child: Icon(icon, color: Colors.green, size: 28),
//             ),
//             SizedBox(width: 16),
//             Expanded(
//               child: Text(
//                 title,
//                 style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
//               ),
//             ),
//             Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green[300],
//         title: Text('Daily', style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => EkubLoginPage()),
//             );
//           },
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//         ),
//         actions: [
//           IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
//           Padding(
//             padding: const EdgeInsets.only(right: 10.0),
//             child: CircleAvatar(
//               backgroundColor: Colors.white,
//               child: Icon(Icons.person, size: 30, color: Colors.green[300]),
//             ),
//           ),
//         ],
//       ),

//       body: Container(
//         padding: EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.green.shade100, Colors.white],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),

//         child: Column(
//           children: [
//             SizedBox(height: 10),

//             // 🧾 TITLE
//             Text(
//               "Daily Ekub Options",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),

//             SizedBox(height: 20),
//             buildCard(context, "Pay Now", Icons.attach_money, () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => PaymentPage()),
//               );
//             }),

//             buildCard(context, "Members", Icons.group, () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => Members()),
//               );
//             }),

//             buildCard(context, "Round", Icons.autorenew, () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => Rounds()),
//               );
//             }),

//             buildCard(context, "Winners List", Icons.emoji_events, () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => WinnersPage()),
//               );
//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/a_home.dart';
import 'theme/app_theme.dart';
import 'theme/app_colors.dart';
import 'localization/language_provider.dart';

class GetStartedApp extends StatelessWidget {
  const GetStartedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ekub and edr',
      theme: AppTheme.lightTheme,
      home: const GetStartedPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  void _onGetStarted(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePagee()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final lang = Provider.of<LanguageProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              AppColors.primaryLightGreen.withOpacity(0.3),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'logo',
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLightGreen.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.account_balance_wallet_rounded,
                      size: 100,
                      color: AppColors.primaryGreen,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  lang.translate('welcome'),
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 16),
                Text(
                  lang.translate('motto'),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 60),
                ElevatedButton(
                  onPressed: () => _onGetStarted(context),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(lang.translate('get_started')),
                      const SizedBox(width: 15),
                      const Icon(Icons.arrow_forward_rounded),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Language Toggle on Splash
                TextButton(
                  onPressed: () => lang.toggleLocale(),
                  child: Text(
                    lang.currentLocale == 'en'
                        ? 'Switch to አማርኛ'
                        : 'ወደ English ይቀይሩ',
                    style: const TextStyle(
                      color: AppColors.primaryGreen,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

// ========== THEME & STYLE CONSTANTS ==========
class AppColors {
  static const Color primary = Color(0xFF1E40AF);
  static const Color primaryLight = Color(0xFF3B5BD8);
  static const Color accent = Color(0xFF2563EB);
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFF3F4F6);
  static const Color textPrimary = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF6B7280);
}

class AppTextStyles {
  static const String fontFamily = 'Inter';

  static TextStyle headingLarge = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle headingMedium = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle body = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  static TextStyle button = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: AppTextStyles.fontFamily,
      textTheme: TextTheme(
        headlineLarge: AppTextStyles.headingLarge,
        headlineMedium: AppTextStyles.headingMedium,
        bodyMedium: AppTextStyles.body,
        labelLarge: AppTextStyles.button,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          textStyle: AppTextStyles.button,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.primary),
          textStyle: AppTextStyles.button.copyWith(color: AppColors.primary),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        ),
      ),
    );
  }
}

// ========== MAIN APP ==========
void main() {
  runApp(const SDMTrustApp());
}

class SDMTrustApp extends StatelessWidget {
  const SDMTrustApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SDM Trust Services',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: const HomePage(),
    );
  }
}

// ========== HOME PAGE ==========
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 700;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ========== HERO SECTION ==========
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: isMobile ? 40 : 80, horizontal: 20),
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/hero_bg.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black54, BlendMode.darken),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Trusted Partner for\nYour Financial Security',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.headingLarge.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Your trusted partner in Insurance and Loan solutions.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                  const SizedBox(height: 30),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 15,
                    runSpacing: 10,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: AppColors.primary,
                        ),
                        child: const Text('Explore Insurance'),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.white),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Check Loans'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        // add text to icon button
                        tooltip: 'WhatsApp',
                        icon: const Icon(Icons.chat, color: Colors.white),
                        onPressed: () {
                          // Link to WhatsApp
                        },
                      ),
                      IconButton(
                        tooltip: 'YouTube',
                        icon: const Icon(Icons.youtube_searched_for,
                            color: Colors.white),
                        onPressed: () {
                          // Link to YouTube
                        },
                      ),
                      IconButton(
                        tooltip: 'Facebook',
                        icon:
                            const Icon(Icons.facebook, color: Colors.white),
                        onPressed: () {
                          // Link to Facebook
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ========== INSURANCE SECTION ==========
            const SectionTitle(title: "Insurance Plans"),
            ResponsiveGrid(
              items: [
                ServiceCard(
                    title: 'Motor Insurance',
                    description:
                        'Protect your vehicle from accidents, theft, or natural calamities.',
                    imagePath: 'assets/motor.jpg'),
                ServiceCard(
                    title: 'Health Insurance',
                    description:
                        'Cover medical expenses and secure your family’s well-being.',
                    imagePath: 'assets/health.jpg'),
                ServiceCard(
                    title: 'Life Insurance',
                    description:
                        'Secure your loved ones’ future with the right life cover.',
                    imagePath: 'assets/life.jpg'),
                ServiceCard(
                    title: 'Travel Insurance',
                    description:
                        'Travel worry-free with coverage for flight delays and emergencies.',
                    imagePath: 'assets/travel.jpg'),
              ],
            ),

            // ========== LOAN SECTION ==========
            const SectionTitle(title: "Loan Options"),
            ResponsiveGrid(
              items: [
                ServiceCard(
                    title: 'Personal Loan',
                    description:
                        'Quick and easy approval for personal needs – minimal documentation.',
                    imagePath: 'assets/personal_loan.jpg'),
                ServiceCard(
                    title: 'Home Loan',
                    description:
                        'Make your dream home a reality with competitive interest rates.',
                    imagePath: 'assets/home_loan.jpg'),
                ServiceCard(
                    title: 'Business Loan',
                    description:
                        'Expand your business with flexible working capital options.',
                    imagePath: 'assets/business_loan.jpg'),
                ServiceCard(
                    title: 'Loan Against Property',
                    description:
                        'Unlock the value of your property with secured financing.',
                    imagePath: 'assets/lap.jpg'),
              ],
            ),

            const SizedBox(height: 50),
            const ContactSection(),
          ],
        ),
      ),
    );
  }
}

// ========== COMPONENTS ==========

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Text(title, style: AppTextStyles.headingMedium),
    );
  }
}

class ResponsiveGrid extends StatelessWidget {
  final List<Widget> items;
  const ResponsiveGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    int crossAxisCount = 4;
    if (width < 1100) crossAxisCount = 2;
    if (width < 600) crossAxisCount = 1;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 1.3,
        children: items,
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const ServiceCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(imagePath,
                width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text(description, style: AppTextStyles.body),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;

    return Container(
      width: double.infinity,
      color: AppColors.surface,
      padding: const EdgeInsets.all(40.0),
      child: Column(
        children: [
          Text('Contact Us', style: AppTextStyles.headingMedium),
          const SizedBox(height: 20),
          Text(
            'Reach out to us for any queries or support.',
            style: AppTextStyles.body,
          ),
          const SizedBox(height: 30),
          Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: isMobile ? double.infinity : 300,
                child: const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Your Name',
                  ),
                ),
              ),
              const SizedBox(width: 20, height: 20),
              SizedBox(
                width: isMobile ? double.infinity : 300,
                child: const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email / Phone',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: isMobile ? double.infinity : 620,
            child: const TextField(
              maxLines: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Message',
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: AppColors.primary,
                        ),
            child: const Text('Submit'),
          )
        ],
      ),
    );
  }
}

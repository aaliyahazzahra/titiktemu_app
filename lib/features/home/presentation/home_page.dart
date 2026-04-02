import 'package:flutter/material.dart';
import 'package:titiktemu_app/core/constants/app_colors.dart';
import 'package:titiktemu_app/core/widgets/mood_selector.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedMoodIndex = 4; // Default to "Neutral"

  //Helper method for navigation placeholder
  void _navigateTo(String pageName) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Navigate to Journal Page'),
        backgroundColor: AppColors.softTeal,
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildHeader(),
            SizedBox(height: 24),
            _buildAffirmationCard(),
            SizedBox(height: 16),
            _buildCarouselIndicator(),
            SizedBox(height: 32),
            _buildQuickNavigation(),
            SizedBox(height: 40),

            //Reusable Mood Selector Widget
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: MoodSelector(
                initialMoodIndex: _selectedMoodIndex,
                onMoodSelected: (int selectedIndex) {
                  setState(() {
                    // Update selected mood index
                    _selectedMoodIndex = selectedIndex;
                  });
                },
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // --- 1. HEADER SECTION ---
  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.darkTeal, AppColors.softTeal],
        ),

        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: const Text(
            'Welcome back, Aaliyah',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }

  // --- 2. AFFIRMATION CARD SECTION ---
  Widget _buildAffirmationCard() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 220,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.softTeal, AppColors.darkTeal],
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.softShadow,
              blurRadius: 15,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Stack(
          children: [
            //plkaceholder for image
            Positioned(
              top: 20,
              left: 20,
              child: Icon(Icons.bedtime, color: Colors.white, size: 40),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "you are calm, \nsafe, and\ndeeply at peace.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: AppColors.darkText,
                    height: 1.3,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- 3. CAROUSEL INDICATOR SECTION ---
  Widget _buildCarouselIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDot(isActive: true),
        _buildDot(isActive: false),
        _buildDot(isActive: false),
        _buildDot(isActive: false, isSmall: true),
        _buildDot(isActive: false, isSmall: true),
      ],
    );
  }

  Widget _buildDot({required bool isActive, bool isSmall = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: isSmall ? 6 : 8,
      width: isSmall ? 6 : 8,
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.darkTeal
            : AppColors.textDisabled.withOpacity(0.5),
        shape: BoxShape.circle,
      ),
    );
  }

  // --- 4. QUICK NAVIGATION ---
  Widget _buildQuickNavigation() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Quick Navigation',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavButton(Icons.headphones, 'Sessions'),
              _buildNavButton(Icons.bedtime, 'Sleep'),
              _buildNavButton(Icons.spa, 'Relax'),
              _buildNavButton(Icons.menu_book, 'Learn'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton(IconData icon, String label) {
    return GestureDetector(
      onTap: () => _navigateTo(label),
      child: Container(
        width: 75,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.subtleBorder, width: 1),
          boxShadow: const [
            BoxShadow(
              color: AppColors.softShadow,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: AppColors.softTeal, size: 32),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

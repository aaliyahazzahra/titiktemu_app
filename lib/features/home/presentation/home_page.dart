import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:titiktemu_app/core/constants/app_affirmations.dart';
import 'package:titiktemu_app/core/constants/app_colors.dart';
import 'package:titiktemu_app/core/widgets/glass_container.dart';
import 'package:titiktemu_app/core/widgets/main_background.dart';
import 'package:titiktemu_app/core/widgets/mood_selector.dart';
import 'package:titiktemu_app/core/widgets/quick_action_button.dart';
import 'package:titiktemu_app/features/sessions/presentation/pages/session_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedMoodIndex = 4; // Default to "Neutral"

  // --- CAROUSEL STATE VARIABLES ---
  late PageController _pageController;
  int _currentAffirmationIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoPlay();
  }

  @override
  void dispose() {
    // IMPORTANT: Always cancel the timer and dispose of the controller to prevent memory leaks
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  // --- TIMER LOGIC FOR 5-SECOND SLIDESHOW ---
  void _startAutoPlay() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_pageController.hasClients) {
        int nextPage =
            (_currentAffirmationIndex + 1) % AppAffirmations.dailyList.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(
            milliseconds: 600,
          ), // Smooth transition speed
          curve: Curves.easeInOut,
        );
      }
    });
  }

  //Helper method for navigation placeholder
  // void _navigateTo(String pageName) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     const SnackBar(
  //       content: Text('Navigate to Journal Page'),
  //       backgroundColor: AppColors.softTeal,
  //       duration: Duration(seconds: 2),
  //       behavior: SnackBarBehavior.floating,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: MainBackground(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Spacer(),
                    Text(
                      'Titik Temu',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.softTeal,
                      ),
                    ),
                  ],
                ), // Placeholder for top row
                SizedBox(height: 20),
                _buildHeader(),
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: AlignmentGeometry.centerLeft,
                        child: Text(
                          'How do you feel today?',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      MoodSelector(
                        initialMoodIndex: _selectedMoodIndex,
                        onMoodSelected: (int selectedIndex) {
                          setState(() {
                            _selectedMoodIndex = selectedIndex;
                          });
                        },
                      ),
                      SizedBox(height: 16),
                      _buildQuickNavigation(),
                      SizedBox(height: 40),

                      _buildAffirmationCarousel(),
                      SizedBox(height: 16),
                      _buildCarouselIndicator(),
                    ],
                  ),
                ),
                SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- 1. HEADER SECTION ---
  Widget _buildHeader() {
    return GlassContainer(
      child: SafeArea(
        top: true,
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: const Text(
            'Good Morning, Aaliyah',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }

  // --- 3. CAROUSEL INDICATOR SECTION ---

  Widget _buildAffirmationCarousel() {
    return SizedBox(
      height: 220,
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentAffirmationIndex = index;
          });
        },
        // Pointing to the new file
        itemCount: AppAffirmations.dailyList.length,
        itemBuilder: (context, index) {
          return _buildSingleAffirmationCard(AppAffirmations.dailyList[index]);
        },
      ),
    );
  }

  Widget _buildSingleAffirmationCard(String imagePath) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.subtleBorder, width: 2),
            boxShadow: const [
              BoxShadow(
                color: AppColors.softShadow,
                blurRadius: 15,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                AppColors.darkBackground.withOpacity(0.2),
              ],
              stops: const [0.0, 1.0],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppColors.subtleBorder, width: 2),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDot({required bool isActive}) {
    // makes the dot transition smoothly
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: isActive ? 24 : 8, // Active dot becomes wider
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.darkTeal
            : AppColors.textDisabled.withOpacity(0.5),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Widget _buildCarouselIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        // Pointing to the new file here:
        AppAffirmations.dailyList.length,
        (index) => _buildDot(isActive: index == _currentAffirmationIndex),
      ),
    );
  }

  // --- 4. QUICK NAVIGATION ---
  Widget _buildQuickNavigation() {
    return Column(
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            QuickActionButton(
              icon: Icons.headphones,
              label: 'Sessions',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SessionsPage()),
                );
              },
            ),

            QuickActionButton(
              // icon: Icons.spa,
              icon: IconlyBold.profile,
              label: 'Relax',
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const SignPage()),
                // );
              },
            ),
            QuickActionButton(
              icon: IconlyBold.bookmark,
              label: 'Learn',
              onTap: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => const LearnPage()),
                // )
              },
            ),
          ],
        ),
      ],
    );
  }
}

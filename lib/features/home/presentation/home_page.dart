import 'package:flutter/material.dart';
import 'package:titiktemu_app/core/constants/app_colors.dart';
import 'package:titiktemu_app/core/widgets/mood_selector.dart';
import 'package:titiktemu_app/core/constants/app_affirmations.dart';

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
        int nextPage = (_currentAffirmationIndex + 1) % _affirmations.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 600), // Smooth transition speed
          curve: Curves.easeInOut,
        );
      }
    });
  }

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
            _buildAffirmationCarousel(),
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
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: _buildSingleAffirmationCard(AppAffirmations.dailyList[index]),
          );
        },
      ),
    );
  }

  Widget _buildSingleAffirmationCard(String text) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF174C5B),
            AppColors.softMint,
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColors.softShadow,
            blurRadius: 15,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 20,
            child: Icon(
              Icons.bedtime,
              color: Colors.yellow.shade100,
              size: 40,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkText,
                  height: 1.3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

Widget _buildCarouselIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        // Pointing to the new file here:
        AppAffirmations.dailyList.length,
        (index) => _buildDot(
          isActive: index == _currentAffirmationIndex,
        ),
      ),
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
        color: isActive ? AppColors.darkTeal : AppColors.textDisabled.withOpacity(0.5),
        borderRadius: BorderRadius.circular(4), 
      ),
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

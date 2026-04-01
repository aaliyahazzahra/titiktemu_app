import 'package:flutter/material.dart';
import 'package:titiktemu_app/core/constants/app_colors.dart';
import 'package:titiktemu_app/core/widgets/mood_selector.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  int _currentMood = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: MoodSelector(
                initialMoodIndex: _currentMood,
                onMoodSelected: (int selectedIndex) {
                  setState(() {
                    _currentMood = selectedIndex;
                  });
                  print("User selected mood index: $_currentMood");
                },
              ),
            ),

            const SizedBox(height: 20),
            _buildTextInputArea(),
            const SizedBox(height: 20),
            _buildActionRow(),
            const SizedBox(height: 30),
            _buildHistorySection(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // --- 1. HEADER SECTION ---
  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: const BoxDecoration(
        // PLACEHOLDER for the wavy graphic background.
  
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: AppColors.softGradient, // Blends into background
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.deepTeal,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            const Text(
              'Daily Mood Tracker',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'A safe space for your reflection',
              style: TextStyle(fontSize: 16, color: AppColors.textSecondary),
            ),
          ],
        ),
      ),
    );
  }

  // --- 3. TEXT INPUT AREA ---
  Widget _buildTextInputArea() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.subtleBorder, width: 1.5),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, const Color(0xFFE6F5F0)],
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.softShadow,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Write down your thoughts...',
                  hintStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: AppColors.textPrimary,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            Positioned(
              bottom: 12,
              right: 12,
              // PLACEHOLDER for the leaf graphic
              child: Icon(Icons.eco, color: AppColors.softMint, size: 32),
            ),
          ],
        ),
      ),
    );
  }

  // --- 4. ACTION BUTTON ROW ---
  Widget _buildActionRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(
                colors: AppColors.primaryGradient,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.softShadow,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.eco, color: Colors.white),
              label: const Text(
                'Save to Journal',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.sectionBackground,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: const [
                Icon(Icons.lock, size: 14, color: AppColors.textSecondary),
                SizedBox(width: 4),
                Text(
                  'Your entries are private',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- 5. HISTORY SECTION ---
  Widget _buildHistorySection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.backgroundSoft,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Your Mood History',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  'View All >',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.deepTeal,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Chart Area Placeholder
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 160,
                    decoration: BoxDecoration(
                      color: AppColors.sectionBackground,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'Line Chart\nPlaceholder\nSpace',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.textPlaceholder),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // List Area
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      _buildHistoryItem(
                        Icons.sentiment_very_satisfied,
                        'Today',
                        'Feeling more positive',
                      ),
                      _buildHistoryItem(
                        Icons.sentiment_satisfied,
                        'Yesterday',
                        'Calm and relaxed',
                      ),
                      _buildHistoryItem(
                        Icons.sentiment_neutral,
                        'Apr 22',
                        'Balanced day',
                      ),
                      _buildHistoryItem(
                        Icons.sentiment_dissatisfied,
                        'Apr 21',
                        'A bit challenging',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryItem(IconData iconData, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: AppColors.lightCyan,
              shape: BoxShape.circle,
            ),
            child: Icon(iconData, size: 20, color: AppColors.softTeal),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.textSecondary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right,
            size: 16,
            color: AppColors.textDisabled,
          ),
        ],
      ),
    );
  }
}

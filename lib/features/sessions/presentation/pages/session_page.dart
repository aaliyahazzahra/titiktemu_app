import 'package:flutter/material.dart';
import 'package:titiktemu_app/core/constants/app_colors.dart';
import '../widgets/session_card.dart'; // Import the widget we just made

class SessionsPage extends StatelessWidget {
  const SessionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            // --- MAIN SCROLLABLE CONTENT ---
            Positioned.fill(
              child: SingleChildScrollView(
              
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 24,
                  bottom: 100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Collection',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // List of Session Cards
                    // Note: Just like the affirmations, you should eventually move
                    // this data to a constants file or fetch it from your BLoC!
                    SessionCard(
                      title: 'Breathing Techniques',
                      subtitle: 'Learn how to relax with mindful breathing.',
                      placeholderIcon: Icons.self_improvement,
                      gradientColors: [AppColors.softMint, AppColors.lightCyan],
                    ),
                    SessionCard(
                      title: 'Intro to Hypnotherapy',
                      subtitle: 'Understanding the basics of hypnosis.',
                      placeholderIcon:
                          Icons.wifi_tethering, // Spiral-like placeholder
                      gradientColors: [
                        const Color(
                          0xFF9FB6B5,
                        ), 
                        const Color(0xFFE8E2DD),
                      ],
                    ),
                    SessionCard(
                      title: 'Finding Inner Calm',
                      subtitle: 'Guided meditation for deep relaxation.',
                      placeholderIcon: Icons.wb_twilight,
                      gradientColors: [
                        const Color(0xFFF1E3D3), // Warm sunset color
                        AppColors.moodNeutral,
                      ],
                    ),
                    SessionCard(
                      title: 'Overcoming Anxiety',
                      subtitle: 'Hypnosis to ease stress and worry.',
                      placeholderIcon: Icons.eco,
                      gradientColors: [AppColors.softTeal, AppColors.lightCyan],
                    ),
                  ],
                ),
              ),
            ),

            // --- FLOATING MINI PLAYER ---
            Positioned(
              bottom: 16,
              left: 20,
              right: 20,
              child: _buildMiniPlayer(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMiniPlayer() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: AppColors.darkTeal,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: AppColors.softShadow,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          children: [
            // Mini Thumbnail
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  colors: [AppColors.softMint, AppColors.softTeal],
                ),
              ),
              child: const Icon(Icons.waves, color: Colors.white, size: 24),
            ),
            const SizedBox(width: 12),

            // Track Info & Progress Bar
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Soothing Ocean Waves',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Text(
                        '02:15',
                        style: TextStyle(color: Colors.white70, fontSize: 10),
                      ),
                      const SizedBox(width: 8),
                      // Progress Bar
                      Expanded(
                        child: Container(
                          height: 3,
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 40, // Static width for UI preview
                              decoration: BoxDecoration(
                                color: AppColors.softMint,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        '-05:20',
                        style: TextStyle(color: Colors.white70, fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 8),

            // Playback Controls
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    color: AppColors.darkTeal,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.fast_forward, color: Colors.white, size: 24),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

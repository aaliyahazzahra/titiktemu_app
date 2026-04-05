import 'package:flutter/material.dart';
import 'package:titiktemu_app/core/constants/app_colors.dart';
import 'package:titiktemu_app/core/widgets/glass_container.dart';

class SessionTopPill extends StatelessWidget {
  final bool isPlaying;

  const SessionTopPill({super.key, required this.isPlaying});

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      width: 160,
      height: 40,
      color: AppColors.darkBackground,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.spa, size: 16, color: AppColors.deepTeal),
          const SizedBox(width: 8),
          const Text(
            "Flowing Water",
            style: TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 4),
          Icon(
            Icons.keyboard_arrow_down,
            size: 18,
            color: AppColors.textSecondary,
          ),
        ],
      ),
    );
  }
}

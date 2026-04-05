import 'package:flutter/material.dart';
import 'package:titiktemu_app/core/constants/app_colors.dart';

class PulsingCircles extends StatelessWidget {
  final bool isBreathingIn;
  final Duration duration;

  const PulsingCircles({
    super.key,
    required this.isBreathingIn,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    final double maxSize = isBreathingIn ? 350.0 : 200.0;
    final double midSize = isBreathingIn ? 250.0 : 150.0;
    final double minSize = isBreathingIn ? 150.0 : 100.0;

    return Column(
      children: [
        SizedBox(height: 200),
        Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              duration: duration,
              width: maxSize,
              height: maxSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.lightCyan.withOpacity(0.15),
              ),
            ),
            AnimatedContainer(
              duration: duration,
              width: midSize,
              height: midSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.lightCyan.withOpacity(0.2),
              ),
            ),
            AnimatedContainer(
              duration: duration,
              width: minSize,
              height: minSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.lightCyan.withOpacity(0.3),
              ),
            ),
          ],
        ),
        SizedBox(height: 40),
      ],
    );
  }
}

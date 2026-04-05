import 'package:flutter/material.dart';
import 'package:titiktemu_app/core/constants/app_colors.dart';


class AnimatedBreathingBackground extends StatelessWidget {
  final bool isPlaying;
  final bool isBreathingIn;

  const AnimatedBreathingBackground({
    super.key,
    required this.isPlaying,
    required this.isBreathingIn,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 800),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: !isPlaying
          ? Container(
              key: const ValueKey('paused_bg'),
              color: AppColors
                  .backgroundSoft, 
            )
          : Container(
              key: ValueKey('playing_bg_$isBreathingIn'),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: isBreathingIn
                      ? [
                          AppColors.darkTeal,
                          AppColors.softTeal,
                        ] 
                      : [
                          AppColors.softMint,
                          AppColors.lightCyan,
                        ],
                ),
              ),
            ),
    );
  }
}

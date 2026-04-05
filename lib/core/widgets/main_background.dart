import 'package:flutter/material.dart';
import 'package:titiktemu_app/core/constants/app_assets.dart';
import 'package:titiktemu_app/core/constants/app_colors.dart';

class MainBackground extends StatelessWidget {
  final Widget child;

  const MainBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            // just in case the image fails to load
            color: Colors.amber,
            image: DecorationImage(
              image: AssetImage(AppAssets.globalBackground),
              fit: BoxFit.cover,
              // colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.dstATop),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.darkBackground.withOpacity(0.7),
                AppColors.backgroundSoft.withOpacity(0.7),
                AppColors.backgroundSoft.withOpacity(0.9),
                AppColors.backgroundSoft,
                AppColors.backgroundSoft,
                AppColors.backgroundSoft.withOpacity(0.9),
                AppColors.backgroundSoft.withOpacity(0.7),
                AppColors.darkBackground.withOpacity(0.7),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.0, 0.15, 0.2, 0.5, 0.7, 0.8, 0.85, 0.98],
            ),
          ),
          child: child,
        ),
      ],
    );
  }
}

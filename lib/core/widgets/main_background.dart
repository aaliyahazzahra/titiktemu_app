import 'package:flutter/material.dart';
import 'package:titiktemu_app/core/constants/app_assets.dart';

class MainBackground extends StatelessWidget {
  final Widget child;

  const MainBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
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

      child: child,
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:titiktemu_app/features/meditation/presentation/widgets/animated_breathing_background.dart';
import 'package:titiktemu_app/features/meditation/presentation/widgets/pulsing_circles.dart';
import 'package:titiktemu_app/features/meditation/presentation/widgets/session_top_pill.dart';

class BreathingPage extends StatefulWidget {
  const BreathingPage({super.key});

  @override
  State<BreathingPage> createState() => _BreathingPageState();
}

class _BreathingPageState extends State<BreathingPage> {
  bool _isPlaying = false;
  bool _isBreathingIn = true;
  Timer? _breathTimer;

  final Duration _breathDuration = const Duration(seconds: 4);

  void _togglePlayPause() {
    setState(() {
      _isPlaying = !_isPlaying;

      if (_isPlaying) {
        _isBreathingIn = true;
        _startBreathingCycle();
      } else {
        _breathTimer?.cancel();
      }
    });
  }

  void _startBreathingCycle() {
    _breathTimer = Timer.periodic(_breathDuration, (timer) {
      setState(() {
        _isBreathingIn = !_isBreathingIn;
      });
    });
  }

  @override
  void dispose() {
    _breathTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 58, 3, 3),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBreathingBackground(
            isPlaying: _isPlaying,
            isBreathingIn: _isBreathingIn,
          ),

          if (_isPlaying)
            PulsingCircles(
              isBreathingIn: _isBreathingIn,
              duration: _breathDuration,
            ),

          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 16),
                SessionTopPill(isPlaying: _isPlaying),
                const Spacer(),
                _buildCenterText(),
                const Spacer(),
                _buildTimerText(),
                const SizedBox(height: 24),
                _buildPlayPauseButton(),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCenterText() {
    String text = "Paused";
    if (_isPlaying) {
      text = _isBreathingIn ? "Breathe In..." : "Breathe Out...";
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: Text(
        text,
        key: ValueKey<String>(text),
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w400,
          color: _isPlaying ? Colors.white : Colors.grey[800],
          shadows: _isPlaying
              ? [Shadow(color: Colors.black.withOpacity(0.2), blurRadius: 10)]
              : null,
        ),
      ),
    );
  }

  Widget _buildTimerText() {
    return Text(
      "09:27", // Hardcoded for layout purposes
      style: TextStyle(
        fontSize: 18,
        color: _isPlaying ? Colors.white : Colors.grey[800],
      ),
    );
  }

  Widget _buildPlayPauseButton() {
    return GestureDetector(
      onTap: _togglePlayPause,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _isPlaying ? Colors.white : const Color(0xFFA5CFA1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(
          _isPlaying ? Icons.pause : Icons.play_arrow,
          size: 40,
          color: _isPlaying ? const Color(0xFF26A69A) : Colors.white,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:titiktemu_app/core/constants/app_colors.dart';

class MoodSelector extends StatefulWidget {
  final int initialMoodIndex;
  final Function(int) onMoodSelected;
  const MoodSelector({
    super.key,
    this.initialMoodIndex = 4, // Default to "Neutral"
    required this.onMoodSelected,
  });

  @override
  State<MoodSelector> createState() => _MoodSelectorState();
}

class _MoodSelectorState extends State<MoodSelector> {
  late int _selectedMoodIndex;
  @override
  void initState() {
    super.initState();
    _selectedMoodIndex = widget.initialMoodIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildMoodIcon(
          0,
          Icons.sentiment_very_dissatisfied,
          'Struggling',
          AppColors.moodStruggling,
        ),
        _buildMoodIcon(
          1,
          Icons.sentiment_dissatisfied,
          'Low',
          AppColors.moodLow,
        ),
        _buildMoodIcon(
          2,
          Icons.sentiment_neutral,
          'Neutral',
          AppColors.moodNeutral,
        ),
        _buildMoodIcon(
          3,
          Icons.sentiment_satisfied,
          'Calm',
          AppColors.moodCalm,
        ),
        _buildMoodIcon(
          4,
          Icons.sentiment_very_satisfied,
          'Good',
          AppColors.moodGood,
        ),
      ],
    );
  }

  Widget _buildMoodIcon(
    int index,
    IconData iconData,
    String label,
    Color specificMoodColor,
  ) {
    bool isSelected = _selectedMoodIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedMoodIndex = index;
        });
        widget.onMoodSelected(index); // Notify the parent page!
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(isSelected ? 12 : 8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected
                  ? specificMoodColor
                  : AppColors.sectionBackground,
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: AppColors.glowMint,
                        blurRadius: 15,
                        spreadRadius: 2,
                      ),
                    ]
                  : null,
            ),
            child: Icon(
              iconData,
              size: isSelected ? 40 : 36,
              color: isSelected
                  ? AppColors.textPrimary
                  : AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected
                  ? AppColors.textPrimary
                  : AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:swim_success_dev/features/pace_selector/models/swimmer_level.dart';

class SwimmerLevelBadge extends StatelessWidget {
  final SwimmerLevel level;

  const SwimmerLevelBadge({super.key, required this.level});

  Color get _color {
    switch (level) {
      case SwimmerLevel.beginner:
        return Colors.green;
      case SwimmerLevel.intermediate:
        return Colors.blue;
      case SwimmerLevel.advanced:
        return Colors.orange;
      case SwimmerLevel.elite:
        return Colors.purple;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: _color.withAlpha(30),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: _color, width: 1.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.pool, color: _color, size: 18),
          const SizedBox(width: 8),
          Text(
            level.label,
            style: TextStyle(
              color: _color,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';

enum GlassDialogType { success, error }

class GlassDialog extends StatelessWidget {
  final GlassDialogType type;
  final String title;
  final String message;
  final String okLabel;
  final VoidCallback onOk;

  const GlassDialog({
    super.key,
    required this.type,
    required this.title,
    required this.message,
    required this.okLabel,
    required this.onOk,
  });

  bool get _isSuccess => type == GlassDialogType.success;

  List<Color> get _borderColors => _isSuccess
      ? [
          Colors.greenAccent.withOpacity(0.75),
          Colors.teal.shade300.withOpacity(0.55),
          Colors.cyan.shade700.withOpacity(0.40),
        ]
      : [
          Colors.redAccent.withOpacity(0.75),
          Colors.orange.shade300.withOpacity(0.55),
          Colors.red.shade800.withOpacity(0.40),
        ];

  Color get _accentColor =>
      _isSuccess ? Colors.greenAccent.shade400 : Colors.redAccent.shade200;

  IconData get _icon =>
      _isSuccess ? Icons.check_circle_rounded : Icons.cancel_rounded;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            colors: _borderColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(1.5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22.5),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.55),
                    Colors.blueGrey.shade900.withOpacity(0.50),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              padding: const EdgeInsets.fromLTRB(28, 32, 28, 28),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(_icon, color: _accentColor, size: 56),
                  const SizedBox(height: 16),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.72),
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 28),
                  _GlassOkButton(
                    label: okLabel,
                    accentColor: _accentColor,
                    borderColors: _borderColors,
                    onTap: onOk,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GlassOkButton extends StatelessWidget {
  final String label;
  final Color accentColor;
  final List<Color> borderColors;
  final VoidCallback onTap;

  const _GlassOkButton({
    required this.label,
    required this.accentColor,
    required this.borderColors,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: borderColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.all(1.5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.5),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Material(
            color: Colors.black.withOpacity(0.18),
            child: InkWell(
              onTap: onTap,
              splashColor: accentColor.withOpacity(0.15),
              highlightColor: accentColor.withOpacity(0.08),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 48,
                ),
                child: Text(
                  label,
                  style: TextStyle(
                    color: accentColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:baristea_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        decoration: BoxDecoration(
          color: selected
              ? AppTheme.primary.withValues(alpha: 0.12)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Center(
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 220),
            switchInCurve: Curves.easeOutBack,
            switchOutCurve: Curves.easeIn,
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: ScaleTransition(scale: animation, child: child),
              );
            },
            child: selected
                ? Row(
                    key: ValueKey('selected'),
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(icon, size: 22, color: AppTheme.primary),
                      SizedBox(width: 8),
                      Text(
                        label,
                        style: TextStyle(
                          color: AppTheme.primary,
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  )
                : Icon(
                    icon,
                    key: ValueKey('unselected'),
                    size: 22,
                    color: Colors.grey.shade500,
                  ),
          ),
        ),
      ),
    );
  }
}

import 'package:baristea_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

enum SugarLevel {
  none,
  less,
  normal,
  more,
}

class SugarLevelSelector extends StatelessWidget {
  const SugarLevelSelector({
    super.key,
    required this.selectedLevel,
    required this.onChanged,
  });

  final SugarLevel selectedLevel;
  final ValueChanged<SugarLevel> onChanged;

  @override
  Widget build(BuildContext context) {
    final levels = [
      (SugarLevel.none, 0),
      (SugarLevel.less, 1),
      (SugarLevel.normal, 2),
      (SugarLevel.more, 3),
    ];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Sugar Level',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: AppTheme.textPrimary,
          ),
        ),

        const SizedBox(width: 24),

        Expanded(
          child: Row(
            children: levels.map((item) {
              final level = item.$1;
              final amount = item.$2;
              final selected = selectedLevel == level;

              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: level == SugarLevel.more ? 0 : 8,
                  ),
                  child: InkWell(
                    onTap: () => onChanged(level),
                    borderRadius: BorderRadius.circular(16),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.easeOut,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SizedBox(
                        height: 24,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (amount == 0)
                              Icon(
                                Icons.block_rounded,
                                size: 18,
                                color: selected
                                    ? AppTheme.primary
                                    : Colors.grey.withValues(alpha: 0.75),
                              )
                            else
                              ...List.generate(
                                amount,
                                (index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 1,
                                  ),
                                  child: Icon(
                                    Icons.water_drop_rounded,
                                    size: 18,
                                    color: selected
                                        ? AppTheme.primary
                                    : Colors.grey.withValues(alpha: 0.75)
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
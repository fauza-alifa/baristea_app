import 'package:baristea_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

enum IceLevel { none, less, normal, more }

class IceLevelSelector extends StatelessWidget {
  const IceLevelSelector({
    super.key,
    required this.selectedLevel,
    required this.onChanged,
  });

  final IceLevel selectedLevel;
  final ValueChanged<IceLevel> onChanged;

  @override
  Widget build(BuildContext context) {
    final levels = [
      (IceLevel.none, 0),
      (IceLevel.less, 1),
      (IceLevel.normal, 2),
      (IceLevel.more, 3),
    ];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Ice Level',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: AppTheme.textPrimary,
          ),
        ),

        SizedBox(width: 46),

        Expanded(
          child: Row(
            children: levels.map((item) {
              final level = item.$1;
              final amount = item.$2;
              final selected = selectedLevel == level;

              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: level == IceLevel.more ? 0 : 8,
                  ),
                  child: InkWell(
                    onTap: () => onChanged(level),
                    borderRadius: BorderRadius.circular(16),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.easeOut,
                      padding: EdgeInsets.all(12),
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
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 1,
                                  ),
                                  child: Icon(
                                    Icons.ac_unit_rounded,
                                    size: 18,
                                    color: selected
                                        ? AppTheme.primary
                                    : Colors.grey.withValues(alpha: 0.75),
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
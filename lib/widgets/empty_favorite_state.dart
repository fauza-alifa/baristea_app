import 'package:baristea_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class EmptyFavoriteState extends StatelessWidget {
  const EmptyFavoriteState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
                Icons.local_cafe,
                size: 100,
                color: AppTheme.primary.withValues(alpha: 0.24),
              ),
            

            SizedBox(height: 10),

            Text(
              'No favorite tea yet',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: AppTheme.textPrimary,
              ),
            ),

            SizedBox(height: 7),

            Text(
              'Found a tea you love?',
              style: TextStyle(
                fontSize: 13,
                color: AppTheme.textSecondary,
              ),
            ),

            SizedBox(height: 3),

            Text(
              'Tap the heart and save it to your favorites.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: AppTheme.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
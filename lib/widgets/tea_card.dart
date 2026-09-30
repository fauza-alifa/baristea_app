import 'package:baristea_app/models/tea.dart';
import 'package:baristea_app/state/favorites_controller.dart';
import 'package:baristea_app/theme/app_theme.dart';
import 'package:baristea_app/widgets/tea_images.dart';
import 'package:flutter/material.dart';

class TeaCard extends StatelessWidget {
  const TeaCard({super.key, required this.tea, required this.onTap});

  final Tea tea;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Hero(
              tag: 'tea-image-${tea.id}',
              child: TeaNetworkImages(
                imageUrl: tea.imageUrl,
                fallbackIcon: tea.icon,
                fallbackColor: tea.color,
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppTheme.primary),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tea.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppTheme.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          formatRupiah(tea.price),
                          style: TextStyle(
                            color: AppTheme.primary,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star_rounded,
                              color: Colors.amber,
                              size: 15,
                            ),
                            SizedBox(width: 3),
                            Text(
                              tea.rating.toString(),
                              style: TextStyle(
                                color: AppTheme.primary,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Favorite
            Positioned(
              top: 12,
              right: 12,
              child: ValueListenableBuilder<Set<String>>(
                valueListenable: FavoritesController.instance,
                builder: (context, favorites, _) {
                  final isFav = favorites.contains(tea.id);

                  return GestureDetector(
                    onTap: () {
                      FavoritesController.instance.toggle(tea.id);
                    },
                    child: Container(
                      padding: EdgeInsets.all(9),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isFav
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_rounded,
                        color: isFav
                            ? Colors.redAccent
                            : AppTheme.primary.withValues(alpha: 0.75),
                        size: 19,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:baristea_app/models/tea.dart';
import 'package:baristea_app/state/favorites_controller.dart';
import 'package:baristea_app/widgets/circle_icon_button.dart';
import 'package:baristea_app/widgets/tea_images.dart';
import 'package:flutter/material.dart';

class DetailHeader extends StatelessWidget {
  const DetailHeader({super.key, required this.tea, required this.onBack});

  final Tea tea;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: Hero(
              tag: 'tea-image-${tea.id}',
              child: TeaNetworkImages(
                imageUrl: tea.imageUrl,
                fallbackIcon: tea.icon,
                fallbackColor: tea.color,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleIconButton(
                    icon: Icons.arrow_back_rounded,
                    onTap: onBack,
                  ),
                  _FavoriteButton(teaId: tea.id),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FavoriteButton extends StatelessWidget {
  const _FavoriteButton({required this.teaId});

  final String teaId;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Set<String>>(
      valueListenable: FavoritesController.instance,
      builder: (context, favoritesId, _) {
        final isFavorite = favoritesId.contains(teaId);
        return CircleIconButton(
          icon: isFavorite
              ? Icons.favorite_rounded
              : Icons.favorite_border_rounded,
          iconColor: isFavorite ? Colors.redAccent : Colors.black87,
          onTap: () => FavoritesController.instance.toggle(teaId),
        );
      },
    );
  }
}

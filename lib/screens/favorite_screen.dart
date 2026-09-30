import 'package:baristea_app/data/dummy_data.dart';
import 'package:baristea_app/screens/detail_screen.dart';
import 'package:baristea_app/state/favorites_controller.dart';
import 'package:baristea_app/theme/app_theme.dart';
import 'package:baristea_app/widgets/empty_favorite_state.dart';
import 'package:baristea_app/widgets/tea_card.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsGeometry.fromLTRB(20, 16, 20, 8),
            child: Text('Favorite', style: AppTheme.display(fontSize: 24)),
          ),
          Expanded(
            child: ValueListenableBuilder<Set<String>>(
              valueListenable: FavoritesController.instance,
              builder: (context, favoriteIds, _) {
                final favoriteTeas = dummyTeas
                    .where((tea) => favoriteIds.contains(tea.id))
                    .toList();

                if (favoriteTeas.isEmpty) {
                  return const EmptyFavoriteState(); //class empty fav state
                }

                return GridView.builder(
                  padding: EdgeInsets.fromLTRB(20, 4, 20, 100),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.68,
                  ),
                  itemCount: favoriteTeas.length,
                  itemBuilder: (context, index) {
                    final tea = favoriteTeas[index];
                    return TeaCard(
                      tea: tea, 
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => DetailScreen(tea: tea))
                        );
                      }
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

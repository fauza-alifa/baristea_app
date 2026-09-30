import 'package:baristea_app/data/dummy_data.dart';
import 'package:baristea_app/models/tea.dart';
import 'package:baristea_app/screens/detail_screen.dart';
import 'package:baristea_app/widgets/home_content_header.dart';
import 'package:baristea_app/widgets/tea_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _query = '';
  String _selectedCategory = 'All';

  List<String> get _categories {
    final categories = dummyTeas.map((tea) => tea.category).toSet().toList();

    return ['All', ...categories];
  }

  List<Tea> get _filteredTeas {
    return dummyTeas.where((tea) {
      final matchesQuery = tea.name.toLowerCase().contains(
        _query.toLowerCase(),
      );

      final matchesCategory =
          _selectedCategory == 'All' || tea.category == _selectedCategory;

      return matchesQuery && matchesCategory;
    }).toList();
  }

  void _openDetail(Tea tea) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => DetailScreen(tea: tea)));
  }

  @override
  Widget build(BuildContext context) {
    final teas = _filteredTeas;

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: HomeContentHeader(
              selectedCategory: _selectedCategory,
              categories: _categories,
              onQueryChanged: (value) {
                setState(() {
                  _query = value;
                });
              },
              onCategorySelected: (value) {
                setState(() {
                  _selectedCategory = value;
                });
              },
            ),
          ),

          if (teas.isEmpty)
            const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Text(
                  'Tea not found',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.68,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  final tea = teas[index];

                  return TeaCard(tea: tea, onTap: () => _openDetail(tea));
                }, childCount: teas.length),
              ),
            ),
        ],
      ),
    );
  }
}

import 'package:baristea_app/models/tea.dart';
import 'package:baristea_app/theme/app_theme.dart';
import 'package:baristea_app/widgets/detail_header.dart';
import 'package:baristea_app/widgets/detail_total.dart';
import 'package:baristea_app/widgets/ice_level_selector.dart';
import 'package:baristea_app/widgets/product_summary.dart';
import 'package:baristea_app/widgets/quantity_stepper.dart';
import 'package:baristea_app/widgets/sheet_drag_handle.dart';
import 'package:baristea_app/widgets/sugar_level_selector.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.tea});

  final Tea tea;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int _quantity = 1;

  // Default customization
  IceLevel _iceLevel = IceLevel.normal;
  SugarLevel _sugarLevel = SugarLevel.normal;

  void _increment() {
    setState(() {
      _quantity++;
    });
  }

  void _decrement() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  void _addToCart() {
    final tea = widget.tea;

    final iceText = switch (_iceLevel) {
      IceLevel.none => 'No Ice',
      IceLevel.less => 'Less Ice',
      IceLevel.normal => 'Normal Ice',
      IceLevel.more => 'More Ice',
    };

    final sugarText = switch (_sugarLevel) {
      SugarLevel.none => 'No Sugar',
      SugarLevel.less => 'Less Sugar',
      SugarLevel.normal => 'Normal Sugar',
      SugarLevel.more => 'More Sugar',
    };

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '$_quantity x ${tea.name}\n'
          '$iceText - $sugarText',
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tea = widget.tea;

    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          DetailHeader(tea: tea, onBack: () => Navigator.of(context).pop()),

          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(22, 22, 22, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SheetDragHandle(),

                    SizedBox(height: 20),

                    ProductSummary(tea: tea),

                    SizedBox(height: 20),

                    Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textPrimary,
                      ),
                    ),

                    SizedBox(height: 8),

                    Text(
                      tea.description,
                      style: TextStyle(
                        color: AppTheme.textSecondary,
                        fontWeight: FontWeight.w500,
                        height: 1.6,
                        fontSize: 13.5,
                      ),
                    ),

                    SizedBox(height: 32),
                    Container(height: 2, color: AppTheme.primarySoft),
                    SizedBox(height: 12),

                    IceLevelSelector(
                      selectedLevel: _iceLevel,
                      onChanged: (level) {
                        setState(() {
                          _iceLevel = level;
                        });
                      },
                    ),

                    SizedBox(height: 12),
                    Container(height: 2, color: AppTheme.primarySoft),
                    SizedBox(height: 12),

                    SugarLevelSelector(
                      selectedLevel: _sugarLevel,
                      onChanged: (level) {
                        setState(() {
                          _sugarLevel = level;
                        });
                      },
                    ),

                    SizedBox(height: 12),
                    Container(height: 2, color: AppTheme.primarySoft),
                    SizedBox(height: 32),

                    // Quantity
                    QuantityStepper(
                      quantity: _quantity,
                      onIncrement: _increment,
                      onDecrement: _decrement,
                    ),

                    SizedBox(height: 90),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addToCart,
        backgroundColor: AppTheme.primary,
        foregroundColor: Colors.white,
        elevation: 2,
        icon: Icon(Icons.shopping_bag_outlined, size: 20),
        label: Text(
          'Add to Cart',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),

      bottomNavigationBar: DetailTotalBar(totalPrice: tea.price * _quantity),
    );
  }
}

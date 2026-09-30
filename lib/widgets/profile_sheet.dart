import 'package:baristea_app/data/dummy_data.dart';
import 'package:baristea_app/screens/login_screen.dart';
import 'package:baristea_app/state/auth_controller.dart';
import 'package:baristea_app/theme/app_theme.dart';
import 'package:baristea_app/widgets/sheet_drag_handle.dart';
import 'package:flutter/material.dart';

void showProfileSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (sheetContext) {
      return _ProfileSheetContent(
        homeContext: context,
      );
    },
  );
}

class _ProfileSheetContent extends StatelessWidget {
  const _ProfileSheetContent({
    required this.homeContext,
  });

  final BuildContext homeContext;

  Future<void> _logout(BuildContext sheetContext) async {
    Navigator.of(sheetContext).pop();

    await AuthController.instance.logout();

    if (homeContext.mounted) {
      Navigator.of(homeContext).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => LoginScreen(),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(24, 12, 24, 28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SheetDragHandle(),

          SizedBox(height: 28),

          Row(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: AppTheme.primary.withValues(alpha: 0.10),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person_rounded,
                  color: AppTheme.primaryDark,
                  size: 32,
                ),
              ),

              SizedBox(width: 15),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DummyUser.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        color: AppTheme.textPrimary,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      DummyUser.email,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 24),

          Divider(
            height: 1,
          ),

          SizedBox(height: 14),

          InkWell(
            onTap: () => _logout(context),
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 13,
                horizontal: 4,
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(9),
                    decoration: BoxDecoration(
                      color: Colors.red.withValues(alpha: 0.08),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.logout_rounded,
                      size: 19,
                      color: Colors.redAccent,
                    ),
                  ),

                  SizedBox(width: 13),

                  Expanded(
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                  ),

                  Icon(
                    Icons.chevron_right_rounded,
                    color: AppTheme.textSecondary,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
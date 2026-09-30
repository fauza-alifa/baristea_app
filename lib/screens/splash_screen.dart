import 'package:flutter/material.dart';

import '../state/auth_controller.dart';
import '../theme/app_theme.dart';
import 'login_screen.dart';
import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 2500),
  )..forward();

  late final Animation<double> _cupFade = CurvedAnimation(
    parent: _controller,
    curve: Interval(0.0, 0.18, curve: Curves.easeOut),
  );

  late final Animation<double> _cupScale = CurvedAnimation(
    parent: _controller,
    curve: Interval(0.0, 0.25, curve: Curves.easeOutBack),
  );

  late final Animation<double> _teaFill = CurvedAnimation(
    parent: _controller,
    curve: Interval(0.18, 0.70, curve: Curves.easeInOutCubic),
  );

  late final Animation<double> _brandFade = CurvedAnimation(
    parent: _controller,
    curve: Interval(0.68, 0.88, curve: Curves.easeOut),
  );

  late final Animation<Offset> _brandSlide =
      Tween<Offset>(begin: Offset(0, 0.25), end: Offset.zero).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(0.68, 0.90, curve: Curves.easeOutCubic),
        ),
      );

  @override
  void initState() {
    super.initState();
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    await Future.wait([
      AuthController.instance.loadPersistedSession(),
      Future.delayed(Duration(milliseconds: 2800)),
    ]);

    if (!mounted) return;

    final isLoggedIn = AuthController.instance.value;

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => isLoggedIn ? MainScreen() : LoginScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryDark,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _cupFade,
              child: ScaleTransition(
                scale: _cupScale,
                child: SizedBox(
                  width: 150,
                  height: 145,
                  child: AnimatedBuilder(
                    animation: _teaFill,
                    builder: (context, child) {
                      return CustomPaint(
                        size: Size(150, 150),
                        painter: TeaCupPainter(fillProgress: _teaFill.value),
                      );
                    },
                  ),
                ),
              ),
            ),

            SizedBox(height: 2),

            SlideTransition(
              position: _brandSlide,
              child: FadeTransition(
                opacity: _brandFade,
                child: Text(
                  'Baristea',
                  style: AppTheme.display(
                    fontSize: 36,
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Painter
class TeaCupPainter extends CustomPainter {
  final double fillProgress;

  TeaCupPainter({required this.fillProgress});

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;

    // cup
    const cupWidth = 82.0;
    const cupHeight = 82.0;

    final cupLeft = centerX - cupWidth / 2;
    const cupTop = 42.0;

    final cupPath = Path();

    cupPath.moveTo(cupLeft + 7, cupTop + 5);

    cupPath.lineTo(cupLeft + cupWidth - 7, cupTop + 5);

    cupPath.lineTo(cupLeft + cupWidth - 15, cupTop + cupHeight - 5);

    cupPath.quadraticBezierTo(
      centerX,
      cupTop + cupHeight + 8,
      cupLeft + 15,
      cupTop + cupHeight - 5,
    );

    cupPath.close();

    // Background.
    final cupPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.95)
      ..style = PaintingStyle.fill;

    canvas.drawPath(cupPath, cupPaint);

    // Tea
    final teaTop = cupTop + cupHeight - 5 - (cupHeight - 15) * fillProgress;

    final teaPaint = Paint()
      ..color = AppTheme.primary.withValues(alpha: 0.88)
      ..style = PaintingStyle.fill;

    canvas.save();

    canvas.clipPath(cupPath);

    final teaRect = Rect.fromLTWH(
      cupLeft,
      teaTop,
      cupWidth,
      cupTop + cupHeight - teaTop + 10,
    );

    canvas.drawRect(teaRect, teaPaint);

    canvas.restore();

    // Outline
    final outlinePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2;

    canvas.drawPath(cupPath, outlinePaint);
  }

  @override
  bool shouldRepaint(covariant TeaCupPainter oldDelegate) {
    return oldDelegate.fillProgress != fillProgress;
  }
}

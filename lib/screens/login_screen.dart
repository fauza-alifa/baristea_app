import 'package:baristea_app/data/dummy_data.dart';
import 'package:baristea_app/screens/main_screen.dart';
import 'package:baristea_app/state/auth_controller.dart';
import 'package:baristea_app/theme/app_theme.dart';
import 'package:baristea_app/widgets/login_brand_header.dart';
import 'package:baristea_app/widgets/login_form_card.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController(text: DummyUser.email);

  final _passwordController = TextEditingController(text: DummyUser.password);

  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    await Future.delayed(const Duration(milliseconds: 600));

    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (!mounted) return;

    setState(() => _isLoading = false);

    if (email == DummyUser.email && password == DummyUser.password) {
      await AuthController.instance.login();

      if (!mounted) return;

      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const MainScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Incorrect email or password. Please try again.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primary,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Positioned(top: 80, left: 24, right: 24, child: LoginBrandHeader()),

            Positioned.fill(
              top: 250,
              child: LoginFormCard(
                formKey: _formKey,
                emailController: _emailController,
                passwordController: _passwordController,
                isLoading: _isLoading,
                onSubmit: _login,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

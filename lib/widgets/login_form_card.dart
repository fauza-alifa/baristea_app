import 'package:baristea_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class LoginFormCard extends StatefulWidget {
  const LoginFormCard({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.isLoading,
    required this.onSubmit,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isLoading;
  final VoidCallback onSubmit;

  @override
  State<LoginFormCard> createState() => _LoginFormCardState();
}

class _LoginFormCardState extends State<LoginFormCard> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:  EdgeInsets.fromLTRB(24, 92, 24, 30),
      decoration:  BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Form(
        key: widget.formKey,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  TextFormField(
                    controller: widget.emailController,
                    keyboardType: TextInputType.emailAddress,
                    style:  TextStyle(
                      fontSize: 13,
                      color: AppTheme.textPrimary,
                    ),
                    decoration:  InputDecoration(
                      hintText: 'Email or Phone number',
                      hintStyle: TextStyle(
                        color: AppTheme.primarySoft,
                        fontSize: 13,
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 14,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email cannot be empty.';
                      }
                      return null;
                    },
                  ),

                  Container(height: 2, color: AppTheme.primarySoft),

                  TextFormField(
                    controller: widget.passwordController,
                    obscureText: _obscure,
                    style:  TextStyle(
                      fontSize: 13,
                      color: AppTheme.textPrimary,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle:  TextStyle(
                        color: AppTheme.primarySoft,
                        fontSize: 13,
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      contentPadding:  EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 14,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscure
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 18,
                          color: Colors.grey.shade500,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscure = !_obscure;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password cannot be empty.';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),

             SizedBox(height: 50),

            SizedBox(
              width: 148,
              height: 40,
              child: ElevatedButton(
                onPressed: widget.isLoading ? null : widget.onSubmit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryDark,
                  disabledBackgroundColor: AppTheme.primaryDark,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: widget.isLoading
                    ?  SizedBox(
                        width: 17,
                        height: 17,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    :  Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
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

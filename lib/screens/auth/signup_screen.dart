import 'package:fin_track/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import '../../widgets/custom_widgets.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppConstants.backgroundGradient,
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(AppConstants.paddingL),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 400),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(AppConstants.radiusM),
                    boxShadow: [
                      BoxShadow(
                        color: AppConstants.primaryColor.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(AppConstants.paddingL),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // App Logo/Icon
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: AppConstants.backgroundColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Lottie.asset(
                            "assets/animation/Money.json",
                            repeat: true,
                          ),
                        ),
                        const SizedBox(height: AppConstants.paddingL),

                        const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2C3E50),
                          ),
                        ),
                        const SizedBox(height: AppConstants.paddingL),

                        const CustomTextField(labelText: "Email"),
                        const SizedBox(height: 12),
                        const CustomTextField(
                          labelText: "Password",
                          obscureText: true,
                        ),
                        const SizedBox(height: 12),
                        const CustomTextField(
                          labelText: "Confirm Password",
                          obscureText: true,
                        ),
                        const SizedBox(height: 24),

                        CustomElevatedButton(
                          onPressed: () {
                            // TODO: Firebase sign up later
                          },
                          text: "Sign Up",
                        ),

                        const SizedBox(height: AppConstants.paddingL),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an Account?"),
                            TextButton(
                              onPressed: () => context.go('/login'),
                              style: AppConstants.textButtonStyle,
                              child: const Text("Log in"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

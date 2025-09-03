import 'package:fin_track/utils/constants/constants.dart';
import 'package:fin_track/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background animation (fills screen)
          Positioned.fill(
            child: Lottie.asset(
              "assets/animation/Background.json",
              fit: BoxFit.cover,
              repeat: true,
            ),
          ),

          // Foreground content (centered)
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Finance animation
                Lottie.asset(
                  "assets/animation/Finance.json",
                  height: 350,
                  width: 350,
                  repeat: true,
                ),
                const SizedBox(height: 30),

                // Get Started button
                Padding(
                  padding: const EdgeInsets.all(AppConstants.paddingL),
                  child: CustomElevatedButton(
                    onPressed: () {
                      // TODO: Firebase login later
                      context.go('/login');
                    },
                    text: "Get Started",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

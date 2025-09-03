import 'package:fin_track/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../widgets/wallet_summary.dart';
import '../widgets/spending_chart.dart';
import '../widgets/transaction_list.dart' hide WalletSummary;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        padding: const EdgeInsets.only(bottom: 2),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black87.withOpacity(0.25), // was 0.08
              blurRadius: 20, // was 20
              offset: Offset(0, 12), // was 8
            ),
            BoxShadow(
              color: Colors.black87.withOpacity(0.15), // was 0.04
              blurRadius: 12, // was 6
              offset: Offset(0, 4), // was 2
            ),
          ],
        ),
        height: 70,
        width: 70,
        child: FloatingActionButton(
          backgroundColor:  Colors.white.withAlpha(180),
          autofocus: true,
          shape: const CircleBorder(),
          onPressed: () {},
          elevation: 50,
          child: Icon(
            Icons.add,
            size: 35,
            color: const Color.fromARGB(255, 84, 108, 216),
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background Animation
          Positioned.fill(
            child: Lottie.asset(
              "assets/animation/Background.json",
              fit: BoxFit.cover,
              repeat: true,
            ),
          ),

          // Enhanced Gradient Overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0.15),
                    Colors.white.withOpacity(0.08),
                    Colors.white.withOpacity(0.12),
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
            ),
          ),

          // Foreground Content
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 70),

                // Enhanced Header Section
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withOpacity(0.95),
                        Colors.white.withOpacity(0.85),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 25,
                        offset: const Offset(0, 10),
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Welcome Back!",
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey.shade800,
                                    letterSpacing: -0.8,
                                    height: 1.1,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  "Track your expenses and grow your savings.",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.w500,
                                    height: 1.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppConstants.primaryColor.withOpacity(0.1),
                                  AppConstants.primaryColor.withOpacity(0.05),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Icon(
                              Icons.dashboard_rounded,
                              color: AppConstants.primaryColor,
                              size: 28,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Content sections with subtle animations
                const WalletSummary(),
                const SizedBox(height: 16),
                const SpendingChart(),
                const SizedBox(height: 16),
                const TransactionList(),
                const SizedBox(height: 16), // Extra space for FAB
              ],
            ),
          ),
        ],
      ),
    );
  }
}

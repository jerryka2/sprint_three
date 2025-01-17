import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:third_sp/features/auth/presentation/view/login_view.dart';
import 'package:third_sp/features/onboarding/presentation/view/onboard_data.dart';
import 'package:third_sp/features/onboarding/presentation/view/onboard_page.dart';
import 'package:third_sp/features/onboarding/presentation/view_model/cubit/onboard_screen_cubit.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController; // PageController for managing pages

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose(); // Dispose PageController to avoid memory leaks
    super.dispose();
  }

  void _navigateToLogin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(), // Navigate to LoginPage
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              // PageView
              Expanded(
                child: BlocBuilder<OnboardingCubit, int>(
                  builder: (context, currentIndex) {
                    return PageView.builder(
                      controller: _pageController,
                      onPageChanged: (index) => context
                          .read<OnboardingCubit>()
                          .updatePageIndex(index),
                      itemCount: onboardingData.length,
                      itemBuilder: (context, index) {
                        final data = onboardingData[index];
                        return OnboardingPage(
                          image: data['image']!,
                          title: data['title']!,
                          description: data['description']!,
                        );
                      },
                    );
                  },
                ),
              ),

              // Pagination Indicator
              BlocBuilder<OnboardingCubit, int>(
                builder: (context, currentIndex) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(onboardingData.length, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: currentIndex == index
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      );
                    }),
                  );
                },
              ),

              // Navigation Buttons
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => _navigateToLogin(context),
                      child: Text(
                        'Skip',
                        style: TextStyle(color: Theme.of(context).hintColor),
                      ),
                    ),
                    BlocBuilder<OnboardingCubit, int>(
                      builder: (context, currentIndex) {
                        return ElevatedButton(
                          onPressed: () {
                            if (currentIndex == onboardingData.length - 1) {
                              // Navigate to LoginPage on Get Started
                              _navigateToLogin(context);
                            } else {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                          ),
                          child: Text(
                            currentIndex == onboardingData.length - 1
                                ? 'Get Started'
                                : 'Next',
                            style: const TextStyle(color: Colors.white),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

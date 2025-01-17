import 'package:flutter/material.dart';
import 'package:third_sp/features/onboarding/presentation/view/onboard_page.dart';

class OnboardingFlow extends StatefulWidget {
  const OnboardingFlow({super.key});

  @override
  State<OnboardingFlow> createState() => _OnboardingFlowState();
}

class _OnboardingFlowState extends State<OnboardingFlow> {
  final PageController _controller = PageController();
  final List<Map<String, String>> _onboardingData = [
    {
      'image': 'assets/images/Onboard_image.png',
      'title': 'Locate Stations Nearby',
      'description': 'Find EV charging stations closest to your location.',
    },
    {
      'image': 'assets/images/Onboard_image1.png',
      'title': 'Easy Payments for Your EV',
      'description': 'Secure and hassle-free payment options.',
    },
    {
      'image': 'assets/images/image_2.png',
      'title': 'Welcome to Energize Nepal',
      'description': 'Your one-stop solution for EV charging needs.',
    },
  ];

  int _currentPage = 0;

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      onPageChanged: (index) {
        setState(() {
          _currentPage = index;
        });
      },
      itemCount: _onboardingData.length,
      itemBuilder: (context, index) {
        final data = _onboardingData[index];
        return OnboardingPage(
          image: data['image']!,
          title: data['title']!,
          description: data['description']!,
          onBack: index > 0
              ? _goToPreviousPage
              : null, // Enable back button only for pages after the first
        );
      },
    );
  }
}

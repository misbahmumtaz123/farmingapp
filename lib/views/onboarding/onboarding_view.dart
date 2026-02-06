import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:farmingapp/app_routes/paths.dart';
import 'onboarding_provider.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  final List<Map<String, String>> onboardingData = const [
    {
      'title': 'Welcome to Farming App',
      'description':
          'Buy quality seeds, fertilizers, fruits, and farm essentials all in one place.',
    },
    {
      'title': 'Everything for Your Crops',
      'description':
          'From crop utilities to fresh farm products, find everything easily and quickly.',
    },
    {
      'title': 'Fresh & Trusted Products',
      'description':
          'Get fresh fruits and trusted farming products delivered to your doorstep.',
    },
  ];

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_animationController);

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, .25),
      end: Offset.zero,
    ).animate(_animationController);

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OnboardingProvider(),
      child: Consumer<OnboardingProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  // ===== PAGE VIEW =====
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: onboardingData.length,
                      onPageChanged: (index) {
                        provider.updatePage(index);
                        _animationController.reset();
                        _animationController.forward();
                      },
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(24),
                          child: FadeTransition(
                            opacity: _fadeAnimation,
                            child: SlideTransition(
                              position: _slideAnimation,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.agriculture,
                                    size: 120,
                                    color: Color(0xFF1B5E20),
                                  ),

                                  const SizedBox(height: 40),

                                  Text(
                                    onboardingData[index]['title']!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 16),

                                  Text(
                                    onboardingData[index]['description']!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // ===== INDICATOR + BUTTON =====
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 20,
                    ),
                    child: Row(
                      children: [
                        Row(
                          children: List.generate(
                            onboardingData.length,
                            (index) =>
                                _buildIndicator(index == provider.currentPage),
                          ),
                        ),

                        const Spacer(),

                        GestureDetector(
                          onTap: () {
                            if (provider.currentPage ==
                                onboardingData.length - 1) {
                              context.go(RoutePaths.login);
                            } else {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF1B5E20),
                            ),
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: 6),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF1B5E20) : Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

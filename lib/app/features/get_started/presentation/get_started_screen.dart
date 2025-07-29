import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hail/app/core/shared/button.dart';
import 'package:hail/app/core/theme/gen/assets.gen.dart';
import 'package:hail/app/core/theme/gen/colors.gen.dart';

@RoutePage()
class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      'image': 'assets/images/phone_cutout.png',
      'title': 'Welcome to Hail - Your journey your way',
      'subtitle':
          "Get ready to enjoy hassle-free transportation. We've got everything you need to travel with ease. Let's get started.",
    },
    {
      'image': 'assets/images/phone-cut-out-2.png',
      'title': 'Choose Your Ride - Tailored to Your Needs',
      'subtitle': 'Select your preferred mode of transportation -- keke, bike, danfo, or car -- and order a ride with just a few taps',
    },
    {
      'image': 'assets/images/phone-cut-out-3.png',
      'title': 'Secure Payments & Seamless Transactions',
      'subtitle': 'Say hello to convenience payments. Pay for your ride securely using PayStack, Google Pay, Apple Pay, Flutterwave, bank transfer, and or cash',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.primary,
      body: Stack(
        children: [
          SafeArea(child: Image.asset(_pages[_currentPage]['image']!)),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(20),
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.5,
              decoration: BoxDecoration(color: ColorName.lightBackground),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (index) => setState(() => _currentPage = index),
                      itemCount: _pages.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Text(
                              _pages[index]['title']!,
                              style: Theme.of(
                                context,
                              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              _pages[index]['subtitle']!,
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium?.copyWith(color: ColorName.grayDarkmode),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _pages.length,
                      (dotIndex) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPage == dotIndex ? ColorName.primary : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Button(
                    label: "Get Started",
                    onPressed: () => context.router.replacePath('/login'),
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

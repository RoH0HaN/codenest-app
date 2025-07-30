import 'package:codenest/core/constants/colors.dart';
import 'package:codenest/routes/route_names.dart';
import 'package:codenest/shared/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  bool _showButton = false;
  late AnimationController _slideController;
  late Animation<Offset> _offsetAnimation;

  final greetings = [
    "Hello",
    "नमस्ते",
    "নমস্কার",
    "Hola",
    "Bonjour",
    "Ciao",
    "こんにちは",
    "안녕하세요",
    "مرحبا",
  ];

  final messages = [
    'Welcome to CodeNest.',
    'From notes to blogs, all in one place.',
    'Track your journey. One topic at a time.',
    'Start now. The future\'s waiting.',
  ];

  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(-1.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOut,
    ));
  }

  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }

  void _revealButton() {
    setState(() {
      _showButton = true;
    });
    _slideController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            // Center greeting animation
            Center(
              child: DefaultTextStyle(
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 42,
                    ),
                child: AnimatedTextKit(
                  animatedTexts: greetings
                      .map((greet) => FadeAnimatedText(
                            greet,
                            duration: const Duration(seconds: 2),
                          ))
                      .toList(),
                  repeatForever: true,
                  isRepeatingAnimation: true,
                ),
              ),
            ),

            // Bottom Text or Button
            if (!_showButton) ...[
              Positioned(
                bottom: 20,
                width: MediaQuery.of(context).size.width,
                child: DefaultTextStyle(
                  style: Theme.of(context).textTheme.headlineLarge!,
                  child: AnimatedTextKit(
                    animatedTexts: messages
                        .map(
                          (message) => TypewriterAnimatedText(
                            message,
                            textAlign: TextAlign.center,
                            speed: const Duration(milliseconds: 100),
                          ),
                        )
                        .toList(),
                    repeatForever: false,
                    isRepeatingAnimation: false,
                    onFinished: _revealButton,
                  ),
                ),
              ),
            ] else ...[
              Positioned(
                bottom: 20,
                width: MediaQuery.of(context).size.width,
                child: SlideTransition(
                  position: _offsetAnimation,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: TextButton.icon(
                      onPressed: () async {
                        final box = GetStorage();
                        await box.write("onboardingSeenKey", true);
                        Get.offAllNamed(RouteNames.login);
                      },
                      icon: const Icon(Icons.arrow_forward_rounded),
                      label: const Text("Get Started"),
                      style: TextButton.styleFrom(
                        foregroundColor:
                            Get.find<ThemeController>().currentThemeMode ==
                                    ThemeMode.dark
                                ? AppColors.fontDark
                                : AppColors.fontLight,
                        textStyle: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

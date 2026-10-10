import 'package:expenzia/utils/appcolors.dart';
import 'package:expenzia/view/dashboard.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            height: MediaQuery.heightOf(context) * 0.7,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('back.png')),
            ),
            child: Image.asset('man.png', scale: 1),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Spend Smarter',
              style: TextStyle(
                color: const Color.fromRGBO(63, 135, 130, 1),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Save More',
              style: TextStyle(
                color: const Color.fromRGBO(63, 135, 130, 1),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard()),
                  (route) => false,
                );
              },
              child: Container(
                width: double.infinity,
                height: kBottomNavigationBarHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: LinearGradient(
                    colors: [Appcolors.primary, Appcolors.secondary],
                  ),
                  boxShadow: [
                    BoxShadow(blurRadius: 10, color: Appcolors.primary),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
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

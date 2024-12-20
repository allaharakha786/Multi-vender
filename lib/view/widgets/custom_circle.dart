import 'package:flutter/material.dart';

class OnboardingDots extends StatelessWidget {
  final int currentIndex;

  OnboardingDots({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Row(
          children: [
            if (index > 0) // Add divider only between circles
              Container(
                height: 2,
                width: 20,
                color: (index == 0 || index == currentIndex)
                      ? Colors.amber
                      : Colors.grey
              ),
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: (index == 0 || index == currentIndex)
                      ? Colors.amber
                      : Colors.grey,
                  width: 2,
                ), // Highlight circle for index 0 and currentIndex
              ),
              child: Center(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: 12.0,
                  width: 12.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (index == 0 || index == currentIndex)
                        ? Colors.amber
                        : Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

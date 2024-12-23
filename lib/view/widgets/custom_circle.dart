import 'package:flutter/material.dart';

class OnboardingDots extends StatelessWidget {
  final int currentIndex;

  OnboardingDots({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        // Determine if the index is less than or equal to the currentIndex
        bool isActive = index <= currentIndex;

        return Row(
          children: [
            if (index > 0) // Add divider only between circles
              Container(
                height: 2,
                width: 20,
                color: isActive ? Colors.amber : Colors.black.withOpacity(0.07),
              ),
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isActive ? Colors.amber : Colors.black.withOpacity(0.07),
                  width: 2,
                ), // Highlight circle for active indices
              ),
              child: Center(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: 12.0,
                  width: 12.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isActive ? Colors.amber : Colors.black.withOpacity(0.07),
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




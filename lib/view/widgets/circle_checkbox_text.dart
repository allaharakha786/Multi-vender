import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircleCheckBox extends StatelessWidget {
  final String text; // The text to display next to the checkbox
  final RxBool isChecked; // Reactive state for checkbox
  final ValueChanged<bool>? onChanged; // Callback for checkbox state change

  CircleCheckBox({
    Key? key,
    required this.text,
    required this.isChecked, // Pass the state as a parameter
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            isChecked.value = !isChecked.value; // Toggle the checked state
            if (onChanged != null) {
              onChanged!(isChecked.value); // Notify parent widget
            }
          },
          child: Obx(
            () => Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isChecked.value ? Color(0xff115740) : Colors.transparent,
                border: Border.all(color: Colors.black.withOpacity(0.07), width: 2),
              ),
              child: isChecked.value
                  ? Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 18,
                    )
                  : null, // Show check mark if checked
            ),
          ),
        ),
        SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class CircleCheckBox extends StatefulWidget {
  final String text; // The text to display next to the checkbox
  final Function(bool)? onChanged; // Callback for checkbox state change

  CircleCheckBox({required this.text, this.onChanged});

  @override
  _CircleCheckBoxState createState() => _CircleCheckBoxState();
}

class _CircleCheckBoxState extends State<CircleCheckBox> {
  bool isChecked = false; // Track the state of the circle (checked/unchecked)

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isChecked = !isChecked; // Toggle the checked state
              if (widget.onChanged != null) {
                widget.onChanged!(isChecked); // Notify parent widget
              }
            });
          },
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isChecked ? Color(0xff115740) : Colors.transparent,
              border: Border.all(color: Colors.black.withOpacity(0.07), width: 2),
            ),
            child: isChecked
                ? Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 18,
                  )
                : null, // Show check mark if checked
          ),
        ),
        SizedBox(width: 10),
        Text(
          widget.text,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

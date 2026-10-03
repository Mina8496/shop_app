import 'package:flutter/material.dart';

/// Checkbox مع نص (مثل: تذكرني / أوافق على الشروط)
class CustomCheckboxTile extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Widget title;

  const CustomCheckboxTile({
    super.key,
    required this.value,
    required this.onChanged,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      borderRadius: BorderRadius.circular(8),
      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged: (v) => onChanged(v ?? false),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Expanded(child: title),
        ],
      ),
    );
  }
}

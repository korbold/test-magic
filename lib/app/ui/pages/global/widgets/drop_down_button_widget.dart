import 'package:flutter/material.dart';

class DropDownButtonWidget extends StatelessWidget {
  final List<DropdownMenuItem<dynamic>> items;
  final dynamic dropdownValue;
  final Function(dynamic)? onChanged;
  const DropDownButtonWidget({
    super.key,
    required this.items,
    required this.dropdownValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color.fromRGBO(249, 249, 249, 1)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<dynamic>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 24,
          elevation: 16,
          isExpanded: true,
          onChanged: onChanged,
          items: items,
        ),
      ),
    );
  }
}

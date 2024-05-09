import 'package:flutter/material.dart';
import 'package:test_r/app/ui/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    this.onTap,
    this.icon,
    this.color,
    this.fontSizeText = 12,
  });

  final String label;
  final VoidCallback? onTap;
  final IconData? icon;
  final Color? color;
  final double? fontSizeText;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FilledButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? AppColors.blueColorButton,
        minimumSize: Size(size.width, 50),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      onPressed: onTap,
      child: icon != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon),
                const SizedBox(width: 10),
                Text(label),
              ],
            )
          : Text(
              label,
              style: TextStyle(fontSize: fontSizeText, color: AppColors.lightColor),
            ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String? hintText;
  final String labelText;
  final TextEditingController? controller;
  final IconButton? suffixIcon;
  final bool obscureText;
  final Function(String)? onChanged;
  final String? errorText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool? enabled;

  const TextFormFieldWidget({
    super.key,
    this.hintText,
    this.controller,
    required this.labelText,
    this.suffixIcon,
    this.obscureText = false,
    this.onChanged,
    this.errorText,
    this.inputFormatters,
    this.keyboardType,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide.none, // Sin color en los bordes
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, textAlign: TextAlign.start, style: Theme.of(context).textTheme.labelSmall),
        TextFormField(
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          obscureText: obscureText,
          controller: controller,
          onChanged: onChanged,
          enabled: enabled,
          decoration: InputDecoration(
            errorText: errorText,
            hintText: hintText,
            fillColor: Theme.of(context).colorScheme.secondary, // Fondo gris
            filled: true, // Habilitar el color de fondo
            suffixIcon: suffixIcon,
            enabledBorder: border,
            border: border,
            // También puedes personalizar la apariencia del borde al enfocar el campo
            focusedBorder: border.copyWith(borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)),
            // Y cuando el campo está desactivado
            disabledBorder: border,
            // Y cuando el campo está interactuando (por ejemplo, validación)
            errorBorder: border.copyWith(borderSide: BorderSide(color: Theme.of(context).colorScheme.error)),
            focusedErrorBorder: border.copyWith(borderSide: BorderSide(color: Theme.of(context).colorScheme.error)),
            focusColor: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}

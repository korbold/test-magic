import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MainState extends Equatable {
  final TextEditingController? emailController;
  final TextEditingController? nameController;
  final TextEditingController? surnameController;
  final String? testDate;
  final bool? isSpanish;

  MainState({
    TextEditingController? emailController,
    TextEditingController? nameController,
    TextEditingController? surnameController,
    this.testDate = "",
    this.isSpanish = true,
  })  : emailController = emailController ?? TextEditingController(text: ''),
        nameController = nameController ?? TextEditingController(text: ''),
        surnameController = surnameController ?? TextEditingController(text: '');

  MainState copyWith({
    TextEditingController? emailController,
    TextEditingController? nameController,
    TextEditingController? surnameController,
    String? testDate,
    bool? isSpanish,
  }) {
    return MainState(
      emailController: emailController ?? this.emailController,
      nameController: nameController ?? this.nameController,
      surnameController: surnameController ?? this.surnameController,
      testDate: testDate ?? this.testDate,
      isSpanish: isSpanish ?? this.isSpanish,
    );
  }

  @override
  List<Object?> get props => [emailController, nameController, surnameController, testDate, isSpanish];
}

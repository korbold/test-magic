import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:test_r/app/ui/pages/main/providers/register_form_state.dart';

import '../../global/inputs/index.dart';

final registerFormStateProvider = StateNotifierProvider<RegisterFormStateProvider, RegisterFormState>((_) {
  return RegisterFormStateProvider();
});

class RegisterFormStateProvider extends StateNotifier<RegisterFormState> {
  RegisterFormStateProvider() : super(const RegisterFormState());

  void setEmailChanged(String value) {
    final email = Email.dirty(value);
    state = state.copyWith(
        email: email,
        form1Status: Formz.validate([
          email,
          state.name,
          state.surname,
        ]));
  }

  void setNameChanged(String value) {
    final name = Name.dirty(value);
    state = state.copyWith(
        name: name,
        form1Status: Formz.validate([
          name,
          state.email,
          state.surname,
        ]));
  }

  void setSurnameChanged(String value) {
    final surname = LastName.dirty(value);
    state = state.copyWith(
        surname: surname,
        form1Status: Formz.validate([
          surname,
          state.name,
          state.email,
        ]));
  }

  void validateForm1() {
    state = state.copyWith(
        form1Status: Formz.validate([
      state.email,
      state.name,
      state.surname,
    ]));
  }

  void clear() {
    state = const RegisterFormState();
  }
}

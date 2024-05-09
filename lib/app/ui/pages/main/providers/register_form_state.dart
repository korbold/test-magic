import 'package:equatable/equatable.dart';
import 'package:test_r/app/ui/pages/global/inputs/email.dart';
import 'package:test_r/app/ui/pages/global/inputs/lastName.dart';
import 'package:test_r/app/ui/pages/global/inputs/name.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  final Name name;
  final LastName surname;
  final Email email;

  final bool form1Status;
  final bool valid;

  const RegisterFormState({
    this.name = const Name.pure(),
    this.surname = const LastName.pure(),
    this.email = const Email.pure(),
    this.form1Status = false,
    this.valid = false,
  });

  RegisterFormState copyWith({
    Name? name,
    LastName? surname,
    Email? email,
    bool? form1Status,
    bool? valid,
  }) {
    return RegisterFormState(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      email: email ?? this.email,
      form1Status: form1Status ?? this.form1Status,
      valid: valid ?? this.valid,
    );
  }

  @override
  List<Object?> get props => [
        name,
        surname,
        email,
        form1Status,
        valid,
      ];
}

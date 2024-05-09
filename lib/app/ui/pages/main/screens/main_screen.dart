import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:test_r/app/ui/pages/card_list/screens/card_list_screen.dart';
import 'package:test_r/app/ui/pages/global/widgets/custom_button.dart';
import 'package:test_r/app/ui/pages/global/widgets/text_form_field_widget.dart';
import 'package:test_r/app/ui/pages/main/providers/main_provider.dart';
import 'package:test_r/app/ui/pages/main/providers/register_form_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});
  static const String routeName = 'main';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainState = ref.watch(mainProvider);
    final registerFormState = ref.watch(registerFormStateProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            TextFormFieldWidget(
              labelText: AppLocalizations.of(context)!.name,
              controller: mainState.nameController,
              inputFormatters: [UpperCaseTextFormatter()],
              onChanged: ref.read(registerFormStateProvider.notifier).setNameChanged,
              errorText: registerFormState.name.errorMessage,
            ),
            TextFormFieldWidget(
              labelText: AppLocalizations.of(context)!.surname,
              controller: mainState.surnameController,
              inputFormatters: [UpperCaseTextFormatter()],
              onChanged: ref.read(registerFormStateProvider.notifier).setSurnameChanged,
              errorText: registerFormState.surname.errorMessage,
            ),
            TextFormFieldWidget(
              labelText: AppLocalizations.of(context)!.email,
              controller: mainState.emailController,
              onChanged: ref.read(registerFormStateProvider.notifier).setEmailChanged,
              errorText: registerFormState.email.errorMessage,
            ),
            TextFormFieldWidget(
              labelText: AppLocalizations.of(context)!.test_date,
              controller: TextEditingController(text: mainState.testDate),
              enabled: false,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(AppLocalizations.of(context)!.english),
                Switch(
                  value: mainState.isSpanish!,
                  onChanged: (value) {
                    ref.read(mainProvider.notifier).setLanguage(value);
                  },
                  inactiveThumbColor: Colors.grey, // Color del botón cuando está inactivo
                  inactiveTrackColor: const Color.fromARGB(255, 30, 33, 36), // Color de la pista cuando está inactiva
                  activeColor: Theme.of(context).colorScheme.secondary, // Color del botón cuando está activo
                ),
                Text(AppLocalizations.of(context)!.spanish),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 40, top: 20),
        child: CustomButton(
            label: AppLocalizations.of(context)!.accept,
            onTap: () {
              ref.read(registerFormStateProvider.notifier).validateForm1();
              if (!registerFormState.form1Status) {
                MotionToast.warning(
                  title: Text(AppLocalizations.of(context)!.attention),
                  description: Text(AppLocalizations.of(context)!.please_fill),
                ).show(context);
                return;
              }
              context.pushNamed(CardListScreen.routeName);
            },
            color: Theme.of(context).primaryColor,
            fontSizeText: 16),
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

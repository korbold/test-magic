import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:test_r/app/ui/pages/main/providers/main_state.dart';

final mainProvider = StateNotifierProvider<MainProvider, MainState>((ref) {
  return MainProvider();
});

class MainProvider extends StateNotifier<MainState> {
  MainProvider() : super(MainState(testDate: DateFormat('dd/MM/yyyy').format(DateTime.now())));

  void setLanguage(bool value) {
    state = state.copyWith(isSpanish: value);
  }
}

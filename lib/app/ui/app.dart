import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_r/app/ui/pages/main/providers/main_provider.dart';
import 'package:test_r/app/ui/routes/app_routes.dart';
import 'package:test_r/app/ui/theme/custom_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';

class AppPrincipal extends ConsumerWidget {
  const AppPrincipal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    final isSpanish = ref.watch(mainProvider).isSpanish;
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter,
      title: 'Test R',
      theme: CustomTheme.light(),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: isSpanish! ? const Locale('es') : const Locale('en'),
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
      ],
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:test_r/app/ui/pages/card_list/providers/card_list_provider.dart';
import 'package:test_r/app/ui/pages/card_list/screens/card_details_screen.dart';
import 'package:test_r/app/ui/pages/global/widgets/app_bar_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:test_r/app/ui/pages/main/providers/main_provider.dart';

class CardListScreen extends ConsumerWidget {
  const CardListScreen({super.key});
  static const String routeName = 'card_list';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardListState = ref.watch(cardListProvider);
    final mainState = ref.watch(mainProvider);
    return Scaffold(
        appBar: App_bar_widget(context, title: "${AppLocalizations.of(context)!.hello}, ${mainState.nameController!.text} | ${mainState.testDate}"),
        body: cardListState.cardList == null
            ? Center(
                heightFactor: 15,
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ))
            : RefreshIndicator(
                onRefresh: () async {
                  ref.read(cardListProvider.notifier).getList();
                },
                child: ListView.builder(
                  itemCount: cardListState.cardList!.length,
                  itemBuilder: (context, index) {
                    final item = cardListState.cardList![index];
                    return Card(
                      elevation: 2,
                      child: ListTile(
                        leading: CachedNetworkImage(
                          imageUrl: item.imageUrl ?? "null",
                          placeholder: (context, url) => SizedBox(
                            width: 40,
                            child: LoadingAnimationWidget.threeRotatingDots(
                              color: Theme.of(context).colorScheme.primary,
                              size: 20,
                            ),
                          ),
                          errorWidget: (context, url, error) => const SizedBox(width: 40, child: Icon(Icons.error)),
                        ),
                        trailing: item.foreignNames!.isEmpty ? const SizedBox() : const Icon(Icons.arrow_forward_ios),
                        title: Text(item.name!),
                        subtitle: Text(item.artist!),
                        onTap: () {
                          if (item.foreignNames == null || item.foreignNames!.isEmpty) {
                            MotionToast.warning(
                              title: Text(AppLocalizations.of(context)!.attention),
                              description: Text(AppLocalizations.of(context)!.no_data),
                            ).show(context);
                            return;
                          } else {
                            ref.read(cardListProvider.notifier).selectCard(item.foreignNames!);
                            context.pushNamed(CardDetailsScreen.routeName);
                          }
                        },
                      ),
                    );
                  },
                ),
              ));
  }
}

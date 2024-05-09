import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:test_r/app/ui/pages/card_list/providers/card_list_provider.dart';
import 'package:test_r/app/ui/pages/global/widgets/app_bar_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CardDetailsScreen extends ConsumerWidget {
  const CardDetailsScreen({super.key});
  static const String routeName = 'card_details';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foreignState = ref.watch(cardListProvider);
    final data = foreignState.foreignName;
    return Scaffold(
        appBar: App_bar_widget(context, title: AppLocalizations.of(context)!.detail),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: data!.length,
            itemBuilder: (context, index) {
              final item = data[index];
              return Card(
                child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
                  const SizedBox(height: 10),
                  Center(
                    child: CachedNetworkImage(
                      imageUrl: item.imageUrl ?? "https://via.placeholder.com/300x300",
                      height: 300,
                      width: 300,
                      placeholder: (context, url) => LoadingAnimationWidget.threeRotatingDots(
                        color: Theme.of(context).colorScheme.secondary,
                        size: 200,
                      ),
                      errorWidget: (context, url, error) => const SizedBox(width: 40, child: Icon(Icons.error)),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 252, 210, 131),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.language ?? "N/A",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            item.text ?? "N/A",
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.normal),
                          ),
                          const SizedBox(height: 5),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  text: "${AppLocalizations.of(context)!.type}: ",
                                ),
                                TextSpan(
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.normal),
                                  text: item.type ?? "N/A",
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  text: "${AppLocalizations.of(context)!.multiverseid}: ",
                                ),
                                TextSpan(
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.normal),
                                  text: item.multiverseid.toString(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ))
                ]),
              );
            },
          ),
        ));
  }
}

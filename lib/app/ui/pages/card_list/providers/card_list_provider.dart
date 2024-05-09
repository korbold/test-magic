import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:test_r/app/domain/entities/gathering_entity.dart';
import 'package:test_r/app/domain/usecases/get_list.dart';
import 'package:test_r/app/ui/pages/card_list/providers/card_list_state.dart';
import 'package:test_r/core/resources/data_state.dart';

final cardListProvider = StateNotifierProvider<CardListProvider, CardListState>((ref) {
  return CardListProvider();
});

class CardListProvider extends StateNotifier<CardListState> {
  CardListProvider() : super(const CardListState()) {
    getList();
  }

  final _getList = GetIt.I.get<GetList>();

  Future<void> getList() async {
    final result = await _getList();
    debugPrint("result: $result");
    if (result is DataSuccess) {
      state = state.copyWith(cardList: result.data);
    } else if (result is DataFailed) {
      state = state.copyWith(cardList: []);
    } else {
      state = state.copyWith(cardList: null);
    }
  }

  void selectCard(List<ForeignName> card) {
    state = state.copyWith(foreignName: card);
  }
}

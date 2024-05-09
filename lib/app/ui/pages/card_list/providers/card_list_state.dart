import 'package:equatable/equatable.dart';
import 'package:test_r/app/domain/entities/gathering_entity.dart';

class CardListState extends Equatable {
  final List<GatheringEntity>? cardList;
  final List<ForeignName>? foreignName;

  const CardListState({
    this.cardList,
    this.foreignName,
  });

  CardListState copyWith({List<GatheringEntity>? cardList, List<ForeignName>? foreignName}) {
    return CardListState(
      cardList: cardList ?? this.cardList,
      foreignName: foreignName ?? this.foreignName,
    );
  }

  @override
  List<Object?> get props => [cardList, foreignName];
}

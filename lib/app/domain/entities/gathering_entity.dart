import 'package:equatable/equatable.dart';

class GatheringEntity extends Equatable {
  final String? name;
  final String? manaCost;
  final double? cmc;
  final List<String>? colors;
  final List<String>? colorIdentity;
  final String? type;
  final List<String>? types;
  final List<String>? subtypes;
  final String? rarity;
  final String? gatheringModelSet;
  final String? setName;
  final String? text;
  final String? artist;
  final String? number;
  final String? power;
  final String? toughness;
  final String? layout;
  final String? multiverseid;
  final String? imageUrl;
  final List<String>? variations;
  final List<ForeignName>? foreignNames;
  final List<String>? printings;
  final String? originalText;
  final String? originalType;
  final List<LegalityElement>? legalities;
  final String? id;

  const GatheringEntity(
      {this.name,
      this.manaCost,
      this.cmc,
      this.colors,
      this.colorIdentity,
      this.type,
      this.types,
      this.subtypes,
      this.rarity,
      this.gatheringModelSet,
      this.setName,
      this.text,
      this.artist,
      this.number,
      this.power,
      this.toughness,
      this.layout,
      this.multiverseid,
      this.imageUrl,
      this.variations,
      this.foreignNames,
      this.printings,
      this.originalText,
      this.originalType,
      this.legalities,
      this.id});
  @override
  List<Object?> get props => [
        name,
        manaCost,
        cmc,
        colors,
        colorIdentity,
        type,
        types,
        subtypes,
        rarity,
        gatheringModelSet,
        setName,
        text,
        artist,
        number,
        power,
        toughness,
        layout,
        multiverseid,
        imageUrl,
        variations,
        foreignNames,
        printings,
        originalText,
        originalType,
        legalities,
        id,
      ];
}

class ForeignName extends Equatable {
  final String? name;
  final String? text;
  final String? type;
  final String? flavor;
  final String? imageUrl;
  final String? language;
  final int? multiverseid;

  const ForeignName({
    this.name,
    this.text,
    this.type,
    this.flavor,
    this.imageUrl,
    this.language,
    this.multiverseid,
  });

  @override
  List<Object?> get props => [name, text, type, flavor, imageUrl, language, multiverseid];
}

// ignore: constant_identifier_names
enum LegalityEnum { LEGAL, RESTRICTED }

class LegalityElement extends Equatable {
  final String? format;

  const LegalityElement({
    this.format,
  });

  @override
  List<Object?> get props => [format];
}

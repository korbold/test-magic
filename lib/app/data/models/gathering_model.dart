import 'dart:convert';

import 'package:test_r/app/domain/entities/gathering_entity.dart';

GatheringModel gatheringModelFromJson(String str) => GatheringModel.fromJson(json.decode(str));

class GatheringModel extends GatheringEntity {
  const GatheringModel({
    super.name,
    super.manaCost,
    super.cmc,
    super.colors,
    super.colorIdentity,
    super.type,
    super.types,
    super.subtypes,
    super.rarity,
    super.gatheringModelSet,
    super.setName,
    super.text,
    super.artist,
    super.number,
    super.power,
    super.toughness,
    super.layout,
    super.multiverseid,
    super.imageUrl,
    super.variations,
    super.foreignNames,
    super.printings,
    super.originalText,
    super.originalType,
    super.legalities,
    super.id,
  });

  factory GatheringModel.fromJson(Map<String, dynamic> json) => GatheringModel(
        name: json["name"],
        manaCost: json["manaCost"],
        cmc: json["cmc"],
        colors: json["colors"] != null ? List<String>.from(json["colors"].map((x) => x)) : [],
        colorIdentity: json["colorIdentity"] != null ? List<String>.from(json["colorIdentity"].map((x) => x)) : [],
        type: json["type"],
        types: json["types"] != null ? List<String>.from(json["types"].map((x) => x)) : [],
        subtypes: json["subtypes"] != null ? List<String>.from(json["subtypes"].map((x) => x)) : [],
        rarity: json["rarity"],
        gatheringModelSet: json["set"],
        setName: json["setName"],
        text: json["text"],
        artist: json["artist"],
        number: json["number"],
        power: json["power"],
        toughness: json["toughness"],
        layout: json["layout"],
        multiverseid: json["multiverseid"],
        imageUrl: json["imageUrl"],
        variations: json["variations"] != null ? List<String>.from(json["variations"].map((x) => x)) : [],
        foreignNames: json["foreignNames"] != null ? List<ForeignNameModel>.from(json["foreignNames"].map((x) => ForeignNameModel.fromJson(x))) : [],
        printings: List<String>.from(json["printings"].map((x) => x)),
        originalText: json["originalText"],
        originalType: json["originalType"],
        legalities: json["legalities"] != null ? List<LegalityElementModel>.from(json["legalities"].map((x) => LegalityElementModel.fromJson(x))) : [],
        id: json["id"],
      );
}

class ForeignNameModel extends ForeignName {
  const ForeignNameModel({
    super.name,
    super.text,
    super.type,
    super.flavor,
    super.imageUrl,
    super.language,
    super.multiverseid,
  });

  factory ForeignNameModel.fromJson(Map<String, dynamic> json) => ForeignNameModel(
        name: json["name"],
        text: json["text"],
        type: json["type"],
        flavor: json["flavor"],
        imageUrl: json["imageUrl"],
        language: json["language"],
        multiverseid: json["multiverseid"],
      );
}

class LegalityElementModel extends LegalityElement {
  const LegalityElementModel({
    super.format,
  });

  factory LegalityElementModel.fromJson(Map<String, dynamic> json) => LegalityElementModel(
        format: json["format"],
      );
}

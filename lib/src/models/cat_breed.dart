import 'weight.dart';
import 'cat_image.dart';

class CatBreed {
  final Weight weight;
  final String id;
  final String name;
  final String? cfaUrl;
  final String? vetstreetUrl;
  final String? vcahospitalsUrl;
  final String temperament;
  final String origin;
  final String countryCodes;
  final String countryCode;
  final String description;
  final String lifeSpan;
  final int indoor;
  final int? lap;
  final String? altNames;
  final int adaptability;
  final int affectionLevel;
  final int childFriendly;
  final int dogFriendly;
  final int energyLevel;
  final int grooming;
  final int healthIssues;
  final int intelligence;
  final int sheddingLevel;
  final int socialNeeds;
  final int strangerFriendly;
  final int vocalisation;
  final int experimental;
  final int hairless;
  final int natural;
  final int rare;
  final int rex;
  final int suppressedTail;
  final int shortLegs;
  final String? wikipediaUrl;
  final int hypoallergenic;
  final String? referenceImageId;
  final CatImage? image;
  final int? catFriendly;
  final int? bidability;

  CatBreed({
    required this.weight,
    required this.id,
    required this.name,
    this.cfaUrl,
    this.vetstreetUrl,
    this.vcahospitalsUrl,
    required this.temperament,
    required this.origin,
    required this.countryCodes,
    required this.countryCode,
    required this.description,
    required this.lifeSpan,
    required this.indoor,
    this.lap,
    this.altNames,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.intelligence,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.vocalisation,
    required this.experimental,
    required this.hairless,
    required this.natural,
    required this.rare,
    required this.rex,
    required this.suppressedTail,
    required this.shortLegs,
    this.wikipediaUrl,
    required this.hypoallergenic,
    this.referenceImageId,
    this.image,
    this.catFriendly,
    this.bidability,
  });

  Map<String, dynamic> toJson() {
    return {
      'weight': weight,
      'id': id,
      'name': name,
      'cfaUrl': cfaUrl,
      'vetstreetUrl': vetstreetUrl,
      'vcahospitalsUrl': vcahospitalsUrl,
      'temperament': temperament,
      'origin': origin,
      'countryCodes': countryCodes,
      'countryCode': countryCode,
      'description': description,
      'lifeSpan': lifeSpan,
      'indoor': indoor,
      'lap': lap,
      'altNames': altNames,
      'adaptability': adaptability,
      'affectionLevel': affectionLevel,
      'childFriendly': childFriendly,
      'dogFriendly': dogFriendly,
      'energyLevel': energyLevel,
      'grooming': grooming,
      'healthIssues': healthIssues,
      'intelligence': intelligence,
      'sheddingLevel': sheddingLevel,
      'socialNeeds': socialNeeds,
      'strangerFriendly': strangerFriendly,
      'vocalisation': vocalisation,
      'experimental': experimental,
      'hairless': hairless,
      'natural': natural,
      'rare': rare,
      'rex': rex,
      'suppressedTail': suppressedTail,
      'shortLegs': shortLegs,
      'wikipediaUrl': wikipediaUrl,
      'hypoallergenic': hypoallergenic,
      'referenceImageId': referenceImageId,
      'image': image,
      'catFriendly': catFriendly,
      'bidability': bidability,
    };
  }

  factory CatBreed.fromJson(Map<String, dynamic> map) {
    return CatBreed(
      weight: Weight.fromJson(map['weight']),
      id: map['id'] as String,
      name: map['name'] as String,
      cfaUrl: map['cfa_url'],
      vetstreetUrl: map['vetstreet_url'],
      vcahospitalsUrl: map['vcahospitals_url'],
      temperament: map['temperament'] as String,
      origin: map['origin'] as String,
      countryCodes: map['country_codes'] as String,
      countryCode: map['country_code'] as String,
      description: map['description'] as String,
      lifeSpan: map['life_span'] as String,
      indoor: map['indoor'] as int,
      lap: map['lap'],
      altNames: map['alt_names'],
      adaptability: map['adaptability'] as int,
      affectionLevel: map['affection_level'] as int,
      childFriendly: map['child_friendly'] as int,
      dogFriendly: map['dog_friendly'] as int,
      energyLevel: map['energy_level'] as int,
      grooming: map['grooming'] as int,
      healthIssues: map['health_issues'] as int,
      intelligence: map['intelligence'] as int,
      sheddingLevel: map['shedding_level'] as int,
      socialNeeds: map['social_needs'] as int,
      strangerFriendly: map['stranger_friendly'] as int,
      vocalisation: map['vocalisation'] as int,
      experimental: map['experimental'] as int,
      hairless: map['hairless'] as int,
      natural: map['natural'] as int,
      rare: map['rare'] as int,
      rex: map['rex'] as int,
      suppressedTail: map['suppressed_tail'] as int,
      shortLegs: map['short_legs'] as int,
      wikipediaUrl: map['wikipedia_url'],
      hypoallergenic: map['hypoallergenic'] as int,
      referenceImageId: map['reference_image_id'],
      image: map['image'] != null ? CatImage.fromJson(map['image']) : null,
      catFriendly: map['cat_friendly'],
      bidability: map['bidability'],
    );
  }
}

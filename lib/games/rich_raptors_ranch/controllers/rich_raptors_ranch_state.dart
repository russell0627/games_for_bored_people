
import '../models/rrr_dinosaur.dart';

class RichRaptorsRanchState {
  final int money;
  final int herbivoreFood;
  final int carnivoreFood;
  final RRRDinosaur? dinosaurOnHomeScreen;
  final List<RRRDinosaur> triassicHerbivores;
  final List<RRRDinosaur> triassicCarnivores;
  final List<RRRDinosaur> triassicOmnivores;
  final List<RRRDinosaur> jurassicHerbivores;
  final List<RRRDinosaur> jurassicCarnivores;
  final List<RRRDinosaur> jurassicOmnivores;
  final List<RRRDinosaur> cretaceousHerbivores;
  final List<RRRDinosaur> cretaceousCarnivores;
  final List<RRRDinosaur> cretaceousOmnivores;
  RichRaptorsRanchState({
    required this.money,
    required this.herbivoreFood,
    required this.carnivoreFood,
    this.dinosaurOnHomeScreen,
    this.triassicHerbivores = const [],
    this.triassicCarnivores = const [],
    this.triassicOmnivores = const [],
    this.jurassicHerbivores = const [],
    this.jurassicCarnivores = const [],
    this.jurassicOmnivores = const [],
    this.cretaceousHerbivores = const [],
    this.cretaceousCarnivores = const [],
    this.cretaceousOmnivores = const [],
  });
}
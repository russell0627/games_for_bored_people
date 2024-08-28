import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../games/dexter_hill/adventure_to_dexter_hill/presentation/adventure_to_dexter_hill_page.dart';
import '../games/dexter_hill/cabin.dart';
import '../games/dexter_hill/dexter_hill.dart';
import '../games/extraterrestrial_extermination/extraterrestrial_extermination_page.dart';
import '../games/quizzez/data/pages/dinosaur/taxonomy_of_dinosaurs_page.dart';
import '../games/quizzez/data/pages/quiz_home.dart';
import '../games/quizzez/data/pages/quiz_length_page.dart';
import '../games/quizzez/data/pages/quiz_page.dart';
import '../games/quizzez/data/pages/stats_page.dart';
import '../games/ttt/presentation/ttt_page.dart';
import 'presentation/home_page.dart';
import 'presentation/not_found_page.dart';

part 'routes.g.dart';

enum AppRoute {
  home('/'),
  ttt,
  collectables,
  alienKiller,
  aTDH,
  aTDhEnd,
  aTDHPhotos,
  cabin,
  cabinInterior,
  puzzle,
  quizzez,
  quizLength,
  quiz,
  quizStats,
  taxonomyPage,
  tenThousand;

  final String? _path;

  String get path => _path ?? name;

  const AppRoute([this._path]);
}

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    debugLogDiagnostics: false,
    initialLocation: AppRoute.home.path,
    routes: [
      GoRoute(
        name: AppRoute.home.name,
        path: AppRoute.home.path,
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            name: AppRoute.ttt.name,
            path: AppRoute.ttt.path,
            builder: (context, state) => const TTTPage(),
          ),
          GoRoute(
            name: AppRoute.quizzez.name,
            path: AppRoute.quizzez.path,
            builder: (context, state) => const QuizzezHomePage(title: 'Quizzez'),
            routes: [
              GoRoute(
                name: AppRoute.quizLength.name,
                path: AppRoute.quizLength.path,
                builder: (context, state) => const QuizLengthPage(),
                routes: [
                  GoRoute(
                    name: AppRoute.quiz.name,
                    path: AppRoute.quiz.path,
                    builder: (context, state) => const QuizPage(),
                    routes: [
                      GoRoute(
                        name: AppRoute.quizStats.name,
                        path: AppRoute.quizStats.path,
                        builder: (context, state) => const QuizStatsPage(),
                      ),
                      GoRoute(
                        name: AppRoute.taxonomyPage.name,
                        path: AppRoute.taxonomyPage.path,
                        builder: (context, state) => const TypesOfDinosaursPage(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            name: AppRoute.aTDH.name,
            path: AppRoute.aTDH.path,
            builder: (context, state) => const AdventureToDexterHillPage(),
            routes: [
              GoRoute(
                name: AppRoute.aTDhEnd.name,
                path: AppRoute.aTDhEnd.path,
                builder: (context, state) => const EndOfGamePage(),
              ),
              GoRoute(
                name: AppRoute.aTDHPhotos.name,
                path: AppRoute.aTDHPhotos.path,
                builder: (context, state) => const PictureManagerPage(),
              ),
              GoRoute(
                  name: AppRoute.cabin.name,
                  path: AppRoute.cabin.path,
                  builder: (context, state) => const DexterHillCabinPage(),
                  routes: [
                    GoRoute(
                      name: AppRoute.cabinInterior.name,
                      path: AppRoute.cabinInterior.path,
                      builder: (context, state) => const DexterHillCabinInteriorPage(),
                    ),
                  ]),
            ],
          ),
          GoRoute(
            name: AppRoute.alienKiller.name,
            path: AppRoute.alienKiller.path,
            builder: (context, state) => const CircleTest(),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundPage(),
  );
}

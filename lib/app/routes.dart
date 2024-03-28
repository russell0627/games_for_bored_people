import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../games/brick_breaker/src/widgets/game_app.dart';
import '../games/dexter_hill/adventure_to_dexter_hill/presentation/adventure_to_dexter_hill_page.dart';
import '../games/dexter_hill/cabin.dart';
import '../games/dexter_hill/dexter_hill.dart';
import '../games/puzzle_game/presentation/puzzle_page.dart';
import '../games/quizzez/data/pages/quiz_home.dart';
import '../games/quizzez/data/pages/quiz_length_page.dart';
import '../games/quizzez/data/pages/quiz_page.dart';
import '../games/ttt/presentation/ttt_page.dart';
import 'presentation/home_page.dart';
import 'presentation/not_found_page.dart';

part 'routes.g.dart';

enum AppRoute {
  home('/'),
  ttt,
  aTDH,
  aTDhEnd,
  aTDHPhotos,
  cabin,
  cabinInterior,
  puzzle,
  quizzez,
  quizLength,
  quiz,
  brickBreaker;

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
                  ),

                ]
              ),

            ]
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

                ]
              ),
            ],
          ),
          GoRoute(
            name: AppRoute.puzzle.name,
            path: AppRoute.puzzle.path,
            builder: (context, state) => const PuzzlePage(),
          ),
          GoRoute(
            name: AppRoute.brickBreaker.name,
            path: AppRoute.brickBreaker.path,
            builder: (context, state) => const GameApp(),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundPage(),
  );
}

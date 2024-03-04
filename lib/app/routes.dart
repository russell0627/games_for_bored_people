import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../brick_breaker/src/widgets/game_app.dart';
import '../games/dexter_hill/adventure_to_dexter_hill/presentation/adventure_to_dexter_hill_page.dart';
import '../games/dexter_hill/dexter_hill.dart';
import '../games/puzzle_game/presentation/puzzle_page.dart';
import '../games/ttt/presentation/ttt_page.dart';
import 'presentation/home_page.dart';
import 'presentation/not_found_page.dart';

part 'routes.g.dart';

enum AppRoute {
  home('/'),
  ttt,
  aTDH,

  aTDhEnd,
  puzzle,


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
            name: AppRoute.aTDH.name,
            path: AppRoute.aTDH.path,
            builder: (context, state) => const AdventureToDexterHillPage(),
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
         GoRoute(
            name: AppRoute.aTDhEnd.name,
            path: AppRoute.aTDhEnd.path,
            builder: (context, state) => const EndOfGamePage(),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundPage(),
  );
}

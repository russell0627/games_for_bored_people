import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controllers/atdh_ctrl.dart';
import 'controllers/atdh_state.dart';

class StoryPage extends ConsumerWidget {
  final int pageNumber;
  final String pageAssetPath;

  const StoryPage({super.key, required this.pageNumber, required this.pageAssetPath});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        children: [
          Text("Page $pageNumber"),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(pageAssetPath),
                // fit: BoxFit.cover,
              ),
            ),
          ),
          TextButton(
              onPressed: () => ref.read(aTDhControllerProvider.notifier).move(Direction.north), child: const Text("Continue"))
        ],
      ),
    );
  }
}

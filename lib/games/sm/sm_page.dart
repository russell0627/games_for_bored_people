import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controllers/sm_ctrl.dart';

class SmPage extends ConsumerWidget {
  const SmPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(smCtrlProvider);
    final ctrl = ref.watch(smCtrlProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text("SM!"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Score: ${state.score}"),
            Row(
              children: [
                Image.asset(switch (state.space1) {
                  1 => "assets/sm/sm_1",
                  2 => "assets/sm/sm_2",
                  3 => "assets/sm/sm_3",
                  4 => "assets/sm/sm_4",
                  5 => "assets/sm/sm_5",
                  6 => "assets/sm/sm_6",
                  _ => "",
                }),
               Image.asset(switch (state.space2) {
                  1 => "assets/sm/sm_1",
                  2 => "assets/sm/sm_2",
                  3 => "assets/sm/sm_3",
                  4 => "assets/sm/sm_4",
                  5 => "assets/sm/sm_5",
                  6 => "assets/sm/sm_6",
                  _ => "",
                }),
               Image.asset(switch (state.space3) {
                  1 => "assets/sm/sm_1",
                  2 => "assets/sm/sm_2",
                  3 => "assets/sm/sm_3",
                  4 => "assets/sm/sm_4",
                  5 => "assets/sm/sm_5",
                  6 => "assets/sm/sm_6",
                  _ => "",
                }),
                TextButton(onPressed: () => {}, child: Text("Spin!"))
              ],
            )
          ],
        ),
      ),
    );
  }
}

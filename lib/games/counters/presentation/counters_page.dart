import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/screen_utils.dart';
import '../ctrl/counters_ctrl.dart';
import '../models/counter.dart';

class CountersPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(countersCtrlProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Counters"),
        actions: [
          IconButton(
              onPressed: () => SmartDialog.show(builder: (_) => NewCounterDialog(), clickMaskDismiss: false),
              icon: Icon(Icons.add))
        ],
      ),
      body: Center(
        child: ListView(
          children: [
            for (Counter counter in state.counters) CounterWidget(counter: counter),
          ],
        ),
      ),
    );
  }
}

class CounterWidget extends StatelessWidget {
  final Counter counter;

  const CounterWidget({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(counter.title),
        boxS,
        Text(counter.count.toString()),
      ],
    );
  }
}

class NewCounterDialog extends ConsumerStatefulWidget {
  const NewCounterDialog({super.key});

  @override
  ConsumerState<NewCounterDialog> createState() => _NewCounterDialogState();
}

class _NewCounterDialogState extends ConsumerState<NewCounterDialog> {
  String counterName = "";
  int counterStartingNumber = 0;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(countersCtrlProvider);
    final ctrl = ref.watch(countersCtrlProvider.notifier);

    return SimpleDialog(
      title: Text("Create New Counter!"),
      children: [
        TextField(
          onChanged: (value) => counterName = value,
        ),
        TextField(
          keyboardType: TextInputType.number,
          onChanged: (value) {
            counterStartingNumber = int.parse(value);
          },
        ),
        Row(
          children: [
            TextButton(
                onPressed: () {
                  ctrl.addCounter(title: counterName, startingNumber: counterStartingNumber);
                  context.pop();
                },
                child: Text("Add Counter")),
            TextButton(
              onPressed: () => context.pop(),
              child: Text("Cancel"),
            )
          ],
        )
      ],
    );
  }
}

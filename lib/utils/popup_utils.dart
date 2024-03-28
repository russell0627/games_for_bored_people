import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'utils.dart';

const dialogMaxWidth = 400.0;

Future<void> showConfirmDialog({required String message, required VoidCallback onConfirm}) {
  return SmartDialog.show(
    builder: (_) {
      return AlertDialog(
        title: const Text("Are you sure?"),
        content: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: dialogMaxWidth),
          child: Text(message),
        ),
        actions: [
          const TextButton(
            onPressed: SmartDialog.dismiss,
            child: Text("No"),
          ),
          TextButton(
            onPressed: () {
              onConfirm();
              SmartDialog.dismiss();
            },
            child: const Text("Yes"),
          ),
        ],
      );
    },
  );
}

void showStringInputDialog({
  required String title,
  required String label,
  String submitLabel = "Submit",
  String? initialValue,
  required ValueChanged<String> onInput,
  int maxLength = StringInputDialog.defaultMaxLength,
}) {
  SmartDialog.show(
    builder: (_) {
      return StringInputDialog(
        initialValue: initialValue,
        title: title,
        label: label,
        submitLabel: submitLabel,
        onInput: onInput,
        maxLength: maxLength,
      );
    },
  );
}

void showSuccessToast({required String msg, bool clickMaskDismiss = false, Duration displayTime = const Duration(seconds: 2)}) {
  SmartDialog.showNotify(msg: msg, notifyType: NotifyType.success, clickMaskDismiss: clickMaskDismiss, displayTime: displayTime);
}

void showErrorToast(String msg) {
  SmartDialog.showNotify(msg: msg, notifyType: NotifyType.error);
}

class StringInputDialog extends StatefulWidget {
  static const defaultMaxLength = 80;

  final String? initialValue;
  final String title;
  final String label;
  final String submitLabel;
  final ValueChanged<String> onInput;
  final int maxLength;

  const StringInputDialog({
    super.key,
    this.initialValue,
    required this.title,
    required this.label,
    required this.submitLabel,
    required this.onInput,
    this.maxLength = defaultMaxLength,
  });

  @override
  State<StringInputDialog> createState() => _StringInputDialogState();
}

class _StringInputDialogState extends State<StringInputDialog> {
  final ctrl = TextEditingController();
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    scheduleMicrotask(() {
      focusNode.requestFocus();

      if (widget.initialValue != null) {
        ctrl.text = widget.initialValue!;
      }

      ctrl.selectAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: dialogMaxWidth),
        child: TextFormField(
          controller: ctrl,
          autofocus: true,
          focusNode: focusNode,
          keyboardType: TextInputType.name,
          enableSuggestions: false,
          autocorrect: false,
          maxLength: widget.maxLength,
          decoration: InputDecoration(
            labelText: widget.label,
            isDense: true,
          ),
          onChanged: (value) {
            setState(() {});
          },
          onFieldSubmitted: (_) => _submit(),
        ),
      ),
      actions: [
        const TextButton(
          onPressed: SmartDialog.dismiss,
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: ctrl.text.trim().isNotEmpty ? _submit : null,
          child: Text(widget.submitLabel),
        ),
      ],
    );
  }

  void _submit() {
    final input = ctrl.text.trim();

    if (input.isNotEmpty) {
      widget.onInput(input);
    }

    SmartDialog.dismiss();
  }

  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }
}

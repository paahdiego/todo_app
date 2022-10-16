import 'package:flutter/material.dart';
import 'package:todo_app/modules/core/core.dart';

class NotesSectionHeader extends StatelessWidget {
  const NotesSectionHeader({
    Key? key,
    required this.onAdd,
  }) : super(key: key);

  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            "Notas",
            style: AppTextStyles.bodyText1(context)?.copyWith(fontSize: 24),
          ),
        ),
        const SizedBox(width: 20),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: onAdd,
          iconSize: 32,
          padding: EdgeInsets.zero,
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}

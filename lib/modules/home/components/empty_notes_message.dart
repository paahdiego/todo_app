import 'package:flutter/material.dart';
import 'package:todo_app/modules/core/core.dart';

class EmptyNotesMessage extends StatelessWidget {
  const EmptyNotesMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          "Nenhuma nota cadastrada",
          style: AppTextStyles.bodyText1(context),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Text('HomePage'),
            TextButton(
              onPressed: () {
                Modular.to.navigate('/');
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}

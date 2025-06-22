import 'package:flutter/material.dart';
import 'explicit_playground.dart';
import 'implicit_playground.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animation Playground')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ImplicitPlayground()),
              ),
              child: const Text('🔹 Playground: Implicit Animation'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ExplicitPlayground()),
              ),
              child: const Text('🔸 Playground: Explicit Animation'),
            ),
          ],
        ),
      ),
    );
  }
}

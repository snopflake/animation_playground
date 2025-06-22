import 'package:flutter/material.dart';

class ExplicitPlayground extends StatefulWidget {
  const ExplicitPlayground({super.key});

  @override
  State<ExplicitPlayground> createState() => _ExplicitPlaygroundState();
}

class _ExplicitPlaygroundState extends State<ExplicitPlayground> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));

    _fadeAnim = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _slideAnim = Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero).animate(_controller);
    _scaleAnim = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _run() => _controller.forward(from: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Explicit Animation Playground')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            FadeTransition(
              opacity: _fadeAnim,
              child: const FlutterLogo(size: 80),
            ),
            const SizedBox(height: 20),
            SlideTransition(
              position: _slideAnim,
              child: Container(
                height: 60,
                width: 150,
                color: Colors.orange,
                child: const Center(child: Text("SlideTransition")),
              ),
            ),
            const SizedBox(height: 20),
            ScaleTransition(
              scale: _scaleAnim,
              child: const Icon(Icons.star, size: 60, color: Colors.amber),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _run,
              child: const Text('Jalankan Animasi'),
            )
          ],
        ),
      ),
    );
  }
}

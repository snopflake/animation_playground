import 'package:flutter/material.dart';

class ImplicitPlayground extends StatefulWidget {
  const ImplicitPlayground({super.key});

  @override
  State<ImplicitPlayground> createState() => _ImplicitPlaygroundState();
}

class _ImplicitPlaygroundState extends State<ImplicitPlayground> {
  bool toggled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Implicit Animation Playground')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              width: toggled ? 200 : 100,
              height: 100,
              color: toggled ? Colors.blue : Colors.grey,
              child: const Center(child: Text("AnimatedContainer")),
            ),
            const SizedBox(height: 20),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: toggled ? 1.0 : 0.2,
              child: Container(
                height: 100,
                color: Colors.green,
                child: const Center(child: Text("AnimatedOpacity")),
              ),
            ),
            const SizedBox(height: 20),
            AnimatedAlign(
              duration: const Duration(milliseconds: 500),
              alignment: toggled ? Alignment.topRight : Alignment.bottomLeft,
              child: const FlutterLogo(size: 50),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => setState(() => toggled = !toggled),
              child: const Text('Toggle Animasi'),
            ),
          ],
        ),
      ),
    );
  }
}

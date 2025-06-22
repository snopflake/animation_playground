import 'package:animation_playground/widgets/glass_card.dart';
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            GlassCard(
              label: 'AnimatedContainer + easeInOut',
              child: (
                AnimatedContainer(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInOut,
                  width: toggled ? 200 : 100,
                  height: 100,
                  color: toggled ? Colors.blue : Colors.grey,
                  child: const Center(child: Text("AnimatedContainer")),
                )
              ),
            ),
            const SizedBox(height: 20),

            _buildLabel('AnimatedOpacity + bounceOut'),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 700),
              curve: Curves.bounceOut,
              opacity: toggled ? 1.0 : 0.2,
              child: Container(
                height: 100,
                color: Colors.green,
                child: const Center(child: Text("AnimatedOpacity")),
              ),
            ),
            const SizedBox(height: 20),

            _buildLabel('AnimatedAlign + elasticOut'),
            AnimatedAlign(
              duration: const Duration(milliseconds: 800),
              curve: Curves.elasticOut,
              alignment: toggled ? Alignment.topRight : Alignment.bottomLeft,
              child: const FlutterLogo(size: 50),
            ),
            const SizedBox(height: 20),

            _buildLabel('AnimatedPadding + easeOutBack'),
            AnimatedPadding(
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeOutBack,
              padding: toggled
                  ? const EdgeInsets.symmetric(horizontal: 50)
                  : const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                height: 60,
                width: double.infinity,
                color: Colors.purple,
                child: const Center(child: Text("AnimatedPadding")),
              ),
            ),
            const SizedBox(height: 20),

            _buildLabel('AnimatedCrossFade'),
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 500),
              firstChild: Container(
                width: 200,
                height: 80,
                color: Colors.orange,
                child: const Center(child: Text("First Widget")),
              ),
              secondChild: Container(
                width: 200,
                height: 80,
                color: Colors.teal,
                child: const Center(child: Text("Second Widget")),
              ),
              crossFadeState: toggled
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
            ),
            const SizedBox(height: 20),

            _buildLabel('AnimatedDefaultTextStyle'),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeIn,
              style: toggled
                  ? const TextStyle(
                      color: Colors.red,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    )
                  : const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
              child: const Text("AnimatedDefaultTextStyle"),
            ),
            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () => setState(() => toggled = !toggled),
              child: const Text('🔁 Toggle Semua Animasi'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.amber,
          )),
    );
  }
}

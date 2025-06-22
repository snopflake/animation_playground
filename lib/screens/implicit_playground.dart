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
          children: <Widget>[

            GlassCard(
              label: 'AnimatedContainer + easeInOut',
              child: 
                AnimatedContainer(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInOut,
                  width: toggled ? 200 : 100,
                  height: 100,
                  color: toggled ? Colors.blue : Colors.grey,
                  child: const Center(child: Text("AnimatedContainer")),
                )
            ),

            const SizedBox(height: 20),

            GlassCard(
              label: 'AnimatedOpacity + bounceOut',
              child: 
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
            ),

            const SizedBox(height: 20),

            GlassCard(
              label:'AnimatedAlign + elasticOut',
              child: 
                AnimatedAlign(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.elasticOut,
                  alignment: toggled ? Alignment.topRight : Alignment.bottomLeft,
                  child: const FlutterLogo(size: 50),
                ),
            ),
            
            const SizedBox(height: 20),

            GlassCard(
              label: 'AnimatedPadding + easeOutBack',
              child: 
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
            ),

            const SizedBox(height: 20),

            GlassCard(
              label: 'AnimatedCrossFade',
              child: 
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
            ),

            const SizedBox(height: 20),

            GlassCard(
              label: 'AnimatedDefaultTextStyle',
              child: 
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeIn,
                  style: toggled
                      ? const TextStyle(
                          color: Colors.red,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        )
                      : const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                  child: const Text("AnimatedDefaultTextStyle"),
                ),
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

}

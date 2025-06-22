import 'package:animation_playground/widgets/glass_card.dart';
import 'package:flutter/material.dart';

class ExplicitPlayground extends StatefulWidget {
  const ExplicitPlayground({super.key});

  @override
  State<ExplicitPlayground> createState() => _ExplicitPlaygroundState();
}

class _ExplicitPlaygroundState extends State<ExplicitPlayground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;
  late Animation<double> _scaleAnim;
  late Animation<double> _rotateAnim;
  late Animation<double> _sizeAnim;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 800));

    _fadeAnim = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _slideAnim = Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _scaleAnim = Tween<double>(begin: 0.5, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _rotateAnim = Tween<double>(begin: 0.0, end: 2 * 3.1416).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    
    _sizeAnim = Tween<double>(begin: 0.2, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut),);
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            GlassCard(
              label: 'FadeTransition',
              child: FadeTransition(
                opacity: _fadeAnim,
                child: const FlutterLogo(size: 80),
              ),
            ),

            const SizedBox(height: 20),

            GlassCard(
              label: 'SlideTransition + easeOut',
              child: SlideTransition(
                position: _slideAnim,
                child: Container(
                  height: 60,
                  width: 150,
                  color: Colors.orange,
                  child: const Center(child: Text("SlideTransition")),
                ),
              ),
            ),

            const SizedBox(height: 20),

            GlassCard(
              label: 'ScaleTransition + elasticOut',
              child: ScaleTransition(
                scale: _scaleAnim,
                child: const Icon(Icons.star, size: 60, color: Colors.amber),
              ),
            ),

            const SizedBox(height: 20),

            GlassCard(
              label: 'RotationTransition',
              child: RotationTransition(
                turns: _rotateAnim,
                child: const Icon(Icons.sync, size: 60, color: Colors.cyan),
              ),
            ),

            const SizedBox(height: 20),

            GlassCard(
              label: 'SizeTransition + easeInOut',
              child: SizeTransition(
                sizeFactor: _sizeAnim,
                axis: Axis.vertical,
                axisAlignment: -1.0,
                child: Container(
                  width: 200,
                  height: 80,
                  color: Colors.pinkAccent,
                  child: const Center(child: Text("SizeTransition")),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 2 Contoh di bawah ini udh mulai implement AnimatedBuilder -------------

            GlassCard(
              label: 'AnimatedBuilder (Rotate + Scale)',
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _rotateAnim.value,
                    child: Transform.scale(
                      scale: _scaleAnim.value,
                      child: child,
                    ),
                  );
                },
                child: const Icon(Icons.flutter_dash, size: 60, color: Colors.blueAccent),
              ),
            ),

            const SizedBox(height: 20),

            GlassCard(
              label: 'Fill From Top (AnimatedBuilder)',
              child: SizedBox(
                height: 100,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [

                    Container(color: Colors.blue.shade700),

                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: 100 * _controller.value, // Tinggi isi kuning (100 biar full)
                            color: Colors.amber,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),


            const SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _run,
        icon: const Icon(Icons.play_arrow),
        label: const Text('Jalankan Animasi'),
        backgroundColor: Colors.indigo,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:staggered_animations_sample/stagger_single_page/children/stagger_single_animations.dart';

class StaggerSinglePage extends StatefulWidget {
  @override
  _StaggerSinglePageState createState() => _StaggerSinglePageState();
}

class _StaggerSinglePageState extends State<StaggerSinglePage>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _playAnimation() async {
    await _controller.forward();
    await _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Staggered Single Animation')),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => _playAnimation(),
        child: Center(
          child: Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(color: Colors.black.withOpacity(0.5)),
            ),
            child: StaggerSingleAnimation(_controller),
          ),
        ),
      ),
    );
  }
}

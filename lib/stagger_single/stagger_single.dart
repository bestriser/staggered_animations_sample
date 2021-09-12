import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:staggered_animations_sample/stagger_single/children/stagger_animation.dart';

class StaggerSingle extends StatefulWidget {
  @override
  _StaggerSingleState createState() => _StaggerSingleState();
}

class _StaggerSingleState extends State<StaggerSingle>
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
  // ...Boilerplate...

  Future<void> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0; // 1.0 is normal animation speed.
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
            child: StaggerAnimation(_controller),
          ),
        ),
      ),
    );
  }
}

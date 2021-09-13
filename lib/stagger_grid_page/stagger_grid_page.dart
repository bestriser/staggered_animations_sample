import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:staggered_animations_sample/stagger_grid_page/children/stagger_grid_animations.dart';

class StaggerGridPage extends StatefulWidget {
  @override
  _StaggerGridPageState createState() => _StaggerGridPageState();
}

class _StaggerGridPageState extends State<StaggerGridPage>
    with TickerProviderStateMixin {
  final List<String> _dummyItems = ['a', 'b', 'c', 'd'];
  late List<AnimationController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      _dummyItems.length,
      (i) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1000),
      ),
    );
  }

  @override
  void dispose() {
    for (final _controller in _controllers) {
      _controller.dispose();
    }
    super.dispose();
  }

  // ...Boilerplate...

  Future<void> _playAnimations() async {
    try {
      for (final _controller in _controllers) {
        await _controller.forward().orCancel;
        await _controller.reverse().orCancel;
      }
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0; // 1.0 is normal animation speed.
    return Scaffold(
      appBar: AppBar(title: const Text('Staggered Grid Animation')),
      body: Center(
        child: GestureDetector(
          onTap: () => _playAnimations(),
          child: Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(color: Colors.black.withOpacity(0.5)),
            ),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
              ),
              itemCount: _dummyItems.length,
              itemBuilder: (BuildContext context, int index) {
                return StaggerGridAnimations(_controllers[index]);
              },
            ),
          ),
        ),
      ),
    );
  }
}

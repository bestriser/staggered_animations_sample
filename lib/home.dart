import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:staggered_animations_sample/stagger_grid/stagger_grid.dart';
import 'package:staggered_animations_sample/stagger_single/stagger_single.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Staggered Animation')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Single'),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => StaggerSingle(),
                ),
              ),
            ),
            const Gap(8),
            ElevatedButton(
              child: Text('Grid'),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => StaggerGrid(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

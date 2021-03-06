import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:staggered_animations_sample/stagger_grid_page/stagger_grid_page.dart';
import 'package:staggered_animations_sample/stagger_single_page/stagger_single_page.dart';

class HomePage extends StatelessWidget {
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
              onPressed: () => Get.to(() => StaggerSinglePage()),
            ),
            const Gap(8),
            ElevatedButton(
              child: Text('Grid'),
              onPressed: () => Get.to(() => StaggerGridPage()),
            ),
          ],
        ),
      ),
    );
  }
}

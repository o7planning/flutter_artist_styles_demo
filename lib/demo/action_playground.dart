import 'package:flutter/material.dart';
import 'package:flutter_artist_styles/flutter_artist_styles.dart';

import 'helper.dart';

class ActionPlayground extends StatelessWidget {
  const ActionPlayground();

  @override
  Widget build(BuildContext context) {
    final faColors = context.faColors;

    return ListView(
      children: [
        buildHeader(
          'Action Token Rule Pairings',
          'Demonstrating precise interaction states without semantic leaking.',
        ),
        const SizedBox(height: 20),

        /// Rule 1: Normal Background Pairings
        buildCategoryTitle('1. Standard Fill + On-Fill Ink Pairings'),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: faColors.action.fill.primary,
              ),
              onPressed: () {},
              child: Text(
                'Primary',
                style: TextStyle(color: faColors.action.ink.onPrimaryFill),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: faColors.action.fill.secondary,
              ),
              onPressed: () {},
              child: Text(
                'Secondary',
                style: TextStyle(color: faColors.action.ink.onSecondaryFill),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: faColors.action.fill.danger,
              ),
              onPressed: () {},
              child: Text(
                'Danger',
                style: TextStyle(color: faColors.action.ink.onDangerFill),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),

        /// Rule 2: Reverse Contrast Pairings
        buildCategoryTitle('2. Reverse Fill + Inherited Ink Pairings'),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: faColors.action.fill.reversePrimary,
              ),
              onPressed: () {},
              child: Text(
                'Rev Primary',
                style: TextStyle(color: faColors.action.ink.primary),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: faColors.action.fill.reverseSecondary,
              ),
              onPressed: () {},
              child: Text(
                'Rev Secondary',
                style: TextStyle(color: faColors.action.ink.secondary),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),

        buildCategoryTitle('3. Transparent Background (Ghost) + Ink Pairings'),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Ghost Primary',
                style: TextStyle(color: faColors.action.ink.primary),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Ghost Secondary',
                style: TextStyle(color: faColors.action.ink.secondary),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Ghost Danger',
                style: TextStyle(color: faColors.action.ink.danger),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

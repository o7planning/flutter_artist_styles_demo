import 'package:flutter/material.dart';
import 'package:flutter_artist_styles/flutter_artist_styles.dart';

import 'helper.dart';

class SurfacePlayground extends StatelessWidget {
  const SurfacePlayground({super.key});

  @override
  Widget build(BuildContext context) {
    final faColors = context.faColors;

    return ListView(
      children: [
        buildHeader(
          'Surface & Content Structure',
          'Static presentation components mapped safely to global tokens.',
        ),
        const SizedBox(height: 20),

        /// Standard Container / Card Showcase
        Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: faColors.surface.standard,
            border: Border.all(color: faColors.stroke.medium, width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Surface Standard Box',
                style: TextStyle(
                  color: faColors.ink.primary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'This text uses ink.primary tokens. Below is a subtle divider and a section using muted typography traits.',
                style: TextStyle(color: faColors.ink.secondary),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Divider(color: faColors.divider.subtle, height: 1),
              ),
              Text(
                'Metadata text formatted inside the card ecosystem.',
                style: TextStyle(color: faColors.ink.muted, fontSize: 12),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        /// Emphasized Container Surface Block
        Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: faColors.surface.emphasized,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            'Surface Emphasized Container without solid borders.',
            style: TextStyle(color: faColors.ink.primary),
          ),
        ),
      ],
    );
  }
}

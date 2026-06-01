import 'package:flutter/material.dart';
import 'package:flutter_artist_styles/flutter_artist_styles.dart';
import 'package:flutter_artist_styles_inspector/flutter_artist_styles_inspector.dart';
import 'package:flutter_left_right_container/left_right_container.dart';

import 'demo/action_playground.dart';
import 'demo/selection_playground.dart';
import 'demo/surface_playground.dart';

class ShowcaseScreen extends StatefulWidget {
  const ShowcaseScreen({super.key});

  @override
  State<ShowcaseScreen> createState() => _ShowcaseScreenState();
}

class _ShowcaseScreenState extends State<ShowcaseScreen> {
  int _selectedSectionIndex = 0;

  final List<String> _sections = [
    'Action Demo',
    'Surface Demo',
    'Selection Demo',
  ];

  @override
  Widget build(BuildContext context) {
    final faColors = context.faColors;

    return Scaffold(
      backgroundColor: faColors.surface.ground,
      appBar: AppBar(
        backgroundColor: faColors.bar.standard,
        title: Text(
          'FaColors Ecosystem Showcase',
          style: TextStyle(
            color: faColors.ink.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          /// Action button to open the external style inspector dialog
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: TextButton.icon(
              style: TextButton.styleFrom(
                backgroundColor: faColors.action.fill.secondary,
              ),
              icon: Icon(
                Icons.tune_rounded,
                color: faColors.action.ink.onSecondaryFill,
              ),
              label: Text(
                'Open Inspector',
                style: TextStyle(color: faColors.action.ink.onSecondaryFill),
              ),
              onPressed: () => _openStylesInspector(context),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: LeftRightContainer(
          fixedSizeWidth: 240,
          minSideWidth: 360,
          spacing: 1,
          start: _buildLeft(context),
          end: _buildRight(context),
        ),
      ),
    );
  }

  Widget _buildLeft(BuildContext context) {
    final faColors = context.faColors;

    return Container(
      color: faColors.surface.subtle,
      child: ListView.builder(
        itemCount: _sections.length,
        itemBuilder: (context, index) {
          final isSelected = _selectedSectionIndex == index;
          return GestureDetector(
            onTap: () => setState(() => _selectedSectionIndex = index),
            child: Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 14.0,
              ),
              decoration: BoxDecoration(
                color: isSelected
                    ? faColors.selection.rowSelected
                    : faColors.selection.rowNormal,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                _sections[index],
                style: TextStyle(
                  color: isSelected
                      ? faColors.selection.inkSelected
                      : faColors.selection.inkNormal,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRight(BuildContext context) {
    return Container(
      color: context.faColors.surface.ground,
      padding: const EdgeInsets.all(24.0),
      child: IndexedStack(
        index: _selectedSectionIndex,
        children: const [
          ActionPlayground(),
          SurfacePlayground(),
          SelectionPlayground(),
        ],
      ),
    );
  }

  void _openStylesInspector(BuildContext context) {
    FaColorsInspectorDialog.show(context);
  }
}

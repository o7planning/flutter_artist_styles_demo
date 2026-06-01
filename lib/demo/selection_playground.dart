import 'package:flutter/material.dart';
import 'package:flutter_artist_styles/flutter_artist_styles.dart';

import 'helper.dart';

class SelectionPlayground extends StatelessWidget {
  const SelectionPlayground();

  @override
  Widget build(BuildContext context) {
    final faColors = context.faColors;

    return ListView(
      children: [
        buildHeader(
          'Selection & Row Manifest',
          'Dedicated tokens optimized for processing grid, table, and row selection states.',
        ),
        const SizedBox(height: 20),

        _buildSelectionRow(
          'Idle Row Style',
          faColors.selection.rowNormal,
          faColors.selection.inkNormal,
        ),
        const SizedBox(height: 10),
        _buildSelectionRow(
          'Hovered State Mock',
          faColors.selection.rowHover,
          faColors.selection.inkNormal,
        ),
        const SizedBox(height: 10),
        _buildSelectionRow(
          'Pressed / Active State Mock',
          faColors.selection.rowPressed,
          faColors.selection.inkNormal,
        ),
        const SizedBox(height: 10),
        _buildSelectionRow(
          'Selected Active Row Instance',
          faColors.selection.rowSelected,
          faColors.selection.inkSelected,
        ),
        const SizedBox(height: 10),
        _buildSelectionRow(
          'Current Processing Focus Row',
          faColors.selection.rowCurrent,
          faColors.selection.inkCurrent,
        ),
      ],
    );
  }

  Widget _buildSelectionRow(String label, Color bg, Color ink) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(color: ink, fontWeight: FontWeight.w500),
          ),
          Icon(Icons.check_circle_outline, color: ink, size: 20),
        ],
      ),
    );
  }
}

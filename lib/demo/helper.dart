import 'package:flutter/material.dart';

Widget buildHeader(String title, String subtitle) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 4),
      Text(subtitle, style: const TextStyle(fontSize: 14, color: Colors.grey)),
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Divider(height: 1),
      ),
    ],
  );
}

Widget buildCategoryTitle(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12.0),
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.blueGrey,
      ),
    ),
  );
}

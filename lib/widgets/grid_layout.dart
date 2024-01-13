import 'package:flutter/material.dart';

class GridLayout extends StatelessWidget {
  final int width;
  final List<Widget> children;

  const GridLayout({super.key, this.width = 3, required this.children}) :
        assert(children.length % width == 0, "GridLayout rows must be of equal width.");

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < children.length; i += width)
          _rowBuilder(i, i + width)
      ],
    );
  }

  Widget _rowBuilder(int min, int max) {
    return Expanded(
      child: Row(
        children: [
          for (int i = min; i < max; i++)
            Expanded(child: children[i])
        ],
      ),
    );
  }
}

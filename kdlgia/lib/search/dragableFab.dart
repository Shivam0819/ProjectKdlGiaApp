import 'package:flutter/material.dart';

class DraggableFab extends StatefulWidget {
  @override
  _DraggableFabState createState() => _DraggableFabState();
}

class _DraggableFabState extends State<DraggableFab> {
  Offset position = Offset(100, 100);
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: position.dx,
          top: position.dy,
          child: Draggable(
            feedback: buildFab(),
            childWhenDragging: Container(),
            onDragEnd: (details) {
              setState(() {
                position = details.offset;
              });
            },
            child: buildFab(),
          ),
        ),
      ],
    );
  }

  Widget buildFab() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isExpanded) ...[
            FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
              mini: true,
            ),
            SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.message),
              mini: true,
            ),
            SizedBox(height: 10),
          ],
          FloatingActionButton(
            onPressed: () {},
            child: Icon(isExpanded ? Icons.close : Icons.menu),
          ),
        ],
      ),
    );
  }
}

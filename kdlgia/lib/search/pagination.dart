import 'package:flutter/material.dart';

class PaginationRow extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final ValueChanged<int> onPageChanged;

  PaginationRow({
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Previous Button
        if (currentPage > 1)
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => onPageChanged(currentPage - 1),
          ),

        // Page Numbers
        for (int i in _getDisplayedPages(currentPage, totalPages))
          Card(
            child: InkWell(
              onTap: () => onPageChanged(i),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '$i',
                  style: TextStyle(
                    color: i == currentPage ? Colors.blue : Colors.black,
                    fontWeight: i == currentPage ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),

        // Next Button
        if (currentPage < totalPages)
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () => onPageChanged(currentPage + 1),
          ),
      ],
    );
  }

  List<int> _getDisplayedPages(int currentPage, int totalPages) {
    List<int> pages = [];
    if (totalPages <= 5) {
      for (int i = 1; i <= totalPages; i++) {
        pages.add(i);
      }
    } else {
      pages.add(1);
      if (currentPage > 3) {
        pages.add(-1); // Indicate "..."
      }
      for (int i = currentPage - 1; i <= currentPage + 1; i++) {
        if (i > 1 && i < totalPages) {
          pages.add(i);
        }
      }
      if (currentPage < totalPages - 2) {
        pages.add(-1); // Indicate "..."
      }
      pages.add(totalPages);
    }
    return pages;
  }
}

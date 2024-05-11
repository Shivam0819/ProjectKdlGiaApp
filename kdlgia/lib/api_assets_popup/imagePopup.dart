import 'package:flutter/material.dart';

class ImagePopup extends StatelessWidget {
  final String imageUrl;

  const ImagePopup({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop(); // Close the dialog when tapped outside
      },
      child: Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(imageUrl),
          ],
        ),
      ),
    );
  }
}

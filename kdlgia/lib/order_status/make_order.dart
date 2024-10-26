
import 'package:flutter/material.dart';
import 'package:kdlgia/cart/cartApi.dart';
import 'package:kdlgia/order_status/orderPage.dart';

void _showOrderDialog(BuildContext context, String token, String subide) {
  final TextEditingController receiverController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController note = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Submit Order'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: receiverController,
              decoration: const InputDecoration(
                labelText: 'Cart Receiver Name',
              ),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'Cart Phone',
              ),
              keyboardType: TextInputType.phone,
            ),
            TextField(
              controller: note,
              decoration: const InputDecoration(
                labelText: 'Note',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Handle submission here
              String receiverName = receiverController.text;
              String phone = phoneController.text;
              String user_note= note.text;
              // Validate inputs and submit order
              if (receiverName.isNotEmpty && phone.isNotEmpty) {
                submitOrder(token, subide, receiverName, phone,cart_note: user_note);
                var snackBar =
                    SnackBar(content: Text("Order Placed Successfully"));

                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OrderPage(token: token)),
                    (route) => false);
              } else {
                // Show error if inputs are invalid
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please fill in all fields')),
                );
              }
            },
            child: Text('Submit'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
        ],
      );
    },
  );
}

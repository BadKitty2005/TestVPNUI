import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final String title;
  final String message;

  const EmptyState({Key? key, required this.title, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: 'Inter',
              ),
            ),
            SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 0.8), // rgba с alpha, тк у меня не работает withOpacity
                fontSize: 14.5,
                fontWeight: FontWeight.w400,
                fontFamily: 'Inter',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
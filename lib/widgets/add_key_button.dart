import 'package:flutter/material.dart';

class AddKeyButton extends StatelessWidget {
  final double width;
  final VoidCallback? onTap;

  const AddKeyButton({Key? key, required this.width, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        width: width,
        height: 65,
        decoration: BoxDecoration(
          color: Color(0xFF1D58E5),
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.center,
        child: Text(
          'Добавить ключ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
          ),
        ),
      ),
    );
  }
}

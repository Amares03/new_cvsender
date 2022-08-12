import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:get/get.dart';
import 'package:todo/ui/theme.dart';

class BottomSheetButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color bColor;
  final String text;
  final bool? isColor;
  final BuildContext context;

  const BottomSheetButton(
      {Key? key,
      required this.onTap,
      required this.bColor,
      required this.text,
      this.isColor,
      required this.context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 4,
        ),
        height: 55,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: bColor,
            border: Border.all(
                width: 2,
                color: isColor == null ? bColor : Colors.grey.shade300)),
        child: Center(
          child: Text(
            text,
            style: isColor == null
                ? titleStyle.copyWith(color: Colors.white)
                : titleStyle,
          ),
        ),
      ),
    );
  }
}

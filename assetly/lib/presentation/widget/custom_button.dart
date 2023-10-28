import 'package:assetly/core/helper/constants_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.text,
    this.fill = true,
    this.border,
    this.elevation = 5,
    this.textColor = Colors.white,
  });

  final Function()? onPressed;
  final String text;
  final OutlinedBorder? border;
  final bool fill;
  final double elevation;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 49,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: fill ? primaryColor : Colors.transparent,
          shape: border,
          elevation: elevation,
        ),
        child: Text(text,
            style: GoogleFonts.inter().copyWith(
                fontSize: 14, fontWeight: FontWeight.w600, color: textColor)),
      ),
    );
  }
}

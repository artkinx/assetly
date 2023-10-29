import 'package:assetly/core/helper/constants_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.text,
    this.fill = true,
    this.border,
    this.elevation = 5,
    this.textColor = Colors.white,
    this.xcontext,
  });

  final Function()? onPressed;
  final String text;
  final OutlinedBorder? border;
  final bool fill;
  final double elevation;
  final Color textColor;
  final BuildContext? xcontext;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    if (widget.xcontext != null) {
      context = widget.xcontext!;
    }
    return SizedBox(
      height: 49,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.fill ? primaryColor : Colors.transparent,
          shape: widget.border,
          elevation: widget.elevation,
        ),
        child: Text(widget.text,
            style: GoogleFonts.inter().copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: widget.textColor)),
      ),
    );
  }
}

buildCustomButton({
  final Function()? onPressed,
  final String text = "",
  final OutlinedBorder? border,
  final bool fill = true,
  final double elevation = 4,
  final Color textColor = Colors.white,
  final BuildContext? xcontext,
}) {
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

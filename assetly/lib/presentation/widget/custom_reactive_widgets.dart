import 'package:assetly/core/helper/constants_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomReactiveTextInput extends StatefulWidget {
  const CustomReactiveTextInput(
      {super.key, required this.controlName, this.prefix, this.onChanged});
  final String controlName;
  final Widget? prefix;
  final Function(FormControl<Object?>)? onChanged;

  @override
  State<CustomReactiveTextInput> createState() =>
      _CustomReactiveTextInputState();
}

class _CustomReactiveTextInputState extends State<CustomReactiveTextInput> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 74,
      child: ReactiveTextField(
        formControlName: widget.controlName,
        controller: TextEditingController(),
        onChanged: widget.onChanged,
        validationMessages: {
          "number": (error) {
            print(error);
            return "Incorrect phone number! Try again";
          }
        },
        // showErrors: (control) => true,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: "Phone number",
            hintStyle: GoogleFonts.inter().copyWith(
              color: greyColor,
            ),
            prefixIcon: widget.prefix),
      ),
    );
  }
}

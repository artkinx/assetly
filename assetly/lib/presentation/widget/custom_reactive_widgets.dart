import 'package:assetly/core/helper/constants_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomReactiveTextInput extends StatefulWidget {
  const CustomReactiveTextInput(
      {super.key,
      required this.controlName,
      this.prefix,
      this.onChanged,
      this.hintText});
  final String controlName;
  final Widget? prefix;
  final Function(FormControl<Object?>)? onChanged;
  final String? hintText;

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
            hintText: widget.hintText,
            errorStyle: GoogleFonts.inter().copyWith(height: 0.2),
            hintStyle: GoogleFonts.inter().copyWith(
              color: greyColor,
            ),
            prefixIcon: widget.prefix),
      ),
    );
  }
}

class CustomReactiveTextWithLabel extends StatefulWidget {
  const CustomReactiveTextWithLabel({
    super.key,
    required this.controlName,
    this.prefix,
    this.onChanged,
    required this.labelText,
    this.labelTextAlign = TextAlign.left,
    this.hintText,
  });
  final String controlName;
  final Widget? prefix;
  final Function(FormControl<Object?>)? onChanged;
  final String labelText;
  final TextAlign labelTextAlign;
  final String? hintText;
  @override
  State<CustomReactiveTextWithLabel> createState() =>
      _CustomReactiveTextWithLabelState();
}

class _CustomReactiveTextWithLabelState
    extends State<CustomReactiveTextWithLabel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 14,
        ),
        Text(
          widget.labelText,
          style: GoogleFonts.inter(),
          textAlign: widget.labelTextAlign,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 64,
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
                isDense: true,
                errorStyle: GoogleFonts.inter().copyWith(height: 0.2),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                hintText: widget.hintText,
                hintStyle: GoogleFonts.inter().copyWith(
                  color: greyColor,
                ),
                prefixIcon: widget.prefix),
          ),
        ),
      ],
    );
  }
}

class CustomReactiveDropdown extends StatefulWidget {
  const CustomReactiveDropdown(
      {super.key,
      required this.controlName,
      this.prefix,
      this.onChanged,
      required this.labelText,
      required this.items,
      this.hintText});
  final String controlName;
  final Widget? prefix;
  final Function(FormControl<Object?>)? onChanged;
  final String labelText;
  final String? hintText;
  final List<DropdownMenuItem<Object?>> items;
  @override
  State<CustomReactiveDropdown> createState() => _CustomReactiveDropdownState();
}

class _CustomReactiveDropdownState extends State<CustomReactiveDropdown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 14,
        ),
        Text(
          widget.labelText,
          style: GoogleFonts.inter(),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 64,
          child: ReactiveDropdownField(
            formControlName: widget.controlName,
            items: widget.items,
            onChanged: widget.onChanged,
            validationMessages: {
              "number": (error) {
                print(error);
                return "Incorrect phone number! Try again";
              }
            },
            // showErrors: (control) => true,
            decoration: InputDecoration(
                errorStyle: GoogleFonts.inter().copyWith(height: 0.2),
                filled: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                hintText: widget.hintText,
                hintStyle: GoogleFonts.inter().copyWith(
                  color: greyColor,
                ),
                prefixIcon: widget.prefix),
          ),
        ),
      ],
    );
  }
}

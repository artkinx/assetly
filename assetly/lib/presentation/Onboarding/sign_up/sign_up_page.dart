import 'package:assetly/core/forms/onboarding_forms.dart';
import 'package:assetly/core/helper/constants_helper.dart';
import 'package:assetly/presentation/Onboarding/sign_in/sign_in_page.dart';
import 'package:assetly/presentation/widget/custom_button.dart';
import 'package:assetly/presentation/widget/custom_reactive_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 48, 18, 0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: SvgPicture.asset("assets/logoonly.svg")),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Personal Details",
              style: GoogleFonts.inter()
                  .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.2,
              child: Text(
                "Kindly Fill in the information below to complete your registration",
                style: GoogleFonts.inter().copyWith(
                  color: greyColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ReactiveFormBuilder(
              form: OnboardingForms.buildProfileUpdateGroup,
              builder: (_, fg, child) => Column(
                children: [
                  const CustomReactiveTextWithLabel(
                      controlName: "fName", labelText: "First name"),
                  const CustomReactiveTextWithLabel(
                      controlName: "lName", labelText: "Last name"),
                  const CustomReactiveTextWithLabel(
                      controlName: "bvn", labelText: "Bvn (11 Digits)"),
                  const CustomReactiveTextWithLabel(
                      controlName: "email", labelText: "Email"),
                  const CustomReactiveDropdown(items: [
                    DropdownMenuItem(value: "Male", child: Text("Male")),
                    DropdownMenuItem(value: "Female", child: Text("Female")),
                  ], controlName: "gender", labelText: "Gender"),
                  const SizedBox(
                    height: 20,
                  ),
                  ReactiveFormConsumer(
                      builder: (_, fg, child) => CustomButton(
                            onPressed: fg.hasErrors ? null : () {},
                            text: "Complete",
                          )),
                  const SizedBox(
                    height: 18,
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const SignInPage())),
                    child: Text.rich(TextSpan(
                        text: "You have an account? ",
                        style: GoogleFonts.inter().copyWith(color: greyColor),
                        children: [
                          TextSpan(
                              text: "Login",
                              style: GoogleFonts.inter().copyWith(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w700))
                        ])),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

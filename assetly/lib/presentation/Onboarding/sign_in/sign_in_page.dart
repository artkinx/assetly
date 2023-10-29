import 'package:assetly/core/forms/onboarding_forms.dart';
import 'package:assetly/core/helper/constants_helper.dart';
import 'package:assetly/presentation/Onboarding/register/register_page.dart';
import 'package:assetly/presentation/widget/custom_button.dart';
import 'package:assetly/presentation/widget/custom_reactive_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 48, 18, 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: SvgPicture.asset("assets/logoonly.svg")),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Login",
              style: GoogleFonts.inter()
                  .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.2,
              child: Text(
                "Kindly Fill in the information below to enter into your account",
                style: GoogleFonts.inter().copyWith(
                  color: greyColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 29,
            ),
            ReactiveFormBuilder(
                form: OnboardingForms.buildSignInGroup,
                builder: (_, fg, child) => Column(children: [
                      const CustomReactiveTextWithLabel(
                        controlName: "phone",
                        labelText: "Phone Number",
                        hintText: "Enter your phone number",
                      ),
                      const CustomReactiveTextWithLabel(
                        controlName: "passCode",
                        labelText: "Passcode",
                        hintText: "Enter your passcode",
                      ),
                      Row(
                        children: [
                          ReactiveCheckbox(
                            formControlName: "rMe",
                          ),
                          Text(
                            "Remember Me",
                            style:
                                GoogleFonts.inter().copyWith(color: greyColor),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      ReactiveFormConsumer(
                        builder: (_, fg, child) => CustomButton(
                          text: "Continue",
                          onPressed: fg.hasErrors ||
                                  fg.controls.entries.any(
                                      (a) => a.value.value.toString().isEmpty)
                              ? null
                              : () {},
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      InkWell(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => const RegisterPage())),
                        child: Text.rich(TextSpan(
                            text: "Don't have an account? ",
                            style:
                                GoogleFonts.inter().copyWith(color: greyColor),
                            children: [
                              TextSpan(
                                  text: "Register",
                                  style: GoogleFonts.inter().copyWith(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w700))
                            ])),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SvgPicture.asset("assets/biometrics.svg")
                    ]))
          ],
        ),
      ),
    ));
  }
}

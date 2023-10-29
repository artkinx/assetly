import 'package:assetly/core/helper/constants_helper.dart';
import 'package:assetly/presentation/Onboarding/register/register_page.dart';
import 'package:assetly/presentation/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 13,
          ),
          SvgPicture.asset(
            "assets/logoonly.svg",
            height: 40,
          ),
          const SizedBox(
            height: 53,
          ),
          Center(
            child: SvgPicture.asset(
              "assets/landing_one.svg",
              height: 422.57,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            // color: Colors.red,
            width: MediaQuery.sizeOf(context).width / 1.5,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text(
                  "Let's get started",
                  style: GoogleFonts.inter()
                      .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Join us now and enjoy our financial services",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter().copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: smallTextColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19.0),
            child: CustomButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RegisterPage())),
                text: "Get Started"),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19.0),
            child: CustomButton(
              onPressed: () {},
              text: "Login",
              fill: false,
              elevation: 0,
              textColor: primaryColor,
              border: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                  side: const BorderSide(color: primaryColor)),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:assetly/core/forms/onboarding_forms.dart';
import 'package:assetly/core/helper/constants_helper.dart';
import 'package:assetly/core/helper/loading_helper.dart';
import 'package:assetly/presentation/Onboarding/register/bloc/register_bloc.dart';
import 'package:assetly/presentation/widget/custom_button.dart';
import 'package:assetly/presentation/widget/custom_reactive_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  void initState() {
    context.read<RegisterBloc>().add(const RegisterGetCountryListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state.loadingCountryList is LoadingProcessing) {
            //display loader
          }
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 13,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: SvgPicture.asset(
                        "assets/arrow-circle-left.svg",
                        height: 30,
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/logoonly.svg",
                      height: 40,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 53,
              ),
              SvgPicture.asset(
                "assets/rafikireg.svg",
              ),
              const SizedBox(
                height: 53,
              ),
              Container(
                // color: Colors.red,
                width: MediaQuery.sizeOf(context).width / 1.5,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      "Registration",
                      style: GoogleFonts.inter()
                          .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Enter your mobile number to Receive a verification code ",
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
                child: _buildInputSection(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildInputSection(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(top: 32, left: 24, right: 24, bottom: 32),
    decoration: BoxDecoration(
      boxShadow: const [
        BoxShadow(
          blurRadius: 19,
          blurStyle: BlurStyle.outer,
          color: Colors.black12,
        ),
      ],
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    child: ReactiveForm(
      formGroup: OnboardingForms.buildTelGroup(),
      child: Column(
        children: [
          CustomReactiveTextInput(
            controlName: "tel",
            onChanged: (val) => context
                .read<RegisterBloc>()
                .add(RegisterChangingPhoneNumberEvent(val.value.toString())),
            prefix: SizedBox(
              width: 127,
              child: Row(children: [
                const SizedBox(
                  width: 15,
                ),
                SvgPicture.asset(
                  "assets/Nigeria.svg",
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "+234",
                  style: GoogleFonts.inter().copyWith(
                    color: greyColor,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(
                  FontAwesomeIcons.angleDown,
                  color: greyColor,
                  size: 15,
                ),
                const SizedBox(width: 10),
                const SizedBox(
                  height: 20,
                  child: VerticalDivider(
                    width: 2,
                    color: greyColor,
                  ),
                )
              ]),
            ),
          ),
          const SizedBox(
            height: 19,
          ),
          BlocBuilder<RegisterBloc, RegisterState>(
            buildWhen: (previous, current) {
              return previous.isValid != current.isValid;
            },
            builder: (context, state) {
              return CustomButton(
                  onPressed: state.isValid ? () {} : null, text: "Get code");
            },
          )
        ],
      ),
    ),
  );
}

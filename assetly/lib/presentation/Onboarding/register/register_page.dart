import 'package:assetly/core/forms/onboarding_forms.dart';
import 'package:assetly/core/helper/constants_helper.dart';
import 'package:assetly/core/helper/loading_helper.dart';
import 'package:assetly/presentation/Onboarding/register/bloc/register_bloc.dart';
import 'package:assetly/presentation/Onboarding/sign_up/sign_up_page.dart';
import 'package:assetly/presentation/widget/custom_button.dart';
import 'package:assetly/presentation/widget/custom_reactive_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reactive_pin_code_fields/reactive_pin_code_fields.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  void initState() {
    context.read<RegisterBloc>().add(const RegisterGetCountryListEvent());

    // EasyLoading.dismiss();
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
            EasyLoading.show();
          }

          if (state.loadingCountryList is LoadingSuccess) {
            EasyLoading.dismiss();
          }

          if (state.loadingCountryList is LoadingFailure) {
            EasyLoading.dismiss();
          }

          if (state.loadingGetOtp is LoadingProcessing) {
            EasyLoading.show();
          }
          if (state.loadingGetOtp is LoadingFailure) {
            displayInfo("Oops! Something went wrong.", true);
          }
          if (state.loadingGetOtp is LoadingSuccess) {
            // displayInfo("Success", false);

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Center(
                  child: Text(
                state.loadingGetOtp.message,
                style: GoogleFonts.inter().copyWith(color: Colors.white),
              )),
              backgroundColor: Colors.green,
            ));
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
                child: BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        Text(
                          state.pageIndex > 0 ? "Confirmation" : "Registration",
                          style: GoogleFonts.inter().copyWith(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        state.pageIndex > 0
                            ? Text.rich(TextSpan(
                                text: "Enter a 4-digit code that was sent to",
                                style: GoogleFonts.inter().copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: smallTextColor,
                                ),
                                children: [
                                    TextSpan(
                                        text: state.phoneNumber,
                                        style: GoogleFonts.inter().copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: smallTextColor,
                                        ))
                                  ]))
                            : Text(
                                "Enter your mobile number to Receive a verification code ",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter().copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: smallTextColor,
                                ),
                              ),
                      ],
                    );
                  },
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
    child: BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return state.pageIndex > 0
            ? _buildSubSection1(context)
            : ReactiveFormBuilder(
                form: OnboardingForms.buildTelGroup,
                builder: (_, fg, child) => Column(
                  children: [
                    Visibility(
                        visible: false,
                        child: ReactiveTextField(
                          formControlName: "otp",
                        )),
                    CustomReactiveTextInput(
                      controlName: "tel",
                      onChanged: (val) => context.read<RegisterBloc>().add(
                          RegisterChangingPhoneNumberEvent(
                              val.value.toString())),
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
                    ReactiveFormConsumer(
                      builder: (_, fg, child) => CustomButton(
                          onPressed: !fg.hasErrors
                              ? () => state.pageIndex > 0
                                  ? () {}
                                  : context
                                      .read<RegisterBloc>()
                                      .add(const RegisterGetOtpEvent())
                              : null,
                          text: "Get code"),
                    )
                  ],
                ),
              );
      },
    ),
  );
}

Widget _buildSubSection1(BuildContext context) {
  return ReactiveFormBuilder(
    form: OnboardingForms.buildOtpGroup,
    builder: (context, fg, child) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ReactivePinCodeTextField<String>(
              pinTheme: const PinTheme.defaults(),
              length: 4,
              formControlName: "otp",
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(
            height: 33,
          ),
          ReactiveFormConsumer(
            builder: (_, fg, child) => CustomButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const SignUpPage())),
                text: "Confirm code"),
          )
        ],
      );
    },
  );
}

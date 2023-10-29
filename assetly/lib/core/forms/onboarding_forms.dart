import 'package:reactive_forms/reactive_forms.dart';

class OnboardingForms {
  static FormGroup buildTelGroup() => fb.group(<String, Object>{
        "tel": FormControl(validators: [Validators.number]),
        "otp": FormControl<String>(),
      });
  static FormGroup buildOtpGroup() =>
      fb.group(<String, Object>{"otp": FormControl<String>()});

  static FormGroup buildProfileUpdateGroup() => fb.group(<String, Object>{
        "fName": FormControl<String>(),
        "lName": FormControl<String>(),
        "bvn": FormControl<int>(),
        "email": FormControl<String>(),
        "gender": FormControl<String>(),
      });

  static FormGroup buildSignInGroup() => fb.group(<String, Object>{
        "phone":
            FormControl<String>(value: "", validators: [Validators.required]),
        "passCode":
            FormControl<String>(value: "", validators: [Validators.required]),
        "rMe": FormControl<bool>(value: false),
      });
}

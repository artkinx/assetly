import 'package:reactive_forms/reactive_forms.dart';

class OnboardingForms {
  static FormGroup buildTelGroup() => fb.group(<String, Object>{
        "tel": FormControl(validators: [Validators.number])
      });
}

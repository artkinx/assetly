part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {
  const RegisterEvent();
}

class RegisterChangingPhoneNumberEvent extends RegisterEvent {
  final String phoneNumber;
  const RegisterChangingPhoneNumberEvent(this.phoneNumber);
}

class RegisterGetCountryListEvent extends RegisterEvent {
  const RegisterGetCountryListEvent();
}

class RegisterGetOtpEvent extends RegisterEvent {
  const RegisterGetOtpEvent();
}

class RegisterVerifyOtpEvent extends RegisterEvent {
  const RegisterVerifyOtpEvent();
}

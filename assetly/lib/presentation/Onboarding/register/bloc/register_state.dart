part of 'register_bloc.dart';

@immutable
class RegisterState {
  final List<dynamic> countryList;
  final dynamic selectedCountry;
  final String phoneNumber;
  final LoadingHelper loadingCountryList;
  final LoadingHelper loadingGetOtp;

  bool get isValid => phoneNumber.trim().isNotEmpty;

  const RegisterState({
    this.countryList = const [],
    this.selectedCountry = "",
    this.phoneNumber = "",
    this.loadingCountryList = const LoadingInitial(),
    this.loadingGetOtp = const LoadingInitial(),
  });

  RegisterState copyWith({
    List<dynamic>? countryList,
    dynamic selectedCountry,
    String? phoneNumber,
    LoadingHelper? loadingCountryList,
    LoadingHelper? loadingGetOtp,
  }) {
    return RegisterState(
      countryList: countryList ?? this.countryList,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      loadingCountryList: loadingCountryList ?? this.loadingCountryList,
      loadingGetOtp: loadingGetOtp ?? this.loadingGetOtp,
    );
  }
}

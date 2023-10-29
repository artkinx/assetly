// ignore_for_file: constant_identifier_names

enum AuthOperations {
  OtpRequest,
  OtpVerify,
  GetProfile,
  Login,
  GetToken,
  SignUp
}

class UrlHelper {
  static const String _baseUrl = "https://api.mid.health/api/assetly";
  static final authUrls = <int, String>{
    0: "$_baseUrl/auth/otp/request-otp?{0}",
    1: "$_baseUrl/auth/otp/verify-otp?phone={0}&otp={1}",
    2: "$_baseUrl/auth/profile",
    3: "$_baseUrl/auth/login",
    4: "$_baseUrl/auth/get-token",
    5: "$_baseUrl/auth/register",
  };

  static const String _countryBaseUrl =
      "https://api.countrystatecity.in/v1/countries";
}

final countryHeader = <String, String>{
  "X-CSCAPI-KEY": "TUQ3R0dkMlJtWm5oQlNmM2U3cG5WaGQxVDdNaXRKTVBMRmlLUFNtYg"
};

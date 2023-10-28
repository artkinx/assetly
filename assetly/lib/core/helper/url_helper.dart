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
  static final authUrls = <int, String>{
    0: "/auth/otp/request-otp?{0}",
    1: "/auth/otp/verify-otp?phone={0}&otp={1}",
    2: "/auth/profile",
    3: "/auth/login",
    4: "/auth/get-token",
    5: "/auth/register",
  };
}

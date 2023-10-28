class ResponseBase {
  String? message;

  ResponseBase({this.message});

  ResponseBase.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}

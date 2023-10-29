class CountryResponse {
  List<String?>? callingCodes;
  String? alpha2Code;
  String? alpha3Code;
  String? name;
  String? flag;

  CountryResponse(
      {this.callingCodes,
      this.alpha2Code,
      this.alpha3Code,
      this.name,
      this.flag});

  CountryResponse.fromJson(Map<String, dynamic> json) {
    if (json['callingCodes'] != null) {
      callingCodes = <String>[];
      json['callingCodes'].forEach((v) {
        callingCodes!.add(v);
      });
    }
    alpha2Code = json['alpha2Code'];
    alpha3Code = json['alpha3Code'];
    name = json['name'];
    flag = json['flag'];
  }
}

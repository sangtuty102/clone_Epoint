class LoginResponse {
  LoginResponse({
    this.code,
    this.data,
  });

  int code;
  dynamic data;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        code: json["Code"],
        data: json["Data"],
      );

  Map<String, dynamic> toJson() => {
        "Code": code,
        "Data": data.toJson(),
      };
}

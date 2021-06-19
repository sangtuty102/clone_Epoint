class BaseResponse {
  int status;
  String message;
  String subMessage;

  BaseResponse({
    this.status,
    this.message,
    this.subMessage,
  });

  BaseResponse fromJson(Map<String, dynamic> json) => BaseResponse(
        status: json["status"],
        message: json["message"],
        subMessage: json["subMessage"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "subMessage": subMessage,
      };
}

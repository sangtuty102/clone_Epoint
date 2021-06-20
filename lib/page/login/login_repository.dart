import 'package:clone_epoint/base/base.dart';
import 'package:clone_epoint/page/login/login_model.dart';
import 'package:get/get.dart';

class LoginRepository {
  BaseRequest _baseRequest = Get.find();
// demo: request
  Future<LoginResponse> sendLogin(String phone, String password) async {
    var response = await _baseRequest.sendRequest(
        '/sangth/login', RequestMethod.POST,
        jsonMap: {"sdt": phone, "mk": password});
    return response == null
        ? LoginResponse()
        : LoginResponse.fromJson(response);
  }
}

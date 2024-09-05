import 'dart:convert';
import 'dart:developer';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:http/http.dart' as http;
import '../components/toast.dart';
import '../core/config/config.dart';

abstract class XApi {
  static post({endpoint, data, headers}) async {
    var url = XConstants.secure ? Uri.https(XConstants.apiDomain, 'apis/v1/core$endpoint') : Uri.http(XConstants.apiDomain, 'apis/v1/core$endpoint');
    log(url.toString());
    var body = json.encode(data);
    log(body);
    var response = await http.post(url, body: body, headers: headers ?? {});
    log(response.body);
    SmartDialog.dismiss();
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else {
      var responseBody = json.decode(response.body);
      SmartDialog.showToast('',
          builder: (_) =>
              XToast(msg: responseBody['message'].toString(), type: 'danger'),
          displayTime: const Duration(seconds: 4));
      return null;
    }
  }

  static get({endpoint, headers, params, showAlert=true}) async {
    var url =
    XConstants.secure ? Uri.https(XConstants.apiDomain, 'apis/v1/core$endpoint', params ?? {}) : Uri.http(XConstants.apiDomain, 'apis/v1/core$endpoint', params ?? {});
    log(url.toString());
    var response = await http.get(
      url,
      headers: headers ?? {},
    );
    log(response.body);
    SmartDialog.dismiss();
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else {
      var responseBody = json.decode(response.body);
      if (showAlert) {
        SmartDialog.showToast('',
            builder: (_) =>
                XToast(msg: responseBody['message'].toString(), type: 'danger'),
            displayTime: const Duration(seconds: 4));
      }
      return null;
    }
  }

  static delete({endpoint, headers, params}) async {}

  static patch({endpoint, data, headers}) async {
    var url =XConstants.secure ? Uri.https(XConstants.apiDomain, 'apis/v1/core$endpoint') : Uri.http(XConstants.apiDomain, 'apis/v1/core$endpoint');
    var body = json.encode(data);
    var response = await http.patch(url, body: body, headers: headers ?? {});
    log(response.body);
    SmartDialog.dismiss();
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else {
      var responseBody = json.decode(response.body);
      SmartDialog.showToast('',
          builder: (_) =>
              XToast(msg: responseBody['message'].toString(), type: 'danger'),
          displayTime: const Duration(seconds: 4));
      return null;
    }
  }

  static upload({endpoint, headers, files}) async {
    var request = http.MultipartRequest("POST",
        Uri.parse('${XConstants.secure ? 'https' : 'http'}://${XConstants.apiDomain}/apis/v1/core$endpoint'));
    request.headers['authorization'] = headers['Authorization'];
    for (int x = 0; x < files.length; x++) {
      var file = await http.MultipartFile.fromPath("files", files[x].path);
      request.files.add(file);
    }
    var response = await request.send();
    SmartDialog.dismiss();

    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    return jsonDecode(responseString);
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../model/data/api.dart';
import '../view/res/strings.dart';

extension Margin on num {
  SizedBox get mh => SizedBox(
        height: toDouble(),
      );

  SizedBox get mw => SizedBox(
        width: toDouble(),
      );
}

extension Http on Response {
  Map<String, String> data() {
    if (statusCode == 200) {
      return {
        StringManager.status: ApiStatus.success.name,
        StringManager.data: body
      };
    } else {
      return {
        StringManager.status: ApiStatus.fail.name,
        StringManager.data: body
      };
    }
  }
}

extension Error on Object {
  Map<String, String> message() => {
        StringManager.status: ApiStatus.fail.name,
        StringManager.data: toString()
      };
}

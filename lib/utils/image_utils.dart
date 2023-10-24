import 'package:flutter/material.dart';
import 'package:rainbow/constants/network_constants.dart';

class ImageUtil {
  static getNetworkImage(String name) {
    String url = "$imageBase/$name?raw=true";
    print('url');
    print(url);
    return Padding(
      padding: EdgeInsets.only(bottom: 2),
      child: Image.network(
        url,
      ),
    );
  }
}

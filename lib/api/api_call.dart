import 'package:flutter/foundation.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart' as http;
import 'package:rainbow/api/api_handler.dart';
import 'package:rainbow/api/model/resource_model.dart';
import 'dart:convert' as convert;

import 'package:rainbow/constants/network_constants.dart';

class ApiCall {
  ApiHandler apiHandler = ApiHandler();
 Future<ProductDetails?> getResources(String url) async {
   var response = await http.get(Uri.parse(resourceBaseUrl));
   if(apiHandler.handleApi(response) != null){
     return compute(welcomeFromJson,response.body);
   }else{
     return null;
   }
  }
}
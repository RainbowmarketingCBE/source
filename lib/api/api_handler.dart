import 'package:http/src/response.dart';

class ApiHandler{
  handleApi(Response? response) {
    if(response != null){
      if(response.statusCode == 200){
        return response.body;
      }else{
        return null;
      }
    }else{
      return null;
    }
  }
}
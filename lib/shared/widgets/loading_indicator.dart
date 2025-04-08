import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

Future<void> loadingIndicator()async{
  return await Future.delayed(Duration(seconds:2),(){
    EasyLoading.show(status:'Loading...',indicator:CircularProgressIndicator());
  });
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void manageHttpResponse({
  required http.Response response,
  required BuildContext context,

// the context is to show snackbar
  required VoidCallback onSuccess, //it will callback to excute on a successfull response
}) {
  //switch statement to handle different status codes http
  switch (response.statusCode){
    case 200: // sucess navigate to next page
      onSuccess();
      break;
    case 400:
      showSnackBar(context, json.decode(response.body)['msg']);
      break;
    case 500: //indicate server error
      showSnackBar(context, json.decode(response.body)['error']);
      break;
    case 201: //indicate a resource was created
      onSuccess();
      break;

  }
}



void showSnackBar(BuildContext context,String title){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
}


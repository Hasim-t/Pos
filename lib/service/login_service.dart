import 'dart:convert';
import 'dart:developer';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:posdelivery/model/login_model.dart';
import 'package:posdelivery/model/order_list_model.dart';
import 'package:posdelivery/model/student_list_model.dart';
import 'package:posdelivery/view/screen/home_screen.dart';
import 'package:posdelivery/view/screen/sussces_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? api;

LoginModel? loginModel;
OrderListModel? orderListModel;
StudentModel? studentModel;

submitmail(
    TextEditingController emaill, TextEditingController passsword) async {
  try {
    final email = emaill.text;
    final pass = md5.convert(utf8.encode(passsword.text)).toString();

    final body = {"username": email, "password": pass};
    const url = 'https://apiqa-pos.docme.online/api/login';
    final uri = Uri.parse(url);

    final responce = await http.post(
      uri,
      body: jsonEncode(body),
    );

    if (responce.statusCode == 200) {
      final responsdata = jsonDecode(responce.body);
      log(responce.headers.toString());
      loginModel = LoginModel.fromJson(responsdata);

      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString('api_key', loginModel!.data.apikey);
      await pref.setBool('isLogin', true);
      Get.off(const HomeScreen());
    }
    api ??= loginModel!.data.apikey;
    log(api.toString());
  } catch (e) {
    log(e.toString());
  }
}

Map<String, String>? headerdata;
getorderlist() async {
  try {
    const url = 'https://apiqa-pos.docme.online/api/get_classroom_order_data';
    final uri = Uri.parse(url);
    SharedPreferences pref = await SharedPreferences.getInstance();
    final apipass = pref.getString('api_key');
    Map<String, String> header = {
      'Authorization': 'Bearer $apipass',
      'Content-Type': 'application/json',
      'x-store-id': '122'
    };
    final responce = await http.post(uri, headers: header);
    if (responce.statusCode == 200) {
      final responcedata = jsonDecode(responce.body);
      orderListModel = OrderListModel.fromJson(responcedata);
    }
  } catch (e) {
    log('Getorderlist ' + e.toString());
  }
}

getstudentdeteals(String studentId) async {
  try {
    const url = 'https://apiqa-pos.docme.online/api/get_student_data';
    final uri = Uri.parse(url);
    Map<String, String> body = {"student_id": studentId};
    SharedPreferences pref = await SharedPreferences.getInstance();
    final apipass = pref.getString('api_key');
    Map<String, String> header = {
      'Authorization': 'Bearer $apipass',
      'Content-Type': 'application/json',
      'x-store-id': '122'
    };
    final responce =
        await http.post(uri, body: jsonEncode(body), headers: header);

    if (responce.statusCode == 200) {
      final responsedata = jsonDecode(responce.body);
      studentModel = StudentModel.fromJson(responsedata);
    }
  } catch (e) {
    log("GetStudent Errro : ${e.toString()}");
  }
}

submitOrder( Datum student,
    String orderId, String Status, String itemId, String itmeCount) async {
  const url = 'https://apiqa-pos.docme.online/api/save_delivery_orders';
  final uri = Uri.parse(url);
  final body = {
    "order_id": orderId,
    "payment_method": "Credit Card",
    "delivery_method": "Home Delivery",
    "status": Status,
    "items": [
      {"item_id": itemId, "item_count": itmeCount},

    ]
  };
  SharedPreferences pref = await SharedPreferences.getInstance();
  final apipass = pref.getString('api_key');
  Map<String, String> header = {
    'Authorization': 'Bearer $apipass',
    'Content-Type': 'application/json',
    'x-store-id': '122'
  };

  try {
    final response =
        await http.post(uri, headers: header, body: jsonEncode(body));

    if (response.statusCode == 200) {
      Get.off(SusscesScreen(
        studentData: student,
      ));
    }
    log(response.statusCode.toString());
  } catch (e) {}
}

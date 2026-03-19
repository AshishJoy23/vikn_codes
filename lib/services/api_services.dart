import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vikn_codes/constants/api_endpoints.dart';
import 'package:vikn_codes/main.dart';
import 'package:vikn_codes/model/profile_model.dart';
import 'package:vikn_codes/model/sales_model.dart';

class APIServices {
  Future<bool> fetchLoginCredential(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    log('message');
    log(Uri.parse(kLoginUrl).toString());
    try {
      var response = await http.post(
        Uri.parse(kLoginUrl),
        body: {"username": username, "password": password, "is_mobile": 'true'},
      );
      log(response.toString());
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        log(body.toString());
        await prefs.setString('token', body['data']['access']);
        await prefs.setInt('userId', body['data']['user_id']);
        token = prefs.getString('token');
        userId = prefs.getInt('userId');
        log('\\\\\\\\\\\\\\\\\\\\\\\\');
        log(token!);
        log('$userId!');

        return true;
      } else {
        log('Error: ${response.statusCode.toString()}');
        return false;
      }
    } catch (e) {
      log('message');
      log(e.toString());
      return false;
    }
  }

  Future<ProfileModel?> fetchProfileData() async {
    try {
      var response = await http.get(
        Uri.parse('$kProfileUrl/$userId/'),
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        var body = await json.decode(response.body);
        log('???????????????????');
        log(body.toString());
        ProfileModel profile = ProfileModel.fromJson(body);
        log('name ${profile.name!}');
        log('photo ${profile.photo!}');
        log("mail ${profile.email!}");
        return profile;
      } else {
        log('Error: ${response.statusCode.toString()}');
        return null;
      }
    } catch (e) {
      log('Exception in profile fetch: $e');
      return null;
    }
  }

  Future<List<SalesModel>?> fetchAllSalesList() async {
    try {
      var response = await http.post(
        Uri.parse(kSalesListUrl),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "BranchID": 1,
          "CompanyID": "1901b825-fe6f-418d-b5f0-7223d0040d08",
          "CreatedUserID": userId,
          "PriceRounding": 2,
          "page_no": 2,
          "items_per_page": 10,
          "type": "Sales",
          "WarehouseID": 1,
        }),
      );
      log(']]]]]]]]]]]]]]]]]]]]]]]]]]]]');
      log(response.toString());
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        var body = await json.decode(response.body);
        List<SalesModel> invoices = List.from(
          body['data'].map((invoice) {
            return SalesModel.fromJson(invoice);
          }),
        );
        return invoices;
      } else {
        log('Error: ${response.statusCode.toString()}${response.reasonPhrase}');
        return null;
      }
    } catch (e) {
      log('Exception in invoices fetch: $e');

      return null;
    }
  }
}

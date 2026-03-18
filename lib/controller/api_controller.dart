import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vikn_codes/constants/api_endpoints.dart';
import 'package:vikn_codes/main.dart';
import 'package:vikn_codes/model/profile_model.dart';

class APIController {
  Future<bool> getLoginCredential(String username, String password) async {
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
        await prefs.setString('userId', body['data']['user_id'].toString());
        token = prefs.getString('token');
        userId = prefs.getString('userId');
        log('\\\\\\\\\\\\\\\\\\\\\\\\');
        log(token!);
        log(userId!);
        var response2 = await http.get(
          Uri.parse('$kProfileUrl/$userId/'),
          headers: {'Authorization': 'Bearer $token'},
        );
        log(response2.body.toString());
        log(response2.statusCode.toString());
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

  Future<ProfileModel?> getProfileData() async {
    try {
      var response = await http.get(
        Uri.parse('$kProfileUrl/$userId/'),
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        var body = await json.decode(response.body);
        log(body.toString());
        ProfileModel profile = ProfileModel.fromJson(body['data']);
        return profile;
      } else {
        log('Error: ${response.statusCode.toString()}');
        return null;
      }
    } catch (e) {
      log('Exception in branch fetch: $e');
      return null;
    }
  }

  // Future<List<TreatmentModel>?> fetchAllTreatments() async {
  //   try {
  //     var response = await http.get(
  //       Uri.parse(kTreatmentsUrl),
  //       headers: {
  //         'Authorization':
  //             'Bearer $token'
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       var body = await json.decode(response.body);
  //       List<TreatmentModel> treatments = List.from(body['treatments']
  //           .map((treatment) => TreatmentModel.fromJson(treatment)));
  //       return treatments;
  //     } else {
  //       log('Error: ${response.statusCode.toString()}');
  //       return null;
  //     }
  //   } catch (e) {
  //     log('Exception in branch fetch: $e');
  //     return null;
  //   }
  // }

  // Future<List<PatientModel>?> fetchAllPatients() async {
  //   try {
  //     var response = await http.get(
  //       Uri.parse(kPatientsUrl),
  //       headers: {
  //         'Authorization':
  //             'Bearer $token'
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       var body = await json.decode(response.body);
  //       List<PatientModel> patients = List.from(
  //           body['patient'].map((patient) {
  //             return PatientModel.fromJson(patient);}));
  //       return patients;
  //     } else {
  //       log('Error: ${response.statusCode.toString()}${response.reasonPhrase}');
  //       return null;
  //     }
  //   } catch (e) {
  //     log('Exception in branch fetch: $e');
  //     return null;
  //   }
  // }

  // Future<bool> createNewRegistration(RegistrationModel newPatient) async {
  //   try {
  //     var response = await http.post(
  //       Uri.parse(kPatientRegistrationUrl),
  //       headers: {
  //         'Authorization':
  //             'Bearer $token'
  //       },
  //       body: newPatient.toJson(),
  //     );
  //     log(response.statusCode.toString());
  //     if (response.statusCode == 200) {
  //       var body = await json.decode(response.body);
  //       log(body['message']);
  //       return true;
  //     } else {
  //       log('Error: ${response.statusCode.toString()}${response.reasonPhrase}');
  //       return false;
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //     return false;
  //   }
  // }
}

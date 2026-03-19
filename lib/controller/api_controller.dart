import 'dart:developer';

import 'package:get/get.dart';
import 'package:vikn_codes/model/profile_model.dart';
import 'package:vikn_codes/model/sales_model.dart';
import 'package:vikn_codes/services/api_services.dart';

class APIController extends GetxController {
  var salesList = <SalesModel>[].obs;
  var filteredSalesList = <SalesModel>[].obs;
  var profileData = ProfileModel().obs;
  var isLoadingProfile = false.obs;
  var isLoadingInvoices = false.obs;
  var isSalesDataAvailable = false.obs;
  var isProfileDataAvailable = false.obs;

  var isVerified = false.obs;

  Future<void> getLoginCredential(String username, String password) async {
    final response = await APIServices().fetchLoginCredential(
      username,
      password,
    );
    if (response) {
      isVerified.value = true;
    } else {
      isVerified.value = false;
    }
  }

  Future<void> getAllSalesList() async {
    isLoadingInvoices.value = true;
    final response = await APIServices().fetchAllSalesList();
    if (response != null) {
      log('controller get all /////////////');
    log(salesList.length.toString());
    log(salesList.toString());
      salesList.value = response;
      filteredSalesList.clear();
      filteredSalesList.value = response;
      isSalesDataAvailable.value = true;
    } else {
      isSalesDataAvailable.value = false;
    }
    isLoadingInvoices.value = false;
  }

  Future<void> getProfileData() async {
    isLoadingProfile.value = true;
    final response = await APIServices().fetchProfileData();
    if (response != null) {
      profileData.value = response;
      isProfileDataAvailable.value = true;
    } else {
      isProfileDataAvailable.value = false;
    }
    isLoadingProfile.value = false;
  }

  void getfilteredInvoices(String searchQuery) {
    log('controller  search/////////////');
    log(salesList.length.toString());
    log(salesList.toString());
    if (searchQuery.isEmpty) {
      filteredSalesList.value = salesList;
      return;
    }
    final q = searchQuery.toLowerCase();
    filteredSalesList.value = salesList
        .where(
          (inv) =>
              inv.invoiceNo!.toLowerCase().contains(q) ||
              inv.customerName!.toLowerCase().contains(q),
        )
        .toList();
  }
}

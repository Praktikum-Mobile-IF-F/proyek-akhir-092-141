import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_prak_tpm/controller/SharedPreferenceController.dart';
import 'package:project_prak_tpm/main.dart';
import 'package:project_prak_tpm/model/BundleModel.dart';
import 'package:project_prak_tpm/model/PurchaseHistoryModel.dart';
import 'package:intl/intl.dart';
import 'package:project_prak_tpm/utils/notification/NotificationService.dart';

class HistoryController {
  late List<PurchaseHistoryModel> purchaseHistory;
  String userEmail =
  SharedPreferenceController.sharedPrefData.getString('email')!;
  HistoryController() {
    checkNull();
  }

  void setHistory(BundleData bundleData, BuildContext context) {
    DateTime timeNow = DateTime.now().toUtc();

    try {
      PurchaseHistoryModel historyData = PurchaseHistoryModel(bundleName: bundleData.name!, price: bundleData.price!.toString(), purchasedAt: DateFormat('yyyy-MM-dd').format(timeNow));
      purchaseHistory.add(historyData);
      print("HISTORY LOGIC: success");
      NotificationService().showNotification(title: 'ValorantApp', body: "Purchased Success");
      dataBox.put('$userEmail-history', purchaseHistory);
      SnackBar snackBar =
      const SnackBar(content: Text("Purchase Success"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    catch(err) {
      print(err);
      NotificationService().showNotification(title: 'ValorantApp', body: "Purchased Failed");
    }
  }

  List<PurchaseHistoryModel> getHistoryData(){
    return purchaseHistory;
  }

  void checkNull(){
    var storedHistory = dataBox.get('$userEmail-history');

    if (storedHistory == null) {
      purchaseHistory = [];
    } else {
      purchaseHistory = List<PurchaseHistoryModel>.from(storedHistory);
    }
  }
}

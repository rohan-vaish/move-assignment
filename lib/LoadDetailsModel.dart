import 'dart:convert';

import 'package:flutter/services.dart' as root_Bundle;

class LoadDetailsModel {
  int? id;
  String? pickupAdd;
  int? status;
  String? dropAdd;
  String? truckFare;
  String? totalDistance;
  String? weight;
  String? amount;
  String? truckNo;
  String? driver;
  String? driverPhone;

  LoadDetailsModel(
      {this.id,
      this.pickupAdd,
      this.status,
      this.dropAdd,
      this.truckFare,
      this.totalDistance,
      this.weight,
      this.amount,
      this.truckNo,
      this.driver,
      this.driverPhone});

  LoadDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pickupAdd = json['pickupAdd'];
    status = json['status'];
    dropAdd = json['dropAdd'];
    truckFare = json['truckFare'];
    totalDistance = json['totalDistance'];
    weight = json['weight'];
    amount = json['amount'];
    truckNo = json['truckNo'];
    driver = json['driver'];
    driverPhone = json['driverPhone'];
  }

  Future<LoadDetailsModel> loadDetails() async {
    final data = await root_Bundle.rootBundle.loadString('jsonData/loads.json');
    return LoadDetailsModel.fromJson(jsonDecode(data));
  }
}

class LoadDataModel {
  int? id;
  String? price;
  int? status;
  String? pickupLoc;
  String? pickupTime;
  String? pickupDate;
  String? dropLoc;
  String? dropTime;
  String? dropDate;

  LoadDataModel(
      {this.id,
      this.price,
      this.status,
      this.pickupLoc,
      this.pickupTime,
      this.pickupDate,
      this.dropLoc,
      this.dropTime,
      this.dropDate});

  LoadDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    status = json['status'];
    pickupLoc = json['pickupLoc'];
    pickupTime = json['pickupTime'];
    pickupDate = json['pickupDate'];
    dropLoc = json['dropLoc'];
    dropTime = json['dropTime'];
    dropDate = json['dropDate'];
  }
}

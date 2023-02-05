class DriverModel {
  bool? status;
  List<DriverList>? driverList;

  DriverModel({this.status, this.driverList});

  DriverModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['driver_list'] != null) {
      driverList = <DriverList>[];
      json['driver_list'].forEach((v) {
        driverList!.add(DriverList.fromJson(v));
      });
    }
  }
}

class DriverList {
  int? id;
  String? name;
  String? mobile;
  String? licenseNo;

  DriverList({this.id, this.name, this.mobile, this.licenseNo});

  DriverList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    licenseNo = json['license_no'];
  }
}

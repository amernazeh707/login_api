class UserLoginModel {
  bool? flag;
  String? message;
  UserData? data;

  UserLoginModel.jsonData(Map<String, dynamic> json) {
    flag = json['flag'];
    message = json['message'];
    data = UserData.jsonData(json['data']);
  }
}

class UserData {
  List<DataData> data = [];

  UserData.jsonData(List<dynamic> json) {
    for (var element in json) {
      data.add(DataData.data(element));
    }
  }
}

class DataData {
  int? id;
  String? userName;
  String? pass;
  String? name;
  String? checkPoint;

  DataData.data(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userName = json['userName'];
    pass = json['pass'];
    checkPoint = json['checkPoint'];
  }
}

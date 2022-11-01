class CatsModel {
  String? description;
  String? imageUrl;
  int? statusCode;

  CatsModel({this.description, this.imageUrl, this.statusCode});

  CatsModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    imageUrl = json['imageUrl'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    data['statusCode'] = statusCode;
    return data;
  }
}

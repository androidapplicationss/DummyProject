class UrlModel {
  int? status;
  String? url;
  String? message;

  UrlModel({this.status, this.url, this.message});

  UrlModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    url = json['url'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['url'] = this.url;
    data['message'] = this.message;
    return data;
  }
}
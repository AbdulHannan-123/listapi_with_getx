import 'package:get/state_manager.dart';

class Temperatures {
  String? name;
  int? id;
  String? consistency;
  String? original;
  String? image;

  Temperatures({this.name, this.id, this.consistency, this.original, this.image});

  var isFavorite = false.obs;

  Temperatures.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    id = json['id'];
    consistency = json['consistency'];
    original = json['original'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['id'] = this.id;
    data['consistency'] = this.consistency;
    data['original'] = this.original;
    return data;
  }
}
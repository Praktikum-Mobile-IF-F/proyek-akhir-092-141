class BundleModel {
  BundleModel({
    required this.message,
    required this.data,
  });

  final String? message;
  final List<BundleData> data;

  factory BundleModel.fromJson(Map<String, dynamic> json){
    return BundleModel(
      message: json["message"],
      data: json["data"] == null ? [] : List<BundleData>.from(json["data"]!.map((x) => BundleData.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.map((x) => x.toJson()).toList(),
  };

}

class BundleData {
  BundleData({
    required this.id,
    required this.name,
    required this.image,
    required this.splashImage,
    required this.price,
  });

  final int? id;
  final String? name;
  final String? image;
  final String? splashImage;
  final int? price;

  factory BundleData.fromJson(Map<String, dynamic> json){
    return BundleData(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      splashImage: json["splashImage"],
      price: json["price"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "splashImage": splashImage,
    "price": price,
  };

}
